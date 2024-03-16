import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/get_boards.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/get_lists.graphql.dart';

class MyCardBloc extends BlocBase {
  final Ref ref;

  MyCardBloc(this.ref) {
    init();
  }

  final selectedSearchSubject = BehaviorSubject<bool>.seeded(false);
  final isFindCardByBoardSubject = BehaviorSubject<bool>.seeded(true);
  final isFocusSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  late final boardBloc = ref.read(BlocProvider.board);
  late final appBloc = ref.read(BlocProvider.app);

  final listFragmentSubject =
      BehaviorSubject<List<Fragment$ListFragment?>>.seeded([]);

  final listBoardSubject =
  BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);

  final listBoardOfMyCardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);

  final listSearchBoardOfMyCardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);


  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final searchController = TextEditingController();
  final focusNode = FocusNode();
  List<Fragment$ListFragment?> listFragmentsCurrent = [];
  List<String> listIdBoard = [];


  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    searchController.dispose();
    selectedSearchSubject.close();
    isFindCardByBoardSubject.close();
    isFocusSubject.close();
    isLoadingSubject.close();
    listFragmentSubject.close();
    listBoardOfMyCardSubject.close();
    listSearchBoardOfMyCardSubject.close();
    listBoardSubject.close();
  }

  Future<void> init() async {
    focusNode.addListener(() {
      if (focusNode.hasFocus) isFocusSubject.value = true;
    });
    print('${listSearchBoardOfMyCardSubject.value} lanh');
  }


  void openSearch(bool value) {
    selectedSearchSubject.value = value;
  }

  void onSelectFilter(bool value) {
    isFindCardByBoardSubject.value = value;
  }

  void searchCard(String query) {}

  void clearText() {
    searchController.clear();
  }

  void unFocusNode() {
    focusNode.unfocus();
    isFocusSubject.value = false;
    searchController.clear();
  }


  void searchLocalBoard(String query) {
    final listBoard = appBloc.listBoardSubject.value;
    final list = listBoardSubject.value;
    final idUser = appBloc.userSubject.value!.uid;
    if (query.isEmpty) {
      listSearchBoardOfMyCardSubject.value = listBoardOfMyCardSubject.value;
      // return;
    }
    final result = list
        .where((element) => element?.id?.contains(query) ?? false)
        .toList();
    listSearchBoardOfMyCardSubject.value = result;
  }

  void searchLocalCard(String query) {
    listFragmentSubject.value = listFragmentsCurrent;
    if (query.isEmpty) {
      listFragmentSubject.value = listFragmentsCurrent;
      return;
    }
    final List<Fragment$ListFragment?> listSearch = [];
    final List<Fragment$BoardFragment?> boardSearch = [];

    final listTemp = listFragmentSubject.value;
    final boardTemp = listBoardOfMyCardSubject.value;
    for (final list in listTemp) {
      if (list == null) continue;
      if (list.cards == null || list.cards!.isEmpty) continue;
      final cards = list.cards!
          .where((element) => element.id?.contains(query)  == true)
          .toList();
      if (cards.isEmpty) continue;
      cards.removeWhere((element) => !element.title!.contains(query));
      final listTemp = list.copyWith(cards: cards);
      listSearch.add(listTemp);
    }
    listFragmentSubject.value = listSearch;
  }

}
