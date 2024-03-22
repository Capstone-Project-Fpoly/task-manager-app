import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/feature/board_detail/enum/board_detail_app_bar_enum.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class DragAndDropListsCustom extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.boardDetail);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ObsBuilder(
      streams: [
        bloc.listFragmentsSubject,
        bloc.isZoomSubject,
        bloc.isDraggingCardSubject,
      ],
      builder: (context) {
        return Container(
          color: ColorUtils.getColorFromHex(bloc.boardFragment.color),
          child: DragAndDropLists(
            scrollController: bloc.scrollListController,
            contentsWhenEmpty: const Text(
              'Chưa có danh sách nào!',
              style: TextStyle(color: Colors.white),
            ),
            listTarget: InkWell(
              onTap: bloc.onTapOpenAddList,
              child: AnimatedSwitcher(
                key: const ValueKey('key_animated'),
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: ObsBuilder(
                  streams: const [],
                  builder: (context) {
                    final isSearch = bloc.appBarEnumSubject.value ==
                        BoardDetailAppBarEnum.search;
                    final isAddList = bloc.appBarEnumSubject.value ==
                        BoardDetailAppBarEnum.addList;
                    if (isSearch) {
                      return const SizedBox.shrink();
                    }
                    return !isAddList
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
                          );
                  },
                ),
              ),
            ),
            children: List.generate(
              bloc.listFragmentsSubject.value.length,
              (index) {
                return dragDropList(
                  context: context,
                  width: width,
                  bloc: bloc,
                  height: height,
                  outerIndex: index,
                );
              },
            ),
            onItemReorder: bloc.onItemReorder,
            onListReorder: bloc.onListReorder,
            // onItemDraggingChanged: (item, dragging) {
            //   bloc.changeDragIngCard(
            //     value: dragging,
            //     item: item,
            //     context: context,
            //   );
            // },
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
          ),
        );
      },
    );
  }

  DragAndDropList dragDropList({
    required int outerIndex,
    required BoardDetailBloc bloc,
    required double width,
    required double height,
    required BuildContext context,
  }) {
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
            child: ObsBuilder(
              streams: const [],
              builder: (context) {
                final isSelected = bloc.appBarEnumSubject.value ==
                    BoardDetailAppBarEnum.editListLabel;
                return GestureDetector(
                  onDoubleTap: () {
                    bloc.onTapLabelListTextField(
                      idList: innerList?.id,
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(7.0)),
                    ),
                    padding: EdgeInsetsConstants.all10,
                    child: isSelected &&
                            bloc.idListEditSubject.value == innerList?.id
                        ? TextFormField(
                            onChanged: (value) {
                              bloc.titleListEditSubject.value = value;
                            },
                            autofocus: true,
                            initialValue: innerList?.label ?? '',
                            style: const AppTextStyle.black(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: innerList?.label ?? '',
                            ),
                            maxLines: 1,
                          )
                        : Text(
                            innerList?.label ?? '',
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () => bloc.showBottomSheetListDetail(
              context: context,
              listFragment: innerList,
            ),
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
          streams: [bloc.indexAddCardSubject],
          builder: (context) {
            final indexCard = bloc.indexAddCardSubject.value;
            final isAddCard =
                bloc.appBarEnumSubject.value == BoardDetailAppBarEnum.addCard;
            final isShowAddCard =
                indexCard == null ? true : isAddCard && indexCard != outerIndex;
            return AnimatedSwitcher(
              key: const ValueKey('add_card'),
              duration: const Duration(milliseconds: 500),
              child: isShowAddCard
                  ? Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            bloc.onTapOpenAddCard(outerIndex);
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
                          Icons.image_outlined,
                          color: Colors.black54,
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
        (index) => dragDropItem(
          item: innerList?.cards?[index],
          bloc: bloc,
          listFragment: innerList,
          context: context,
        ),
      ),
      lastTarget: SizedBoxConstants.h8,
    );
  }

  DragAndDropItem dragDropItem({
    required BuildContext context,
    required Fragment$CardFragment? item,
    required Fragment$ListFragment? listFragment,
    required BoardDetailBloc bloc,
  }) {
    return DragAndDropItem(
      child: Listener(
        onPointerDown: (event) {
          bloc.changeDraggingCard(
            value: true,
            context: context,
            idCard: item?.id,
            idList: listFragment?.id,
          );
        },
        onPointerUp: (event) {
          bloc.changeDraggingCard(
            value: false,
            context: context,
            idCard: item?.id,
            idList: listFragment?.id,
          );
        },
        child: InkWell(
          onTap: () {
            bloc.onNextToDetailCard(item?.id);
          },
          child: Card(
            key: ObjectKey({'idCard': item?.id, 'idList': listFragment?.id}),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsetsConstants.horizontal10 +
                  EdgeInsetsConstants.vertical16,
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
        ),
      ),
    );
  }
}
