import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/drag_and_drop/drag_and_drop_bloc.dart';

class DragDropScreen extends ConsumerWidget {
  const DragDropScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.dragAndDrop);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    String? title;
    return ObsBuilder(
      streams: [
        bloc.isAddCardSubject,
        bloc.isAddListSubject,
        bloc.listInnerSubject,
      ],
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.lightBlue,
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
                    : title == null
                        ? const Text('Table tesst')
                        : Text(title ?? '')
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
                        child: Icon(
                          Icons.check,
                          color: bloc.listController.text.isEmpty
                              ? bloc.cardController.value.text.isEmpty
                                  ? Colors.grey
                                  : Colors.white
                              : Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
          body: DragAndDropLists(
            listGhostOpacity: 0,
            // listGhost: Container(
            //   width: 250,
            // ),
            listTarget: InkWell(
              onTap: () {
                // setState(() {
                //   _ctrlList.clear();
                //   isAddList = true;
                // });
              },
              child: AnimatedSwitcher(
                key: const ValueKey('key_animated'),
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: bloc.isAddListSubject.value == false
                    ? Container(
                        key: const ValueKey('1'),
                        alignment: Alignment.center,
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
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
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          autofocus: true,
                          style: const TextStyle(color: Colors.white),
                          controller: bloc.listController,
                          maxLines: 50,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tên danh sách',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            children: List.generate(
              bloc.listInnerSubject.value.length,
              (index) => _buildList(index, bloc, width, height, context),
            ),
            onItemReorder: bloc.onItemReorder,
            onListReorder: bloc.onListReorder,
            axis: Axis.horizontal,
            listWidth: 250,
            listDraggingWidth: 200,
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
          ),
        );
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
    final innerList = bloc.listInnerSubject.value[outerIndex];
    return DragAndDropList(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      header: Row(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
              color: Colors.black,
            ),
            padding: EdgeInsetsConstants.all10,
            child: Text(
              innerList.name,
              style: Theme.of(context).primaryTextTheme.titleMedium,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
      footer: Padding(
        padding:
            EdgeInsetsConstants.horizontal10 + EdgeInsetsConstants.vertical16,
        child: AnimatedSwitcher(
          key: const ValueKey('add_card'),
          duration: const Duration(milliseconds: 500),
          child: innerList.isAddCard == false
              ? Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        bloc.checkAddCard(innerList);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Thêm thẻ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
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
              : Container(
                  width: width,
                  height: 50,
                  padding: EdgeInsetsConstants.horizontal10,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    autofocus: true,
                    style: const TextStyle(color: Colors.white),
                    controller: bloc.cardController,
                    maxLines: 50,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tên thẻ',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
        ),
      ),
      children: List.generate(
        innerList.task.length,
        (index) => _buildItem(innerList.task[index], width, height),
      ),
      lastTarget: Container(),
    );
  }

  DragAndDropItem _buildItem(String item, double width, double height) {
    return DragAndDropItem(
      child: Padding(
        padding: EdgeInsetsConstants.all4,
        child: Container(
          padding:
              EdgeInsetsConstants.horizontal10 + EdgeInsetsConstants.vertical16,
          width: width,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xFF3A3A3A),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            item,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
