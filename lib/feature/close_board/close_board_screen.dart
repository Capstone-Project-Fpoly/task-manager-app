import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/close_board/close_board_bloc.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/drawer/app_drawer.dart';
import 'package:task_manager/shared/widgets/icons/empty.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class CloseBoardScreen extends ConsumerWidget {
  const CloseBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.closeBoardBloc);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final appBloc = ref.watch(BlocProvider.app);
    final me = appBloc.userSubject.value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: ColorConstants.white,
          onPressed: () {
            bloc.onTapBack();
          },
        ),
        title: ObsBuilder(
          streams: [bloc.selectedSearchSubject],
          builder: (context) {
            final isSearch = bloc.selectedSearchSubject.value;
            if (isSearch) {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'Tìm kiếm bảng...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                autofocus: true,
                style: const AppTextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  bloc.searchLocalBoard(value);
                },
              );
            }
            return const Text('Bảng đã đóng');
          },
        ),
        actions: <Widget>[
          ObsBuilder(
            streams: [bloc.selectedSearchSubject],
            builder: (context) {
              final isSearch = bloc.selectedSearchSubject.value;
              if (isSearch) {
                return InkWell(
                  child: const Icon(Icons.close),
                  onTap: () {
                    bloc.openSearch(false);
                  },
                );
              }
              return InkWell(
                child: const Icon(Icons.search),
                onTap: () {
                  bloc.openSearch(true);
                },
              );
            },
          ),
          SizedBoxConstants.w20,
        ],
      ),
      drawer: const AppDrawer(),
      body: ObsBuilder(
        streams: [
          bloc.isLoadingSubject,
          bloc.selectedSearchSubject,
          bloc.groupByBoardSubject,
        ],
        builder: (context) {
          // final isSearch = bloc.selectedSearchSubject.value;
          final groupedByBoard = bloc.groupByBoardSubject.value;
          if (bloc.isLoadingSubject.value) {
            return const Center(child: CircularProgressIndicator());
          }
          // final boards = isSearch
          //     ? bloc.listBoardSearchSubject.value
          //     : bloc.listBoardSubject.value;
          return RefreshIndicator(
            onRefresh: () async {
              bloc.getBoardsClosed();
            },
            child: Stack(
              children: [
                ListView(),
                bloc.listBoardSubject.value.isEmpty
                    ? SizedBox(
                        width: width,
                        height: height,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bạn hiện chưa có bảng nào...',
                              style: TextStyle(fontSize: 15),
                            ),
                            EmptyIcon(
                              width: 100,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: groupedByBoard.length,
                        itemBuilder: (context, index) {
                          final boards = groupedByBoard[index];
                          return itemBoard(
                            width: width,
                            height: height,
                            boards: boards,
                            bloc: bloc,
                            isCreated: me?.uid == boards.first?.ownerUser?.uid,
                          );
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget itemBoard({
    required double width,
    required double height,
    required List<Fragment$BoardFragment?> boards,
    required CloseBoardBloc bloc,
    required bool isCreated,
  }) {
    final board = boards.first;
    if (board == null) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final board = boards[index];
            return InkWell(
              onTap: () {
                bloc.onTapToDetailBoard(board: board);
              },
              child: Container(
                padding: EdgeInsetsConstants.vertical10 +
                    EdgeInsetsConstants.horizontal12,
                width: width,
                height: 60,
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorUtils.getColorFromHex(
                          board?.color,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        board?.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: const AppTextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(),
          itemCount: boards.length,
        ),
      ],
    );
  }
}
