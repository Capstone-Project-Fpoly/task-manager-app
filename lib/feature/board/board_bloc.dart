import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/feature/board/dialog_board_option/dialog_board_option.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/get_boards.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/leave_board.graphql.dart';
import 'package:task_manager/shared/widgets/dialog_show/alert_dialog_widget.dart';

class BoardBloc extends BlocBase {
  final Ref ref;
  final isDialOpenSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final extendSubject = BehaviorSubject<bool>.seeded(false);
  final clickSubject = BehaviorSubject<bool>.seeded(false);
  final selectedBoardSubject =
      BehaviorSubject<Fragment$BoardFragment?>.seeded(null);
  final listBoardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  final listBoardSearchSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  //
  final selectedSearchSubject = BehaviorSubject<bool>.seeded(false);
  final searchTextSubject = BehaviorSubject<String>.seeded('');

  final idUserSubject = BehaviorSubject<String>.seeded('');
  final isOwnerBroadSubject = BehaviorSubject<bool>.seeded(false);
  void init() {
    getBoard();
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
    searchTextSubject.close();
    listBoardSearchSubject.close();
    idUserSubject.close();
    isOwnerBroadSubject.close();
  }

  void openSearch(bool open) {
    listBoardSearchSubject.value = listBoardSubject.value;
    selectedSearchSubject.value = open;
  }

  void changeClick(bool change) {
    clickSubject.value = change;
  }

  void searchLocalBoard(String query) {
    if (query.isEmpty) {
      listBoardSearchSubject.value = listBoardSubject.value;
      return;
    }
    final list = listBoardSubject.value;
    final result = list
        .where((element) => element?.title?.contains(query) ?? false)
        .toList();
    listBoardSearchSubject.value = result;
  }

  void onTapToDragAndDrop({required Fragment$BoardFragment? board}) {
    selectedSearchSubject.value = false;
    selectedBoardSubject.value = board;
    if (board == null) return;
    routerService.push(RouteInput.boardDetail(boardFragment: board));
  }

  void onTapToNotification() {
    selectedSearchSubject.value = false;
    routerService.push(RouteInput.notification());
  }

  void onTapSettingBoard() {
    routerService.push(RouteInput.settingBoard());
  }

  Future<void> dialogShowOptionBoard({
    required BuildContext context,
    required Fragment$BoardFragment? board,
  }) async {
    selectedSearchSubject.value = false;
    selectedBoardSubject.value = board;
    idUserSubject.value = appBloc.userSubject.value!.uid;
    if (idUserSubject.value == board?.ownerUser.uid) {
      isOwnerBroadSubject.value = true;
    } else {
      isOwnerBroadSubject.value = false;
    }
    showDialog(
      context: context,
      builder: (context) {
        return const ShowDialogBoardOption();
      },
    );
  }

  Future<void> onTapToAddBoard() async {
    selectedSearchSubject.value = false;
    try {
      final result = await routerService.push(RouteInput.addBoard()) as bool;
      if (result) getBoard();
    } catch (e) {
      return;
    }
  }

  void onTapToAddCard() {
    selectedSearchSubject.value = false;
    routerService.push(RouteInput.addCard());
  }

  Future<void> showDialogLeaveBoard({
    required BuildContext context,
  }) async {
    routerService.pop();
    showDialog(
      context: context,
      builder: (context) {
        return ShowAlertDialog(
          onTap: () async {
            // rời bảng
            final result = await graphqlService.client.mutate$LeaveBoard(
              Options$Mutation$LeaveBoard(
                variables: Variables$Mutation$LeaveBoard(
                    idBoard: selectedBoardSubject.value!.id.trim(),),
              ),
            );
            if (result.hasException) {
              toastService.showText(
                message: result.exception?.graphqlErrors[0].message,
              );
              routerService.pop(result: false);
              return;
            }
            routerService.pop();
          },
          title: 'Rời Bảng',
          content: 'Bạn có chắc chắn rời bảng không',
        );
      },
    );
  }

  void getBoard() async {
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$getBoards(
      Options$Mutation$getBoards(),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ?? 'Lỗi',
      );
      return;
    }
    if (result.parsedData == null) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ??
            'Không lấy được dữ liệu!',
      );
      return;
    }
    listBoardSubject.value = result.parsedData?.getBoards ?? [];
  }

  late final appBloc = ref.read(BlocProvider.app);

  BoardBloc(this.ref) {
    init();
  }
}
