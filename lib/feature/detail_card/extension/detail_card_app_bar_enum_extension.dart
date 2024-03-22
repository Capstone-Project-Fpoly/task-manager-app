import 'package:flutter/material.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/feature/board_detail/enum/board_detail_app_bar_enum.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_add_card.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_add_list.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_edit_board_title.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_edit_list_label.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_search.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/enum/detail_card_app_bar_enum.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_app_bar_checklist.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_app_bar_comment.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_app_bar_description.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_app_bar_label.dart';

extension DetailCardAppBarEnumExtension on DetailCardAppBarEnum {
  PreferredSizeWidget appBarBuilder(DetailCardBloc bloc) {
    switch (this) {
      case DetailCardAppBarEnum.description:
        return DetailCardAddAppBarDescription(bloc);
      case DetailCardAppBarEnum.checklist:
        return DetailCardAddAppBarCheckList(bloc);
      case DetailCardAppBarEnum.label:
        return DetailCardAddAppBarLabel(bloc);
      case DetailCardAppBarEnum.comment:
        return DetailCardAddAppBarComment(bloc);
    }
  }
}
