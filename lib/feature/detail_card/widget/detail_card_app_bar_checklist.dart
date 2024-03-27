import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_checklist_extension.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_on_back_extension.dart';

class DetailCardAddAppBarCheckList extends StatelessWidget
    implements PreferredSizeWidget {
  final DetailCardBloc bloc;
  const DetailCardAddAppBarCheckList(this.bloc, {super.key});

  @override
  Widget build(context) {
    return AppBar(
      title: const Text(
        'Mục mới',
        style: TextStyle(
          color: ColorConstants.black,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            bloc.onTapAddCheckList();
          },
          child: const Icon(
            Icons.check,
            color: ColorConstants.primary,
          ),
        ),
        SizedBoxConstants.w12,
      ],
      backgroundColor: ColorConstants.transparent,
      leading: InkWell(
        onTap: () {
          bloc.onBackToBoardScreen();
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
