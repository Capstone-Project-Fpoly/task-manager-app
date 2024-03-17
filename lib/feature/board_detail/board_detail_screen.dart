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
    final color = ColorUtils.getColorFromHex(bloc.boardFragment.color);
    final hslColor = HSLColor.fromColor(color);

    final darkerColor =
        hslColor.withLightness(hslColor.lightness * 0.5).toColor();
    return ObsBuilder(
      streams: [
        bloc.isDraggingCardSubject,
        bloc.isDragCardMoveContainerDeleteSubject,
        bloc.appBarEnumSubject,
      ],
      builder: (context) {
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
                        onDoubleTap: bloc.onTapEditBoardTitle,
                        child: Text(
                          bloc.boardFragment.title ?? 'Bảng thử nghiệm',
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
                  color: ColorUtils.getColorFromHex(bloc.boardFragment.color),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              return DragAndDropListsCustom();
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: bloc.onTapZoom,
            child: ObsBuilder(
              streams: [bloc.isZoomSubject],
              builder: (context) {
                if (bloc.isZoomSubject.value) {
                  return const Icon(Icons.zoom_out);
                }
                return const Icon(Icons.zoom_in);
              },
            ),
          ),
        );
      },
    );
  }
}
