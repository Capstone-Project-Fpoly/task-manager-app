import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board_detail/extension/board_detail_app_bar_enum_extension.dart';
import 'package:task_manager/feature/board_detail/widget/board_detail_app_bar_dragging_card.dart';
import 'package:task_manager/feature/board_detail/widget/drag_and_drop_lists_custom.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class BoardDetailScreen extends ConsumerWidget {
  const BoardDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.boardDetail);

    return ObsBuilder(
      streams: [
        bloc.isDraggingCardSubject,
        bloc.isDragCardMoveContainerDeleteSubject,
        bloc.appBarEnumSubject,
        bloc.currentBoardSubject,
        bloc.isCheckBoardSubject,
      ],
      builder: (context) {
        final checkBoard = bloc.isCheckBoardSubject.value;
        final currentBoard = bloc.currentBoardSubject.value;
        final color = ColorUtils.getColorFromHex(currentBoard.color);
        final hslColor = HSLColor.fromColor(color);

        final darkerColor =
            hslColor.withLightness(hslColor.lightness * 0.5).toColor();
        final isDragCardMove = bloc.isDragCardMoveContainerDeleteSubject.value;
        final appBarEnum = bloc.appBarEnumSubject.value;
        return Scaffold(
          appBar: bloc.isDraggingCardSubject.value
              ? BoardDetailAppBarDraggingCard(
                  bloc: bloc,
                  isDragCardMove: isDragCardMove,
                )
              : appBarEnum == null
                  ? AppBar(
                      leading: InkWell(
                        onTap: () {
                          bloc.onTapBack();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      title: GestureDetector(
                        onDoubleTap: () {
                          if (checkBoard) bloc.onTapEditBoardTitle();
                        },
                        child: Text(
                          currentBoard.title ?? 'Bảng thử nghiệm',
                          style: const AppTextStyle.white(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      backgroundColor: darkerColor,
                      leadingWidth: 50,
                      actions: [
                        Row(
                          children: [
                            if (checkBoard)
                              InkWell(
                                child: const Icon(
                                  Icons.filter_list,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  bloc.onTapOpenSearch();
                                },
                              ),
                            SizedBoxConstants.w15,
                            InkWell(
                              child: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              onTap: () {
                                bloc.onTapNotification();
                              },
                            ),
                            SizedBoxConstants.w15,
                            if (checkBoard)
                              GestureDetector(
                                onTap: () => bloc.onTapOpenMenuBoardScreen(),
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ),
                              ),
                            SizedBoxConstants.w10,
                          ],
                        ),
                      ],
                    )
                  : appBarEnum.appBarBuilder(bloc),
          body: ObsBuilder(
            streams: [bloc.isLoadingSubject],
            builder: (context) {
              if (bloc.isLoadingSubject.value) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: ColorUtils.getColorFromHex(currentBoard.color),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              return DragAndDropListsCustom();
            },
          ),
        );
      },
    );
  }
}
