import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/shared/enum/option_detail_card_enum.dart';

class DetailCardAddAppBarComment extends StatelessWidget
    implements PreferredSizeWidget {
  final DetailCardBloc bloc;
  const DetailCardAddAppBarComment(this.bloc, {super.key});

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      title: const Text(
        'Bình luận mới',
        style: TextStyle(
          color: ColorConstants.black,
        ),
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => OptionDetailCardEnum.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.title),
                ),
              )
              .toList(),
          onSelected: (value) => bloc.chooseOption(
            idOption: value.id,
            context: context,
          ),
          constraints: BoxConstraints(
            minWidth: width - 200,
          ),
          child: const Icon(
            Icons.more_vert,
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
