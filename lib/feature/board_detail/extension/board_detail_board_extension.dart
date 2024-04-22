import 'package:flutter/material.dart';
import 'package:task_manager/base/dependency/router/utils/route_name.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/graphql/Mutations/board/check_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/delete_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/open_board.graphql.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

extension DetailBoardSubscriptionExtension on BoardDetailBloc {
  Future<void> fetchCheckBoard() async {
    final result = await graphqlService.client.mutate$CheckBoard(
      Options$Mutation$CheckBoard(
        variables: Variables$Mutation$CheckBoard(
          idBoard: currentBoardSubject.value.id,
        ),
        onError: (error) {
          toastService.showText(
            message: error?.graphqlErrors.first.message,
          );
          routerService.pop();
        },
      ),
    );
    if (result.hasException) {
      return;
    }
    if (result.parsedData == null) {
      return;
    }
    if (isCheckBoardSubject.isClosed) return;
    isCheckBoardSubject.value = result.parsedData?.checkBoard ?? false;
  }

  Future<void> onTapOpenBoard() async {
    final result = await graphqlService.client.mutate$OpenBoard(
      Options$Mutation$OpenBoard(
        variables: Variables$Mutation$OpenBoard(
          idBoard: currentBoardSubject.value.id,
        ),
        onError: (error) {
          toastService.showText(
            message: error?.graphqlErrors.first.message,
          );
        },
      ),
    );
    if (result.hasException) return;
    isCheckBoardSubject.value = result.parsedData?.openBoard ?? false;
    if (isCheckBoardSubject.value) {
      init();
    }
  }

  void onTapConfirmDeleteBoard(
    BuildContext context, {
    required String idBoard,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Xác nhận',
            style: AppTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.red,
            ),
          ),
          content: const Text(
            'Sau khi xoá bảng, bạn sẽ không thể khôi phục lại bảng hoặc các thẻ của bảng này.\nDữ liệu của bảng này sẽ bị xóa khỏi kho lưu trữ của chúng tôi.\nBạn có chắc chắn muốn xoá bảng không?',
            style: AppTextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () {
                routerService.pop();
              },
              child: const Text(
                'QUAY LẠI',
                style: AppTextStyle(
                  color: ColorConstants.primary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                onTapDeleteBoard(idBoard);
              },
              child: const Text(
                'XÓA',
                style: AppTextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> onTapDeleteBoard(String idBoard) async {
    final result = await graphqlService.client.mutate$DeleteBoard(
      Options$Mutation$DeleteBoard(
        variables: Variables$Mutation$DeleteBoard(idBoard: idBoard),
        onError: (error) {
          toastService.showText(
            message: error?.graphqlErrors.first.message,
          );
        },
      ),
    );
    if (result.hasException) return;
    boardBloc.getBoards();
    myCardBloc.init();
    myBoardBloc.init();
    routerService.popUntil((route) => route.settings.name == RouteName.root);
  }
}
