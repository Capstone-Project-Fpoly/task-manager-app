import 'package:flutter/material.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/shared/utilities/color.dart';

class BoardDetailAppBarDraggingCard extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isDragCardMove;
  final BoardDetailBloc bloc;
  const BoardDetailAppBarDraggingCard({
    Key? key,
    required this.isDragCardMove,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ColorUtils.getColorFromHex(bloc.boardFragment.color);
    final hslColor = HSLColor.fromColor(color);

    final darkerColor =
        hslColor.withLightness(hslColor.lightness * 0.5).toColor();
    return AppBar(
      leading: const Icon(null),
      backgroundColor: isDragCardMove ? Colors.red : darkerColor,
      centerTitle: true,
      title: DragTarget(
        builder: (context, candidateData, rejectedData) {
          return ObsBuilder(
            streams: [bloc.isDragCardMoveContainerDeleteSubject],
            builder: (context) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder_delete_rounded,
                    color: Colors.white,
                  ),
                  SizedBoxConstants.w10,
                  Text(
                    'Kéo vào đây để xóa ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          );
        },
        onMove: (details) {
          bloc.changeDragCardMoveContainerDelete(true);
        },
        onLeave: (data) {
          bloc.changeDragCardMoveContainerDelete(false);
        },
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
