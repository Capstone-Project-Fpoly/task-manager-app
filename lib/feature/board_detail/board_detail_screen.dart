import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board_detail/widget/drag_and_drop_lists_custom.dart';
import 'package:task_manager/shared/utilities/color.dart';

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
        bloc.isAddCardSubject,
        bloc.isAddListSubject,
        bloc.isDraggingCardSubject,
        bloc.isDragCardMoveContainerDeleteSubject,
      ],
      builder: (context) {
        final isDragCardMove = bloc.isDragCardMoveContainerDeleteSubject.value;
        return Scaffold(
          backgroundColor: ColorUtils.getColorFromHex(bloc.boardFragment.color),
          appBar: bloc.isDraggingCardSubject.value
              ? AppBar(
                  backgroundColor: isDragCardMove ? Colors.red : darkerColor,
                  leading: const Icon(null),
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
                )
              : AppBar(
                  leading: bloc.isAddListSubject.value == false &&
                          bloc.isAddCardSubject.value == false
                      ? InkWell(
                          onTap: () {
                            bloc.onBackToBoardScreen();
                          },
                          child: const Icon(Icons.arrow_back),
                        )
                      : InkWell(
                          onTap: () {
                            bloc.closeAdd();
                          },
                          child: const Icon(Icons.clear),
                        ),
                  title: ObsBuilder(
                    streams: [bloc.selectedSearchSubject],
                    builder: (context) {
                      final isSearch = bloc.selectedSearchSubject.value;
                      if (isSearch) {
                        return TextField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Tìm kiếm thẻ...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          onChanged: (value) {
                            bloc.searchLocalCard(value);
                          },
                        );
                      }
                      return bloc.isAddListSubject.value == false
                          ? bloc.isAddCardSubject.value == true
                              ? const Text('Thêm thẻ...')
                              : Text(
                                  bloc.boardFragment.title ?? 'Bảng thử nghiệm',
                                )
                          : const Text('Thêm danh sách');
                    },
                  ),
                  backgroundColor: darkerColor,
                  leadingWidth: 50,
                  actions: [
                    bloc.isAddListSubject.value == false &&
                            bloc.isAddCardSubject.value == false
                        ? Row(
                            children: [
                              ObsBuilder(
                                streams: [bloc.selectedSearchSubject],
                                builder: (context) {
                                  final isSearch =
                                      bloc.selectedSearchSubject.value;
                                  if (isSearch) {
                                    return InkWell(
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        bloc.openSearch(false);
                                      },
                                    );
                                  }
                                  return InkWell(
                                    child: const Icon(
                                      Icons.filter_list,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      bloc.openSearch(true);
                                    },
                                  );
                                },
                              ),
                              SizedBoxConstants.w15,
                              InkWell(
                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  bloc.onBackToBoardDetailScreen();
                                },
                              ),
                              SizedBoxConstants.w15,
                              const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              ),
                              SizedBoxConstants.w10,
                            ],
                          )
                        : Padding(
                            padding: EdgeInsetsConstants.right16,
                            child: InkWell(
                              onTap: () {
                                bloc.add();
                              },
                              child: ObsBuilder(
                                streams: [bloc.isLoadingAddSubject],
                                builder: (context) {
                                  final isLoading =
                                      bloc.isLoadingAddSubject.value;
                                  if (isLoading) {
                                    return const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                  return const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
          body: ObsBuilder(
            streams: [bloc.isLoadingSubject],
            builder: (context) {
              if (bloc.isLoadingSubject.value) {
                return const Center(child: CircularProgressIndicator());
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
