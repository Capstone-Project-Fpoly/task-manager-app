import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/get_boards.graphql.dart';

class MyBoardBloc extends BlocBase {
  final Ref ref;
  final isDialOpenSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final extendSubject = BehaviorSubject<bool>.seeded(false);
  final clickSubject = BehaviorSubject<bool>.seeded(false);
  final selectedBoardSubject =
      BehaviorSubject<Fragment$BoardFragment?>.seeded(null);
  final listBoardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final selectedSearchSubject = BehaviorSubject<bool>.seeded(false);
  List<Fragment$BoardFragment?> currentBoard = [];

  void init() {
    getMyBoard();
  }

  @override
  void dispose() {
    super.dispose();
    isDialOpenSubject.close();
    extendSubject.close();
    clickSubject.close();
    isLoadingSubject.close();
    listBoardSubject.close();
    selectedBoardSubject.close();
    selectedSearchSubject.close();
  }

  void onTapShowOptions(bool change) {
    clickSubject.value = change;
  }

  void onTapToDetailBoard({required Fragment$BoardFragment? board}) {
    selectedBoardSubject.value = board;
    if (board == null) return;
    routerService.push(RouteInput.boardDetail(boardFragment: board));
  }

  Future<void> onTapToAddBoard() async {
    try {
      final result = await routerService.push(RouteInput.addBoard()) as bool;
      if (result) getMyBoard();
    } catch (e) {
      return;
    }
  }

  void onTapToAddCard() {
    routerService.push(RouteInput.addCard());
  }

  void getMyBoard() async {
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$getBoards(
      Options$Mutation$getBoards(),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors.first.message ?? 'Lỗi',
      );
      return;
    }
    if (result.parsedData == null) {
      toastService.showText(
        message: result.exception?.graphqlErrors.first.message ??
            'Không lấy được dữ liệu!',
      );
      return;
    }
    listBoardSubject.value = result.parsedData?.getBoards ?? [];
    currentBoard = [...listBoardSubject.value];
  }

  late final appBloc = ref.read(BlocProvider.app);

  MyBoardBloc(this.ref) {
    init();
  }

  void searchLocalBoard(String value) {
    final listBoard = [...listBoardSubject.value];
    if (value.isEmpty) {
      listBoardSubject.value = [...currentBoard];
      return;
    }
    final listSearch = listBoard.where((element) {
      if (element == null) return false;
      if (element.title == null) return false;
      return element.title!.toLowerCase().contains(value.toLowerCase());
    }).toList();
    listBoardSubject.value = listSearch;
  }

  void openSearch(bool bool) {
    selectedSearchSubject.value = bool;
    if (!bool) listBoardSubject.value = [...currentBoard];
  }

  void onTapToNotification() {
    selectedSearchSubject.value = false;
    routerService.push(RouteInput.notification());
  }

  void dialogShowOptionBoard({
    required BuildContext context,
    Fragment$BoardFragment? board,
  }) {}
}
