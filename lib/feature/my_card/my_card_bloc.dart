import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';

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
  final listFragmentSubject =
      BehaviorSubject<List<Fragment$ListFragment?>>.seeded([]);
  final listBoardMyCardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);

  final listSearchBoardMyCardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);

  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  List<Fragment$BoardFragment?> boardFragmentsCurrent = [];

  final searchController = TextEditingController();
  final focusNode = FocusNode();
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
    listBoardMyCardSubject.close();
    listSearchBoardMyCardSubject.close();
  }

  Future<void> init() async {
    focusNode.addListener(() {
      if (focusNode.hasFocus) isFocusSubject.value = true;
    });
    getListBoard('');
  }

  void openSearch(bool value) {
    selectedSearchSubject.value = value;
  }

  void onSelectFilter(bool value) {
    isFindCardByBoardSubject.value = value;
  }

  void searchCard(String query) {
    getListBoard(query);
  }

  void clearText() {
    searchController.clear();
  }

  void unFocusNode() {
    focusNode.unfocus();
    isFocusSubject.value = false;
    searchController.clear();
  }
}
