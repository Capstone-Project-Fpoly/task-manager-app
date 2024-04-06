import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/arguments/detail_card_argument.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/queries/card/get_my_cards.graphql.dart';

class MyCardBloc extends BlocBase {
  final Ref ref;

  Future<void> getListBoard(String query) async {}

  MyCardBloc(this.ref) {
    init();
  }

  final selectedSearchSubject = BehaviorSubject<bool>.seeded(false);
  final isFindCardByBoardSubject = BehaviorSubject<bool>.seeded(true);
  final isFocusSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  late final boardBloc = ref.read(BlocProvider.board);
  late final appBloc = ref.read(BlocProvider.app);

  final listBoardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  final listCardSubject =
      BehaviorSubject<List<Fragment$CardFragment?>>.seeded([]);

  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  List<Fragment$BoardFragment?> boardsFragmentCurrent = [];
  List<Fragment$CardFragment?> cardsFragmentCurrent = [];

  final searchController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    searchController.dispose();
    selectedSearchSubject.close();
    isFindCardByBoardSubject.close();
    isFocusSubject.close();
    isLoadingSubject.close();
    listBoardSubject.close();
    listCardSubject.close();
  }

  Future<void> init() async {
    focusNode.addListener(() {
      if (focusNode.hasFocus) isFocusSubject.value = true;
    });
    await getMyCards();
  }

  Future<void> getMyCards() async {
    isLoadingSubject.value = true;
    final result = await graphqlService.client.query$GetMyCards(
      Options$Query$GetMyCards(),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors.first.message,
      );
      return;
    }
    listCardSubject.value = result.parsedData?.getMyCards?.cards ?? [];
    listBoardSubject.value = result.parsedData?.getMyCards?.boards ?? [];
    boardsFragmentCurrent = [...listBoardSubject.value];
    cardsFragmentCurrent = [...listCardSubject.value];
  }

  void refresh() {
    listBoardSubject.value = [...boardsFragmentCurrent];
    listCardSubject.value = [...cardsFragmentCurrent];
  }

  void openSearch(bool value) {
    selectedSearchSubject.value = value;
  }

  void onSelectFilter(bool value) {
    isFindCardByBoardSubject.value = value;
  }

  void searchCard(String query) {
    if (query.isEmpty) {
      refresh();
      return;
    }
    final cards = [...cardsFragmentCurrent];
    final boards = [...boardsFragmentCurrent];
    cards.removeWhere(
      (element) => element?.title.toLowerCase().contains(query) == false,
    );
    boards.removeWhere(
      (element) => cards.any((card) => card?.boardId == element?.id) == false,
    );
    listCardSubject.value = cards;
    listBoardSubject.value = boards;
  }

  void clearText() {
    searchController.text = '';
    refresh();
  }

  void unFocusNode() {
    focusNode.unfocus();
    isFocusSubject.value = false;
    searchController.clear();
    refresh();
  }

  void onTapToCardDetail({required String? idCard, required String? idBoard}) {
    if (idCard == null || idBoard == null) return;
    final detailCardArgument = DetailCardArgument(
      idCard: idCard,
      idBoard: idBoard,
    );
    routerService.push(
      RouteInput.detailCard(
        detailCardArgument: detailCardArgument,
      ),
    );
  }

  void onTapToAddCard() {
    routerService.push(RouteInput.addCard());
  }
}
