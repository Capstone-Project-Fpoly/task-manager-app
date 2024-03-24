import 'package:flutter/material.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class BoardDetailAppBarEditBoardTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const BoardDetailAppBarEditBoardTitle(this.bloc, {Key? key})
      : super(key: key);
  final BoardDetailBloc bloc;
  @override
  AppBar build(BuildContext context) {
    final currentBoard = bloc.currentBoardSubject.value;
    final color = ColorUtils.getColorFromHex(currentBoard.color);
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
      title: TextFormField(
        initialValue: currentBoard.title ?? 'Bảng thử nghiệm',
        // controller: bloc.titleBoardEditingController,
        onChanged: (value) {
          bloc.titleBoardSubject.value = value;
        },
        autofocus: true,
        style: const AppTextStyle.white(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: currentBoard.title ?? 'Bảng thử nghiệm',
        ),
      ),
      backgroundColor: darkerColor,
      leadingWidth: 50,
      actions: [
        Padding(
          padding: EdgeInsetsConstants.right16,
          child: ObsBuilder(
            streams: [bloc.isLoadingAddSubject],
            builder: (context) {
              final isLoadingUpdate = bloc.isLoadingAddSubject.value;
              if (isLoadingUpdate) {
                return const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return InkWell(
                onTap: bloc.onTapUpdateBoard,
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
