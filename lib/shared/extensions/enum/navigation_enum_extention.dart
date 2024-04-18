import 'package:flutter/material.dart';
import 'package:task_manager/shared/enum/navigation_enum.dart';
import 'package:task_manager/shared/widgets/icons/board_icon.dart';

extension NavigationEnumExtention on NavigationEnum {
  String get label {
    switch (this) {
      case NavigationEnum.myBroad:
        return 'Bảng của tôi';
      case NavigationEnum.broad:
        return 'Bảng';
      case NavigationEnum.closeBoard:
        return 'Bảng đã đóng';
      case NavigationEnum.myCard:
        return 'Các thẻ của tôi';
      case NavigationEnum.help:
        return 'Giới thiệu';
    }
  }

  Widget get iconSelected {
    switch (this) {
      case NavigationEnum.broad:
        return const BoardIcon.color(
          width: 24,
        );
      case NavigationEnum.myBroad:
        return const Icon(Icons.group_outlined, color: Colors.blue);
      case NavigationEnum.closeBoard:
        return const Icon(Icons.layers_clear, color: Colors.blue);
      case NavigationEnum.myCard:
        return const Icon(
          Icons.credit_card,
          color: Colors.blue,
        );
      case NavigationEnum.help:
        return const Icon(Icons.info_outline_rounded, color: Colors.blue);
    }
  }

  Widget get iconUnSelected {
    switch (this) {
      case NavigationEnum.broad:
        return const BoardIcon(
          width: 24,
        );
      case NavigationEnum.myBroad:
        return const Icon(Icons.group_outlined, color: Colors.black);
      case NavigationEnum.closeBoard:
        return const Icon(Icons.layers_clear, color: Colors.black);
      case NavigationEnum.myCard:
        return const Icon(
          Icons.credit_card,
          color: Colors.black,
        );
      case NavigationEnum.help:
        return const Icon(Icons.info_outline_rounded, color: Colors.black);
    }
  }
}
