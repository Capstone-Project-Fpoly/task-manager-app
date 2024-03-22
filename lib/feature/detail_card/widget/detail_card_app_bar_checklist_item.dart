import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_checklist_extension.dart';

class DetailCardAddAppBarCheckListItem extends StatelessWidget
    implements PreferredSizeWidget {
  final DetailCardBloc bloc;
  const DetailCardAddAppBarCheckListItem(this.bloc, {super.key});

  @override
  Widget build(context) {
    return AppBar(
      backgroundColor: ColorConstants.transparent,
      leading: InkWell(
        onTap: () {
          bloc.onBackCheckListItem();
        },
        child: const Icon(
          Icons.clear,
          color: ColorConstants.primary,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
