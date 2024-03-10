import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Mutations/board/update_board.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/enum/board_status_enum.dart';
import 'package:task_manager/shared/widgets/dialog_show/alert_dialog_widget.dart';

class SettingBoardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  final colorSubject = BehaviorSubject.seeded('2196F3');
  final backgroundColorSubject = BehaviorSubject<Color>.seeded(
    const Color(0XFF2196F3),
  );
  final selectedTitleTextFieldSubject = BehaviorSubject<bool>.seeded(false);
  late final boardDetailBloc = ref.read(BlocProvider.board);
  final nameBoardSubject = BehaviorSubject<String>.seeded('');
  final isPublicSubject = BehaviorSubject<bool>.seeded(false);
  final selectedStatusSubject = BehaviorSubject<BoardStatusEnum>.seeded(
    BoardStatusEnum.public,
  );
  final focusNode = FocusNode();
  @override
  void dispose() {
    colorSubject.close();
    backgroundColorSubject.close();
    selectedTitleTextFieldSubject.close();
    nameBoardSubject.close();
    isPublicSubject.close();
    selectedStatusSubject.close();
    super.dispose();
  }

  void init() {
    backgroundColorSubject.value = Color(
      int.tryParse(
              '0XFF${boardDetailBloc.selectedBoardSubject.value?.color}',) ??
          0XFF2196F3,
    );
    nameBoardSubject.value =
        boardDetailBloc.selectedBoardSubject.value!.title ?? '';
    isPublicSubject.value =
        boardDetailBloc.selectedBoardSubject.value!.isPublic;
  }

  void onBackToBoardScreen() {
    onTapUpdateBoard();
    routerService.pop();
  }

  void onTapTitleTextField(bool open) {
    selectedTitleTextFieldSubject.value = open;
  }

  void chooseStatusBoard(BoardStatusEnum value) {
    selectedStatusSubject.value = value;
    isPublicSubject.value =
        selectedStatusSubject.value == BoardStatusEnum.public;
  }

  Future<void> showDialogCloseBoard({
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return ShowAlertDialog(
          onTap: () {
            // đóng bảng
          },
          title: 'Đóng Bảng',
          content: 'Bạn có chắc chắn đóng bảng không',
        );
      },
    );
  }

  Future<void> onTapUpdateBoard() async {
    focusNode.unfocus();
    if (nameBoardSubject.value.trim().isEmpty) {
      return;
    }
    final result = await graphqlService.client.mutate$UpdateBoard(
      Options$Mutation$UpdateBoard(
        variables: Variables$Mutation$UpdateBoard(
          idBoard: boardDetailBloc.selectedBoardSubject.value!.id,
          input: Input$InputUpdateBoard(
            title: nameBoardSubject.value.trim(),
            isPublic: isPublicSubject.value,
            color: colorSubject.value,
          ),
        ),
      ),
    );

    if (result.hasException) {
      return;
    }
  }

  Future<void> onNextToBackgroundBoardWidget() async {
    final resultColor = await routerService.push(RouteInput.backgroundBoard());
    if (resultColor != null) {
      colorSubject.value = resultColor.toString();
      backgroundColorSubject.value =
          Color(int.tryParse('0XFF${colorSubject.value}') ?? 0XFF2196F3);
    }
  }

  SettingBoardBloc(this.ref) {
    init();
  }
}
