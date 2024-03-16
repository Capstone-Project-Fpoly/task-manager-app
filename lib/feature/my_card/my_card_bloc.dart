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

  Future<void> getListBoard(String query) async {
    final user = appBloc.userSubject.value;
    isLoadingSubject.value = true;
    final resultBoard = await graphqlService.client.mutate$getBoards(
      Options$Mutation$getBoards(),
    );
    if (resultBoard.hasException) {
      toastService.showText(
        message: resultBoard.exception?.graphqlErrors[0].message ?? 'Lỗi',
      );
      return;
    }
    if (resultBoard.parsedData == null) {
      toastService.showText(
        message: resultBoard.exception?.graphqlErrors[0].message ??
            'Không lấy được dữ liệu!',
      );
      return;
    }
    final listBoard = resultBoard.parsedData?.getBoards ?? [];
    final listBoardTemp = [];
    for (final item in listBoard) {
      if (item == null) continue;
      final resultList = await graphqlService.client.mutate$getList(
        Options$Mutation$getList(
          variables: Variables$Mutation$getList(
            idBoard: item.id,
          ),
        ),
      );
      if (resultList.hasException || resultList.parsedData == null) continue;
      final listOfBoard =
          resultList.parsedData?.getLists ?? [] as List<Fragment$ListFragment>;
      if (listOfBoard.contains(user!.uid)) {
        listBoardTemp.remove(item);
      } else {
        listBoardTemp.add(item);
      }
    }
    listSearchBoardMyCardSubject.value =
        listBoardTemp as List<Fragment$BoardFragment>;
  }

  MyCardBloc(this.ref) {
    init();
  }

  // void searchLocalBoard(String query) {
  //   final result = list
  //       .where((element) => element?.title?.contains(query) ?? false)
  //       .toList();
  // }

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
