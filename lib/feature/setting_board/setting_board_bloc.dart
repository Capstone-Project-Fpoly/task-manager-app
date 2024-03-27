import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/update_board.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/enum/board_status_enum.dart';
import 'package:task_manager/shared/utilities/color.dart';
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
  late final appBloc = ref.read(BlocProvider.app);
  final nameBoardSubject = BehaviorSubject<String>.seeded('');
  final isPublicSubject = BehaviorSubject<bool>.seeded(false);
  final textEditingController = TextEditingController();
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
    focusNode.dispose();
    super.dispose();
  }

  void init() {
    backgroundColorSubject.value = Color(
      int.parse(
        '0XFF${appBloc.selectedBoardSubject.value?.color ?? '2196F3'}',
      ),
    );
    nameBoardSubject.value = appBloc.selectedBoardSubject.value?.title ?? '';
    textEditingController.text = nameBoardSubject.value;
    isPublicSubject.value =
        appBloc.selectedBoardSubject.value?.isPublic ?? true;
    selectedStatusSubject.value = isPublicSubject.value
        ? BoardStatusEnum.public
        : BoardStatusEnum.private;
  }

  void onBackToBoardScreen() {
    final currentBoard = appBloc.selectedBoardSubject.value;
    final currentColor =
        ColorUtils.getHexFromColor(backgroundColorSubject.value);
    final currentTitle = nameBoardSubject.value;
    final currentIsPublic = isPublicSubject.value;
    Fragment$BoardFragment? resultPop;
    if (currentBoard?.color?.toLowerCase() != currentColor.toLowerCase() ||
        currentBoard?.title != currentTitle ||
        currentBoard?.isPublic != currentIsPublic) {
      if (appBloc.selectedBoardSubject.value != null) {
        resultPop = currentBoard!.copyWith(
          color: currentColor,
          title: currentTitle,
          isPublic: currentIsPublic,
        );
        appBloc.selectedBoardSubject.value = resultPop;
      }
    }
    routerService.pop(result: resultPop);
  }

  void onTapTitleTextField(bool open) {
    selectedTitleTextFieldSubject.value = open;
    if (open) {
      focusNode.requestFocus();
      return;
    }
    textEditingController.text =
        appBloc.selectedBoardSubject.value?.title ?? '';
    focusNode.unfocus();
  }

  void onTapSubmitTitleTextField() {
    selectedTitleTextFieldSubject.value = false;
    nameBoardSubject.value = textEditingController.text;
    onTapUpdateBoard(title: textEditingController.text);
  }

  void chooseStatusBoard(BoardStatusEnum value) {
    selectedStatusSubject.value = value;
    isPublicSubject.value = value.isPublic;
    onTapUpdateBoard(isPublic: isPublicSubject.value);
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

  Future<void> onTapUpdateBoard({
    String? title,
    String? color,
    bool? isPublic,
  }) async {
    focusNode.unfocus();
    if (nameBoardSubject.value.trim().isEmpty) {
      return;
    }
    final result = await graphqlService.client.mutate$UpdateBoard(
      Options$Mutation$UpdateBoard(
        variables: Variables$Mutation$UpdateBoard(
          idBoard: appBloc.selectedBoardSubject.value!.id,
          input: Input$InputUpdateBoard(
            title: title,
            color: color,
            isPublic: isPublic,
          ),
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors.first.message ??
            'Lỗi không thể cập nhật bảng',
      );
      return;
    }
  }

  Future<void> onNextToBackgroundBoardWidget() async {
    final resultColor = await routerService.push(RouteInput.backgroundBoard());
    if (resultColor == null) return;
    colorSubject.value = resultColor.toString();
    backgroundColorSubject.value =
        Color(int.tryParse('0XFF${colorSubject.value}') ?? 0XFF2196F3);
    onTapUpdateBoard(color: colorSubject.value);
  }

  SettingBoardBloc(this.ref) {
    init();
  }
}
