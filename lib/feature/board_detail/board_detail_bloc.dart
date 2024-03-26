import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/arguments/detail_card_argument.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/feature/board_detail/enum/board_detail_app_bar_enum.dart';
import 'package:task_manager/feature/board_detail/extension/board_detail_card_extention.dart';
import 'package:task_manager/feature/board_detail/extension/board_detail_list_extention.dart';
import 'package:task_manager/feature/board_detail/extension/board_detail_subscription_extension.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_show_list_bottom_widget.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/update_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/get_lists.graphql.dart';
import 'package:task_manager/graphql/Subscriptions/detail_board.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/widgets/dialog_show/alert_dialog_widget.dart';

class BoardDetailBloc extends BlocBase {
  final Ref ref;

  Fragment$BoardFragment boardFragment;

  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final boardBloc = ref.read(BlocProvider.board);
  late final localStorage = ref.read(AppService.localStorage);

  late final currentBoardSubject =
      BehaviorSubject<Fragment$BoardFragment>.seeded(boardFragment);

  final isDraggingCardSubject = BehaviorSubject<bool>.seeded(false);
  final isDraggingListSubject = BehaviorSubject<bool>.seeded(false);

  final indexAddCardSubject = BehaviorSubject<int?>.seeded(null);

  final listFragmentsSubject =
      BehaviorSubject<List<Fragment$ListFragment?>>.seeded([]);

  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingAddSubject = BehaviorSubject<bool>.seeded(false);

  final isZoomSubject = BehaviorSubject<bool>.seeded(false);

  final addListController = TextEditingController();
  final addCardController = TextEditingController();

  final scrollListController = ScrollController();

  final searchTextSubject = BehaviorSubject<String>.seeded('');

  final titleBoardSubject = BehaviorSubject<String>.seeded('');
  final titleListEditSubject = BehaviorSubject<String>.seeded('');

  final idListEditSubject = BehaviorSubject<String?>.seeded(null);

  final isDragCardMoveContainerDeleteSubject =
      BehaviorSubject<bool>.seeded(false);

  final appBarEnumSubject =
      BehaviorSubject<BoardDetailAppBarEnum?>.seeded(null);

  StreamSubscription<QueryResult<Subscription$DetailBoard>>? subscription;

  List<Fragment$ListFragment?> listFragmentsCurrent = [];

  Future<void> fetchListFragmentByIdBoard() async {
    final result = await graphqlService.client.mutate$getList(
      Options$Mutation$getList(
        variables: Variables$Mutation$getList(
          idBoard: currentBoardSubject.value.id,
        ),
      ),
    );
    if (result.hasException || result.parsedData == null) return;
    listFragmentsSubject.value = result.parsedData?.getLists ?? [];
    listFragmentsCurrent = result.parsedData?.getLists ?? [];
  }

  Future<void> init() async {
    subscription = subscriptionDetailBoard().listen((event) {
      if (event.data == null) return;
      final data = event.parsedData?.detailBoard;
      if (data == null) return;
      listFragmentsSubject.value = data;
    });
    titleBoardSubject.value = currentBoardSubject.value.title!;
    isLoadingSubject.value = true;
    await fetchListFragmentByIdBoard();
    isLoadingSubject.value = false;

    // nếu dừng scroll thì sẽ tự động cuộn đến vị trí gần nhất và căn giữa
    // nếu là vị trí đầu hoặc cuối thì không cuộn
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer? timer;
      if (listFragmentsSubject.value.isEmpty) return;
      scrollListController.position.isScrollingNotifier.addListener(() {
        if (appBarEnumSubject.value == BoardDetailAppBarEnum.search) return;
        final isDragging =
            isDraggingCardSubject.value || isDraggingListSubject.value;
        if (isDragging) return;
        if (scrollListController.position.isScrollingNotifier.value) {
          timer?.cancel();
          return;
        }
        timer = Timer(const Duration(milliseconds: 100), () {
          final screenWidth =
              MediaQuery.of(routerService.rootContext).size.width;
          const itemWidth = 300.0;
          final offset = screenWidth / 2 - itemWidth / 2;
          final pageIndex = (scrollListController.offset / itemWidth).round();
          if (pageIndex == 0 ||
              pageIndex >= listFragmentsSubject.value.length - 1) return;
          scrollListController.animateTo(
            pageIndex * itemWidth - offset,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        });
      });
    });
  }

  void onTapOpenAddList() {
    appBarEnumSubject.value = BoardDetailAppBarEnum.addList;
    addListController.text = '';
    indexAddCardSubject.value = null;
  }

  void onTapOpenAddCard(int index) {
    appBarEnumSubject.value = BoardDetailAppBarEnum.addCard;
    addCardController.text = '';
    indexAddCardSubject.value = index;
  }

  @override
  void dispose() {
    super.dispose();
    appBarEnumSubject.close();
    listFragmentsSubject.close();
    addListController.dispose();
    addCardController.dispose();
    isLoadingSubject.close();
    indexAddCardSubject.close();
    isZoomSubject.close();
    isDraggingCardSubject.close();
    isLoadingAddSubject.close();
    scrollListController.dispose();
    searchTextSubject.close();
    isDragCardMoveContainerDeleteSubject.close();
    isDraggingListSubject.close();
    titleBoardSubject.close();
    idListEditSubject.close();
    titleListEditSubject.close();
    currentBoardSubject.close();
    subscription?.cancel();
  }

  void onTapLabelListTextField({required String? idList}) {
    if (idList == null || idList.isEmpty) return;
    idListEditSubject.value = idList;
    appBarEnumSubject.value = BoardDetailAppBarEnum.editListLabel;
  }

  void onTapOpenSearch() {
    if (isLoadingSubject.value) return;
    listFragmentsSubject.value = listFragmentsCurrent;
    appBarEnumSubject.value = BoardDetailAppBarEnum.search;
  }

  void searchLocalCard(String query) {
    listFragmentsSubject.value = listFragmentsCurrent;
    if (query.isEmpty) {
      listFragmentsSubject.value = listFragmentsCurrent;
      return;
    }
    final List<Fragment$ListFragment?> listSearch = [];

    final listTemp = listFragmentsSubject.value;
    for (final list in listTemp) {
      if (list == null) continue;
      if (list.cards == null || list.cards!.isEmpty) continue;
      final cards = list.cards!
          .where((element) => element.title.contains(query) == true)
          .toList();
      if (cards.isEmpty) continue;
      cards.removeWhere((element) => !element.title.contains(query));
      final lsTemp = list.copyWith(cards: cards);
      listSearch.add(lsTemp);
    }
    listFragmentsSubject.value = listSearch;
  }

  void onTapClose() {
    appBarEnumSubject.value = null;
    indexAddCardSubject.value = null;
    idListEditSubject.value = null;
  }

  Future<void> onTapUpdateBoard() async {
    isLoadingAddSubject.value = true;
    final result = await graphqlService.client.mutate$UpdateBoard(
      Options$Mutation$UpdateBoard(
        variables: Variables$Mutation$UpdateBoard(
          idBoard: boardBloc.appBloc.selectedBoardSubject.value!.id,
          input: Input$InputUpdateBoard(
            title: titleBoardSubject.value,
          ),
        ),
      ),
    );
    appBarEnumSubject.value = null;
    isLoadingAddSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors.first.message ??
            'Lỗi không thể cập nhật bảng',
      );
      return;
    }
    // cập nhật lại bảng
    final board = currentBoardSubject.value;
    final newBoard = board.copyWith(
      title: titleBoardSubject.value,
    );
    currentBoardSubject.value = newBoard;
  }

  Future<void> onTapAddList() async {
    if (addListController.text.isEmpty) return;
    final result = await fetchCreateList(label: addListController.text);
    if (result == null) {
      toastService.showText(message: 'Lỗi không thể tạo danh sách');
      return;
    }
    appBarEnumSubject.value = null;
    listFragmentsSubject.value.add(result);
    addListController.clear();
  }

  Future<void> onTapAddCard() async {
    if (addCardController.text.isEmpty) return;
    final indexAddCard = indexAddCardSubject.value;
    if (indexAddCard == null) return;
    final idList = listFragmentsSubject.value[indexAddCard]?.id;
    if (idList == null) return;
    final result = await fetchCreateCard(
      idList: idList,
      title: addCardController.text,
    );
    appBarEnumSubject.value = null;
    if (result == null) {
      toastService.showText(message: 'Lỗi không thể tạo card');
      return;
    }
    listFragmentsSubject.value[indexAddCard]?.cards?.add(result);
    indexAddCardSubject.value = null;
    addCardController.clear();
  }

  void onTapOpenMenuBoardScreen() {
    if (isLoadingSubject.value) return;
    routerService.push(RouteInput.menuBoard());
  }

  void onItemReorder(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    fetchMoveCard(
      oldItemIndex: oldItemIndex,
      oldListIndex: oldListIndex,
      newItemIndex: newItemIndex,
      newListIndex: newListIndex,
    );
    final lisTemp = listFragmentsSubject.value;
    final movedItem = lisTemp[oldListIndex]?.cards?.removeAt(oldItemIndex);
    lisTemp[newListIndex]?.cards?.insert(newItemIndex, movedItem!);
    listFragmentsSubject.value = lisTemp;
  }

  void onListReorder(int oldListIndex, int newListIndex) {
    fetchMoveList(oldListIndex: oldListIndex, newListIndex: newListIndex);
    final lisTemp = listFragmentsSubject.value;
    final movedList = lisTemp.removeAt(oldListIndex);
    lisTemp.insert(newListIndex, movedList);
    listFragmentsSubject.value = lisTemp;
  }

  late final appBloc = ref.read(BlocProvider.app);

  BoardDetailBloc(this.ref, {required this.boardFragment}) {
    init();
  }

  void onTapZoom() {
    final check = isZoomSubject.value;
    isZoomSubject.value = !check;
  }

  void onTapOpenInviteMember() {
    if (isLoadingSubject.value) return;
    appBarEnumSubject.value = null;
    routerService.push(RouteInput.inviteMember());
  }

  void onTapBack() {
    if (isLoadingSubject.value) return;
    appBarEnumSubject.value = null;
    routerService.pop();
  }

  void onTapDeleteList({
    required BuildContext context,
    required Fragment$ListFragment listFragment,
  }) {
    dialogShowConfirm(
      context: context,
      title: 'Xóa danh sách',
      content: 'Bạn có muốn xóa danh sách ${listFragment.label} không',
      onTap: () => deleteList(listFragment.id),
    );
  }

  void resetListFragment() {
    listFragmentsSubject.value = listFragmentsCurrent;
  }

  void showBottomSheetListDetail({
    required BuildContext context,
    required Fragment$ListFragment? listFragment,
  }) {
    resetListFragment();
    if (listFragment == null) return;
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(7),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return BoardDetailShowListDetailBottomSheet(
          listFragment: listFragment,
        );
      },
    );
  }

  Future<void> dialogShowConfirm({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onTap,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return ShowAlertDialog(onTap: onTap, title: title, content: content);
      },
    );
  }

  void changeDragCardMoveContainerDelete(bool value) {
    isDragCardMoveContainerDeleteSubject.value = value;
  }

  void changeDraggingCard({
    required BuildContext context,
    required bool value,
    required String? idCard,
    required String? idList,
  }) {
    if (value) {
      isDragCardMoveContainerDeleteSubject.value = false;
    }
    isDraggingCardSubject.value = value;

    if (value || !isDragCardMoveContainerDeleteSubject.value) return;
    dialogShowConfirm(
      context: context,
      title: 'Xóa thẻ',
      content: 'Bạn có muốn xóa thẻ không',
      onTap: () {
        deleteCard(idCard: idCard, idList: idList);
      },
    );
  }

  void onTapNotification() {
    if (isLoadingSubject.value) return;
    appBarEnumSubject.value = null;
    routerService
        .push(RouteInput.notification(idBoard: currentBoardSubject.value.id));
  }

  Future<void> onNextToDetailCard(String? idCard) async {
    if (idCard == null || idCard.isEmpty) return;
    final detailCardArgument = DetailCardArgument(
      idCard: idCard,
      idBoard: currentBoardSubject.value.id,
    );
    await routerService.push(
      RouteInput.detailCard(
        detailCardArgument: detailCardArgument,
      ),
    );
  }

  void onTapEditBoardTitle() {
    appBarEnumSubject.value = BoardDetailAppBarEnum.editBoardTitle;
  }

  void onTapSubmitEditListLabel() {
    onUpdateList();
  }
}
