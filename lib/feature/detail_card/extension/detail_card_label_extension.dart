import 'package:flutter/material.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_add_label_widget.dart';
import 'package:task_manager/graphql/Fragment/label_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/label/create_label_of_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/label/delete_label_of_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/label/get_labels_of_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/label/update_label_of_board.graphql.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

extension DetailCardLabelExtension on DetailCardBloc {
  Future<void> getLabelOfBoard() async {
    final result = await graphqlService.client.mutate$GetLabelsOfBoard(
      Options$Mutation$GetLabelsOfBoard(
        variables: Variables$Mutation$GetLabelsOfBoard(
          idBoard: idBoard,
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(message: 'Lỗi khi lấy thông tin nhãn!');
      return;
    }
    final labels = result.parsedData?.getLabelsOfBoard ?? [];
    listLabelOfBoardSubject.value = labels;
  }

  void onTapToSelect(Fragment$LabelFragment? label) {
    if (label == null) return;
    final listLabel = listLabelOfCardSubject.value;
    if (listLabel.contains(label)) {
      listLabel.remove(label);
    } else {
      listLabel.add(label);
    }
    listLabelOfCardSubject.value = [...listLabel];
  }

  void onTapOpenAddLabelBottomSheet(BuildContext context) {
    labelController.text = '';
    labelSelectedAddSubject.value = null;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const DetailCardAddLabelWidget(
          isAddLabel: true,
        );
      },
    );
  }

  void onTapOpenEditLabelBottomSheet(
    BuildContext context, {
    required Fragment$LabelFragment? label,
  }) {
    labelController.text = label?.title ?? '';
    labelSelectedAddSubject.value = label;
    labelSelectedEditSubject.value = label;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const DetailCardAddLabelWidget(
          isAddLabel: false,
        );
      },
    );
  }

  void onTapSelectColorAddLabel(Fragment$LabelFragment label) {
    labelSelectedAddSubject.value = label;
  }

  Future<void> onTapAddLabel() async {
    final label = labelSelectedAddSubject.value;
    if (label == null) {
      toastService.showText(message: 'Vui lòng chọn màu cho nhãn!');
      return;
    }
    final title = labelController.text;
    final currentLabels = listLabelOfBoardSubject.value;
    listLabelOfBoardSubject.value = [
      ...currentLabels,
      ...[label],
    ];
    routerService.pop();
    labelSelectedAddSubject.value = null;
    final result = await graphqlService.client.mutate$CreateLabelOfBoard(
      Options$Mutation$CreateLabelOfBoard(
        variables: Variables$Mutation$CreateLabelOfBoard(
          idBoard: idBoard,
          color: label.color ?? '0000FF',
          title: title,
        ),
      ),
    );
    if (result.hasException) {
      getLabelOfBoard();
      return;
    }
    listLabelOfBoardSubject.value = [
      ...currentLabels,
      ...[
        result.parsedData?.createLabelOfBoard,
      ],
    ];
  }

  Future<void> onTapEditLabel() async {
    final labelAdd = labelSelectedAddSubject.value;
    final labelEdit = labelSelectedEditSubject.value;
    if (labelAdd == null || labelEdit == null) {
      toastService.showText(message: 'Vui lòng chọn màu cho nhãn!');
      return;
    }
    final title = labelController.text;
    final currentLabels = listLabelOfBoardSubject.value;
    final listLabelOfCard = listLabelOfCardSubject.value;
    final index =
        currentLabels.indexWhere((element) => element?.id == labelEdit.id);
    if (index != -1) {
      currentLabels[index] =
          labelEdit.copyWith(title: title, color: labelAdd.color);
    }
    final indexLabelOfCard =
        listLabelOfCard.indexWhere((element) => element?.id == labelEdit.id);
    if (indexLabelOfCard != -1) {
      listLabelOfCard[indexLabelOfCard] = labelEdit.copyWith(
        title: title,
        color: labelEdit.color,
      );
      listLabelOfCardSubject.value = [...currentLabels];
    }
    listLabelOfBoardSubject.value = [...currentLabels];
    routerService.pop();
    labelSelectedAddSubject.value = null;
    final result = await graphqlService.client.mutate$UpdateLabelOfBoard(
      Options$Mutation$UpdateLabelOfBoard(
        variables: Variables$Mutation$UpdateLabelOfBoard(
          idLabel: labelEdit.id,
          color: labelAdd.color ?? '0000FF',
          title: title,
        ),
      ),
    );
    if (result.hasException) {
      getLabelOfBoard();
      return;
    }
  }

  void onTapConfirmDeleteLabel(BuildContext context) {
    final label = labelSelectedEditSubject.value;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Xác nhận',
            style: AppTextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: const Text('Bạn có chắc chắn muốn xóa nhãn này không?'),
          actions: [
            TextButton(
              onPressed: () {
                routerService.pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                if (label != null) {
                  onTapDeleteLabel(label);
                }
                routerService.pop();
                routerService.pop();
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  Future<void> onTapDeleteLabel(Fragment$LabelFragment label) async {
    final currentLabels = listLabelOfBoardSubject.value;
    final listLabelOfCard = listLabelOfCardSubject.value;
    final index =
        currentLabels.indexWhere((element) => element?.id == label.id);
    if (index != -1) {
      currentLabels.removeAt(index);
    }
    final indexLabelOfCard =
        listLabelOfCard.indexWhere((element) => element?.id == label.id);
    if (indexLabelOfCard != -1) {
      listLabelOfCard.removeAt(indexLabelOfCard);
      listLabelOfCardSubject.value = [...listLabelOfCard];
    }
    listLabelOfBoardSubject.value = [...currentLabels];
    final result = await graphqlService.client.mutate$DeleteLabelOfBoard(
      Options$Mutation$DeleteLabelOfBoard(
        variables: Variables$Mutation$DeleteLabelOfBoard(
          idLabel: label.id,
        ),
      ),
    );
    if (result.hasException) {
      getLabelOfBoard();
      return;
    }
  }
}
