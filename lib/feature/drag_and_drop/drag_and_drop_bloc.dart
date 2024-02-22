import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/feature/drag_and_drop/drag_and_drop_card_extention.dart';
import 'package:task_manager/feature/drag_and_drop/drag_and_drop_list_extention.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/get_lists.graphql.dart';

class DragAndDropBloc extends BlocBase {
  final Ref ref;
  final Fragment$BoardFragment boardFragment;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final boardBloc = ref.read(BlocProvider.board);
  late final localStorage = ref.read(AppService.localStorage);

  final isAddListSubject = BehaviorSubject<bool>.seeded(false);
  final isAddCardSubject = BehaviorSubject<bool>.seeded(false);
  final indexAddCardSubject = BehaviorSubject<int?>.seeded(null);
  final listFragmentsSubject =
      BehaviorSubject<List<Fragment$ListFragment?>>.seeded([]);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingAddSubject = BehaviorSubject<bool>.seeded(false);

  final isZoomSubject = BehaviorSubject<bool>.seeded(false);

  final addListController = TextEditingController();
  final addCardController = TextEditingController();

  final scrollListController = ScrollController();

  Future<void> fetchListFragmentByIdBoard() async {
    final result = await graphqlService.client.mutate$getList(
      Options$Mutation$getList(
        variables: Variables$Mutation$getList(
          idBoard: boardFragment.id,
        ),
      ),
    );
    if (result.hasException || result.parsedData == null) return;
    listFragmentsSubject.value = result.parsedData?.getLists ?? [];
  }

  Future<void> init() async {
    isLoadingSubject.value = true;
    await fetchListFragmentByIdBoard();
    isLoadingSubject.value = false;

    // nếu dừng scroll thì sẽ tự động cuộn đến vị trí gần nhất và căn giữa
    // nếu là vị trí đầu hoặc cuối thì không cuộn
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer? timer;
      if (listFragmentsSubject.value.isEmpty) return;
      scrollListController.position.isScrollingNotifier.addListener(() {
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

  void onTapAddList() {
    addListController.text = '';
    isAddListSubject.value = true;
    isAddCardSubject.value = false;
    indexAddCardSubject.value = null;
  }

  void onTapAddCard(int index) {
    addCardController.text = '';
    indexAddCardSubject.value = index;
    isAddCardSubject.value = true;
    isAddListSubject.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    isAddListSubject.close();
    isAddCardSubject.close();
    listFragmentsSubject.close();
    addListController.dispose();
    addCardController.dispose();
    isLoadingSubject.close();
    indexAddCardSubject.close();
    isZoomSubject.close();
    isLoadingAddSubject.close();
    scrollListController.dispose();
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  void closeAdd() {
    isAddListSubject.value = false;
    isAddCardSubject.value = false;
    indexAddCardSubject.value = null;
  }

  void add() {
    if (addListController.text == '' && addCardController.text == '') return;
    if (isAddListSubject.value) {
      addList();
      return;
    }
    addCard();
  }

  Future<void> addList() async {
    final result = await fetchCreateList(label: addListController.text);
    if (result == null) {
      toastService.showText(message: 'Lỗi không thể tạo danh sách');
      return;
    }
    listFragmentsSubject.value.add(result);
    isAddListSubject.value = false;
    addListController.clear();
  }

  Future<void> addCard() async {
    final indexAddCard = indexAddCardSubject.value;
    if (indexAddCard == null) return;
    final idList = listFragmentsSubject.value[indexAddCard]?.id;
    if (idList == null) return;
    final result = await fetchCreateCard(
      idList: idList,
      title: addCardController.text,
    );
    if (result == null) {
      toastService.showText(message: 'Lỗi không thể tạo card');
      return;
    }
    listFragmentsSubject.value[indexAddCard]?.cards?.add(result);
    indexAddCardSubject.value = null;
    isAddCardSubject.value = false;
    addCardController.clear();
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

  DragAndDropBloc(this.ref, {required this.boardFragment}) {
    init();
  }

  void onTapZoom() {
    final check = isZoomSubject.value;
    isZoomSubject.value = !check;
  }

  void popSC() {
    routerService.pop();
  }

  void onTapDeleteList(String idList) {
    deleteList(idList);
  }
}
