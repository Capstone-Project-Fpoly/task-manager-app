import 'package:flutter/material.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/graphql/graphql_service.dart';
import 'package:task_manager/base/dependency/router/router_service.dart';
import 'package:task_manager/base/dependency/toast/toast_service.dart';
import 'package:task_manager/graphql/Mutations/board/close_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/leave_board.graphql.dart';

mixin BoardMixin on BlocBase {
  GraphQLService get graphqlService;
  ToastService get toastService;
  RouterService get routerService;

  //tạo hàm confirmLeaveBoard để xác nhận rời bảng
  void onTapLeaveBoard({
    required BuildContext context,
    required String boardId,
  }) {
    if(boardId.isEmpty) return;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Rời bảng',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text('Bạn xác nhận rời bảng?'),
          actions: [
            TextButton(
              onPressed: () {
                routerService.pop();
              },
              child: const Text('Thoát'),
            ),
            TextButton(
              onPressed: () async {
                final result = await leaveBoard(boardId);
                if (result) {
                  toastService.showText(message: 'Rời bảng thành công');
                } else {
                  toastService.showText(message: 'Rời bảng thất bại');
                }
                routerService.pop();
              },
              child: const Text('Rời bảng'),
            ),
          ],
        );
      },
    );
  }

  void onTapCloseBoard({
    required BuildContext context,
    required String boardId,
  }) {
    if(boardId.isEmpty) return;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Đóng bảng',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text('Bạn xác nhận đóng bảng?'),
          actions: [
            TextButton(
              onPressed: () {
                routerService.pop();
              },
              child: const Text('Thoát'),
            ),
            TextButton(
              onPressed: () async {
                final result = await closeBoard(boardId);
                if (result) {
                  toastService.showText(message: 'Đóng bảng thành công');
                } else {
                  toastService.showText(message: 'Đóng bảng thất bại');
                }
                routerService.pop();
              },
              child: const Text('Đóng bảng'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> leaveBoard(String boardId) async {
    final result = await graphqlService.client.mutate$LeaveBoard(
      Options$Mutation$LeaveBoard(
        variables: Variables$Mutation$LeaveBoard(idBoard: boardId),
      ),
    );
    if (result.hasException) {
      return false;
    }
    return result.parsedData?.leaveBoard ?? false;
  }

  Future<bool> closeBoard(String boardId) async {
    final result = await graphqlService.client.mutate$CloseBoard(
      Options$Mutation$CloseBoard(
        variables: Variables$Mutation$CloseBoard(idBoard: boardId),
      ),
    );
    if (result.hasException) {
      return false;
    }
    return result.parsedData?.closeBoard ?? false;
  }
}
