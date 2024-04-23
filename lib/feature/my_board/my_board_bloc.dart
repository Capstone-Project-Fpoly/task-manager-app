import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/check_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/get_boards.graphql.dart';
import 'package:task_manager/shared/mixins/board_mixin.dart';
import 'package:task_manager/shared/widgets/dialog_board_option/dialog_board_option.dart';

class MyBoardBloc extends BlocBase with BoardMixin {
  final Ref ref;
  final isDialOpenSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final extendSubject = BehaviorSubject<bool>.seeded(false);
  final clickSubject = BehaviorSubject<bool>.seeded(false);
  late final appBloc = ref.watch(BlocProvider.app);
  final listBoardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  @override
  late final routerService = ref.watch(AppService.router);
  @override
  late final graphqlService = ref.read(AppService.graphQL);
  @override
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
    selectedSearchSubject.close();
  }

  void onTapShowOptions(bool change) {
    clickSubject.value = change;
  }

  Future<void> onTapToDetailBoard({
    required Fragment$BoardFragment? board,
  }) async {
    appBloc.selectedBoardSubject.value = board;
    if (board == null) return;
    final result = await graphqlService.client.mutate$CheckBoard(
      Options$Mutation$CheckBoard(
        variables: Variables$Mutation$CheckBoard(
          idBoard: board.id,
        ),
        onError: (error) {
          toastService.showText(
            message: error?.graphqlErrors.first.message,
          );
          routerService.pop();
        },
      ),
    );
    if (result.parsedData?.checkBoard == null) {
      toastService.showText(message: 'Bảng không tồn tại');
      return;
    }
    await routerService.push(RouteInput.boardDetail(boardFragment: board));
    final selectedBoard = appBloc.selectedBoardSubject.value;
    if (selectedBoard == null) return;
    final currentMyBoards = [...listBoardSubject.value];
    final index = currentMyBoards.indexWhere(
      (element) => element?.id == selectedBoard.id,
    );
    if (index != -1) {
      currentMyBoards[index] = selectedBoard;
      listBoardSubject.value = currentMyBoards;
    }
  }

  Future<void> onTapToAddBoard() async {
    try {
      final result = await routerService.push(RouteInput.addBoard()) as bool;
      if (result) getMyBoard();
    } catch (e) {
      return;
    }
  }

  Future<void> onTapToAddCard() async {
    await routerService.push(RouteInput.addCard());
    getMyBoard();
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

  MyBoardBloc(this.ref) {
    init();
  }

  void searchLocalBoard(String value) {
    final listBoard = [...currentBoard];
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

  Future<void> dialogShowOptionBoard({
    required BuildContext context,
    Fragment$BoardFragment? board,
  }) async {
    appBloc.selectedBoardSubject.value = board;
    await showDialog(
      context: context,
      builder: (context) {
        return ShowDialogBoardOption(
          functionWhenCloseSettingBoard: () {
            final selectedBoard = appBloc.selectedBoardSubject.value;
            final currentMyBoards = [...listBoardSubject.value];
            final index = currentMyBoards.indexWhere(
              (element) => element?.id == selectedBoard?.id,
            );
            if (index != -1) {
              currentMyBoards[index] = selectedBoard;
              listBoardSubject.value = currentMyBoards;
            }
          },
        );
      },
    );
  }
}
