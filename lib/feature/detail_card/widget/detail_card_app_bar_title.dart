import 'package:flutter/material.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';

class DetailCardAddAppBarTitle extends StatelessWidget
    implements PreferredSizeWidget {
  final DetailCardBloc bloc;
  const DetailCardAddAppBarTitle(this.bloc, {super.key});

  @override
  Widget build(context) {
    return AppBar(
      title: const Text(
        'Chỉnh sửa tiêu đề',
        style: TextStyle(
          color: ColorConstants.black,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            bloc.onTapUpdateTitle();
          },
          child: ObsBuilder(
            streams: [bloc.isLoadingUpdateSubject],
            builder: (context) {
              if (bloc.isLoadingUpdateSubject.value) {
                return const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorConstants.primary,
                    ),
                  ),
                );
              }
              return const Icon(
                Icons.check,
                color: ColorConstants.primary,
              );
            },
          ),
        ),
        SizedBoxConstants.w12,
      ],
      backgroundColor: ColorConstants.transparent,
      leading: InkWell(
        onTap: () {
          bloc.onTapBackTitle();
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