import 'package:flutter/material.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/feature/board_detail/enum/board_detail_app_bar_enum.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_add_card.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_add_list.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_edit_board_title.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_edit_list_label.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_search.dart';

extension BoardDetailAppBarEnumExtension on BoardDetailAppBarEnum {
  PreferredSizeWidget appBarBuilder(BoardDetailBloc bloc) {
    switch (this) {
      case BoardDetailAppBarEnum.addCard:
        return BoardDetailAppBarAddCard(bloc);
      case BoardDetailAppBarEnum.addList:
        return BoardDetailAppBarAddList(bloc);
      case BoardDetailAppBarEnum.editBoardTitle:
        return BoardDetailAppBarEditBoardTitle(bloc);
      case BoardDetailAppBarEnum.search:
        return BoardDetailAppBarSearch(bloc);
      case BoardDetailAppBarEnum.editListLabel:
        return BoardDetailAppBarEditListLabel(bloc);
    }
  }
}
