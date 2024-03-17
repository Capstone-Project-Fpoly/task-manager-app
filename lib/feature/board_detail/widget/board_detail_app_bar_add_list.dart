import 'package:flutter/material.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/shared/utilities/color.dart';

class BoardDetailAppBarAddList extends StatelessWidget
    implements PreferredSizeWidget {
  final BoardDetailBloc bloc;
  const BoardDetailAppBarAddList(this.bloc, {Key? key}) : super(key: key);
  @override
  AppBar build(BuildContext context) {
    final color = ColorUtils.getColorFromHex(bloc.boardFragment.color);
    final hslColor = HSLColor.fromColor(color);

    final darkerColor =
        hslColor.withLightness(hslColor.lightness * 0.5).toColor();
    return AppBar(
      leading: InkWell(
        onTap: () {
          bloc.onTapClose();
        },
        child: const Icon(Icons.clear),
      ),
      title: const Text('Thêm danh sách'),
      backgroundColor: darkerColor,
      leadingWidth: 50,
      actions: [
        Padding(
          padding: EdgeInsetsConstants.right16,
          child: ObsBuilder(
            streams: [
              bloc.isLoadingAddSubject,
              bloc.isLoadingAddSubject,
            ],
            builder: (context) {
              final isLoading = bloc.isLoadingAddSubject.value;
              final isLoadingUpdate = bloc.isLoadingAddSubject.value;
              if (isLoading || isLoadingUpdate) {
                return const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return InkWell(
                onTap: () {
                  bloc.onTapAddList();
                },
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
