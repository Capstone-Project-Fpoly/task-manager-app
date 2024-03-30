import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board/board_bloc.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/drawer/app_drawer.dart';
import 'package:task_manager/shared/widgets/icons/card_icon.dart';
import 'package:task_manager/shared/widgets/icons/empty.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class BoardScreen extends ConsumerWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.board);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final appBloc = ref.watch(BlocProvider.app);
    final me = appBloc.userSubject.value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: ColorConstants.white,
          onPressed: () {
            Scaffold.of(context).openDrawer();
            bloc.openSearch(false);
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
            return const Text('Bảng');
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
          InkWell(
            child: const Icon(Icons.notifications),
            onTap: () {
              bloc.onTapToNotification();
            },
          ),
          SizedBoxConstants.w15,
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
          if (bloc.listBoardSubject.value.isEmpty) {
            return SizedBox(
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
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              bloc.getBoards();
            },
            child: Stack(
              children: [
                ListView(),
                ListView.builder(
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
      floatingActionButton: ObsBuilder(
        streams: [
          bloc.isDialOpenSubject,
          bloc.extendSubject,
          bloc.clickSubject,
        ],
        builder: (context) {
          return SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            iconTheme: const IconThemeData(color: Colors.white),
            spacing: 3,
            openCloseDial: ValueNotifier(bloc.isDialOpenSubject.value),
            childPadding: EdgeInsetsConstants.all4,
            spaceBetweenChildren: 4,
            buttonSize: const Size.fromRadius(
              30,
            ),
            label: bloc.extendSubject.value ? const Text('Open') : null,
            // The label of the main button.
            activeLabel: bloc.extendSubject.value ? const Text('Close') : null,
            childrenButtonSize: const Size.fromRadius(35),
            visible: true,
            direction: SpeedDialDirection.up,
            switchLabelPosition: false,
            closeManually: false,
            renderOverlay: true,
            onOpen: () => bloc.changeClick(true),
            onClose: () => bloc.changeClick(false),
            useRotationAnimation: true,
            backgroundColor: Colors.green,
            activeBackgroundColor: Colors.green,
            elevation: 8.0,
            isOpenOnStart: false,
            animationDuration: const Duration(milliseconds: 300),
            children: [
              SpeedDialChild(
                child: const SizedBox(
                  height: 20,
                  width: 20,
                  child: TrelloIcon(
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.green,
                labelWidget: Container(
                  padding: EdgeInsetsConstants.right10,
                  child: const Text(
                    'Bảng',
                    style: AppTextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () => bloc.onTapToAddBoard(),
              ),
              SpeedDialChild(
                child: const SizedBox(
                  height: 20,
                  width: 20,
                  child: CardIcon(
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.green,
                labelWidget: Container(
                  padding: EdgeInsetsConstants.right10,
                  child: const Text(
                    'Thẻ',
                    style: AppTextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                visible: true,
                onTap: () => bloc.onTapToAddCard(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget itemBoard({
    required double width,
    required double height,
    required List<Fragment$BoardFragment?> boards,
    required BoardBloc bloc,
    required bool isCreated,
  }) {
    final board = boards.first;
    if (board == null) {
      return const SizedBox.shrink();
    }
    final text =
        isCreated ? 'Bảng của tôi' : 'Bảng của ${board.ownerUser?.fullName}';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: width,
          height: 50,
          color: Colors.black.withOpacity(0.7),
          padding: EdgeInsetsConstants.horizontal12,
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final board = boards[index];
            return InkWell(
              onTap: () => bloc.onTapToDetailBoard(
                board: board,
              ),
              onLongPress: () {
                //_openDialog(context , board?.title ?? '');
                bloc.dialogShowOptionBoard(
                  context: context,
                  board: board,
                );
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
                    Text(
                      board?.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
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
