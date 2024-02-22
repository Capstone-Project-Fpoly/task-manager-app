import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/drag_and_drop/drag_and_drop_bloc.dart';
import 'package:task_manager/feature/drag_and_drop/widget/show_bottom_widget.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/shared/utilities/color.dart';

class DragDropScreen extends ConsumerWidget {
  const DragDropScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.dragAndDrop);
    final board = bloc.boardBloc.selectedBoardSubject.value;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ObsBuilder(
      streams: [
        bloc.isAddCardSubject,
        bloc.isAddListSubject,
      ],
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorUtils.getColorFromHex(board?.color),
          appBar: AppBar(
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
            title: bloc.isAddListSubject.value == false
                ? bloc.isAddCardSubject.value == true
                    ? const Text('Thêm thẻ...')
                    : Text(board?.title ?? 'Bảng thử nghiệm')
                : const Text('Thêm danh sách'),
            backgroundColor: const Color(0xFF0071CE),
            leadingWidth: 50,
            actions: [
              bloc.isAddListSubject.value == false &&
                      bloc.isAddCardSubject.value == false
                  ? const Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                        SizedBoxConstants.w15,
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        SizedBoxConstants.w15,
                        Icon(
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
                            final isLoading = bloc.isLoadingAddSubject.value;
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
            streams: [
              bloc.listFragmentsSubject,
              bloc.isLoadingSubject,
              bloc.isZoomSubject,
            ],
            builder: (context) {
              if (bloc.isLoadingSubject.value) {
                return const Center(child: CircularProgressIndicator());
              }
              // final scaleFactor = bloc.isZoomSubject.value ? 0.8 : 1.0;
              return DragAndDropLists(
                scrollController: bloc.scrollListController,
                contentsWhenEmpty: const Text(
                  'Chưa có danh sách nào!',
                  style: TextStyle(color: Colors.white),
                ),
                listTarget: InkWell(
                  onTap: bloc.onTapAddList,
                  child: AnimatedSwitcher(
                    key: const ValueKey('key_animated'),
                    duration: const Duration(milliseconds: 100),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: !bloc.isAddListSubject.value
                        ? Container(
                            // key: const ValueKey('1'),
                            alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: CupertinoColors.extraLightBackgroundGray,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Thêm danh sách',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Container(
                            padding: EdgeInsetsConstants.horizontal10,
                            key: const ValueKey('2'),
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: CupertinoColors.extraLightBackgroundGray,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              autofocus: true,
                              style: const TextStyle(color: Colors.black),
                              controller: bloc.addListController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Tên danh sách',
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                children: List.generate(
                  bloc.listFragmentsSubject.value.length,
                  (index) {
                    return _buildList(index, bloc, width, height, context);
                  },
                ),
                onItemReorder: bloc.onItemReorder,
                onListReorder: bloc.onListReorder,
                axis: Axis.horizontal,
                listWidth: 300,
                listDraggingWidth: 300,
                listDecoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                listPadding: EdgeInsetsConstants.all10,
                lastListTargetSize: 400,
              );
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

  void showBottomSheet(BuildContext context, String nameList, String idList,) {
    const TextStyle style = TextStyle(fontSize: 15, color: Colors.black);
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(7),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return DragAndDropShowBottomSheet(nameList: nameList, idList: idList);
      },
    );
  }


  DragAndDropList _buildList(
    int outerIndex,
    DragAndDropBloc bloc,
    double width,
    double height,
    BuildContext context,
  ) {
    final innerList = bloc.listFragmentsSubject.value[outerIndex];
    return DragAndDropList(
      decoration: BoxDecoration(
        color: CupertinoColors.extraLightBackgroundGray,
        borderRadius: BorderRadius.circular(10),
      ),
      contentsWhenEmpty: SizedBoxConstants.shrink,
      header: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
              ),
              padding: EdgeInsetsConstants.all10,
              child: Text(
                innerList?.label ?? '',
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => showBottomSheet(context,innerList?.label ?? '',innerList!.id),
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      footer: Padding(
        padding:
            EdgeInsetsConstants.horizontal10 + EdgeInsetsConstants.vertical16,
        child: ObsBuilder(
          streams: [bloc.isAddCardSubject, bloc.indexAddCardSubject],
          builder: (context) {
            final indexCard = bloc.indexAddCardSubject.value;
            final isShowAddCard = indexCard == null
                ? true
                : bloc.isAddCardSubject.value == true &&
                    indexCard != outerIndex;
            return AnimatedSwitcher(
              key: const ValueKey('add_card'),
              duration: const Duration(milliseconds: 500),
              child: isShowAddCard
                  ? Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            bloc.onTapAddCard(outerIndex);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.blue,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Thêm thẻ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.image,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Card(
                      elevation: 0,
                      child: Container(
                        width: width,
                        height: 40,
                        padding: EdgeInsetsConstants.horizontal10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          autofocus: true,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          controller: bloc.addCardController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tên thẻ',
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
      children: List.generate(
        innerList?.cards?.length ?? 0,
        (index) => _buildItem(innerList!.cards?[index], width, height),
      ),
      lastTarget: SizedBoxConstants.h8,
    );
  }

  DragAndDropItem _buildItem(
    Fragment$CardFragment? item,
    double width,
    double height,
  ) {
    return DragAndDropItem(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bo góc của Card
        ),
        child: Container(
          padding:
              EdgeInsetsConstants.horizontal10 + EdgeInsetsConstants.vertical16,
          width: width,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            item?.title ?? '',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
