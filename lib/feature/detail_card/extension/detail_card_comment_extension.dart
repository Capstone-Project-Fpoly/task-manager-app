import 'package:flutter/material.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/graphql/Mutations/comment/create_comment.graphql.dart';
import 'package:task_manager/graphql/Mutations/comment/delete_comment.graphql.dart';

extension DetailCardCommentExtension on DetailCardBloc {
  Future<void> onTapSendComment() async {
    if (!isChatCommentSubject.value) {
      return;
    }
    isLoadingAddCommentSubject.value = true;
    final resultCreateComment =
        await graphqlService.client.mutate$CreateComment(
      Options$Mutation$CreateComment(
        variables: Variables$Mutation$CreateComment(
          idCard: cardSubject.value!.id,
          content: commentController.text,
        ),
      ),
    );
    if (resultCreateComment.hasException) {
      final message =
          resultCreateComment.exception?.graphqlErrors.first.message;
      toastService.showText(message: message);
      routerService.pop();
      return;
    }
    if (resultCreateComment.parsedData?.createComment == null) {
      toastService.showText(message: 'Thêm thất bại');
      return;
    }
    listCommentFragmentsSubject.value = [
      ...listCommentFragmentsSubject.value,
      resultCreateComment.parsedData!.createComment!,
    ].reversed.toList();
    commentController.clear();
    isLoadingAddCommentSubject.value = false;
    scrollToListComment();
  }

  void onTapConfirmDeleteComment({
    required String idComment,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Xác nhận',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text('Bạn có chắc chắn muốn xóa bình luận này không?'),
          actions: [
            TextButton(
              onPressed: () {
                routerService.pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                deleteComment(idComment);
                routerService.pop();
              },
              child: const Text('Xóa', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteComment(String idComment) async {
    await graphqlService.client.mutate$DeleteComment(
      Options$Mutation$DeleteComment(
        variables: Variables$Mutation$DeleteComment(
          idComment: idComment,
        ),
      ),
    );
    final listTemp = [...listCommentFragmentsSubject.value];
    listTemp.removeWhere((element) => element.id == idComment);
    listCommentFragmentsSubject.value = [...listTemp].reversed.toList();
    toastService.showText(message: 'Xóa thành công');
  }
}
