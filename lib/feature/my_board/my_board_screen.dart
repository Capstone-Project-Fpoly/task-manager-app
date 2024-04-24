import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/drawer/app_drawer.dart';
import 'package:task_manager/shared/widgets/icons/card_icon.dart';
import 'package:task_manager/shared/widgets/icons/empty.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class MyBoardScreen extends ConsumerWidget {
  const MyBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.myBoard);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  bloc.searchLocalBoard(value);
                },
              );
            }
            return const Text('Bảng của tôi');
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
      body: RefreshIndicator(
        onRefresh: () async {
          bloc.getMyBoard();
        },
        child: Stack(
          children: [
            ListView(),
            ObsBuilder(
              streams: [bloc.listBoardSubject, bloc.isLoadingSubject],
              builder: (context) {
                if (bloc.isLoadingSubject.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                final boards = bloc.listBoardSubject.value;
                return bloc.listBoardSubject.value.isEmpty
                    ? SizedBox(
                        width: width,
                        height: height,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bạn hiện chưa có bảng nào...',
                              style: AppTextStyle(fontSize: 15),
                            ),
                            EmptyIcon(
                              width: 100,
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: width,
                            height: 50,
                            color: Colors.black.withOpacity(0.7),
                            padding: EdgeInsetsConstants.horizontal12,
                            child: Row(
                              children: [
                                const Text(
                                  'Không gian làm việc của tôi',
                                  style: AppTextStyle(color: Colors.white),
                                ),
                                const Spacer(),
                                PopupMenuButton(
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 1,
                                      child: Text(
                                        'Bảng đã đóng',
                                        style: AppTextStyle(),
                                      ),
                                    ),
                                  ],
                                  onSelected: (value) {
                                    if (value == 1) {
                                      bloc.onTapToClosedBoard();
                                    }
                                  },
                                  constraints: BoxConstraints(
                                    minWidth: width - 350,
                                  ),
                                  child: const Icon(
                                    Icons.more_horiz,
                                    color: ColorConstants.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsetsConstants.vertical8,
                                child: Wrap(
                                  spacing: width * 0.025,
                                  runSpacing: 20,
                                  children: boards.map((e) {
                                    return SizedBox(
                                      width: width * 0.465,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                bloc.onTapToDetailBoard(
                                              board: e,
                                            ),
                                            onLongPress: () {
                                              bloc.dialogShowOptionBoard(
                                                context: context,
                                                board: e,
                                              );
                                            },
                                            child: Container(
                                              width: width * 0.5,
                                              height: height * 0.12,
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorUtils.getColorFromHex(
                                                  e?.color,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                          SizedBoxConstants.h4,
                                          Text(
                                            e?.title ?? '',
                                            style: const AppTextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
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
            onOpen: () => bloc.onTapShowOptions(true),
            onClose: () => bloc.onTapShowOptions(false),
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
}
