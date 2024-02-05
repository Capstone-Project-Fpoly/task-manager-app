import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';

class DragAndDropBloc extends BlocBase {
  final Ref ref;
  final String? idBoard;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  final isAddListSubject = BehaviorSubject<bool>.seeded(false);
  final isAddCardSubject = BehaviorSubject<bool>.seeded(false);
  final listInnerSubject = BehaviorSubject<List<InnerList>>.seeded([]);
  final listController = TextEditingController();
  final cardController = TextEditingController();

  void init() {
    listInnerSubject.value.addAll(
      [
        InnerList(
          id: 1,
          name: 'Khoan',
          task: ['test', 'test 2', 'test 3', 'test 4'],
        ),
        InnerList(
          id: 2,
          name: 'Thành Kc',
          task: ['test', 'test 2', 'test 3', 'test 4'],
        ),
        InnerList(id: 3, name: 'Khang', task: []),
        InnerList(id: 4, name: 'Lành', task: ['login']),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    isAddListSubject.close();
    isAddCardSubject.close();
    listInnerSubject.close();
    listController.dispose();
    cardController.dispose();
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  void closeAdd() {
    isAddListSubject.value = false;
    isAddCardSubject.value = false;
    for (var i = 0; i < listInnerSubject.value.length; i++) {
      listInnerSubject.value[i].isAddCard = false;
    }
  }

  void add() {
    if (listController.text == '' && cardController.text == '') return;
    if (!isAddListSubject.value) return;
    listInnerSubject.value.add(InnerList(name: listController.text, task: []));
    isAddListSubject.value = false;
    listController.clear();

    if (!isAddCardSubject.value) return;
    for (var i = 0; i < listInnerSubject.value.length; i++) {
      if (listInnerSubject.value[i].isAddCard == true) {
        listInnerSubject.value[i].task.add(cardController.text);
        listInnerSubject.value[i].isAddCard = false;
      }
    }
    isAddCardSubject.value = false;
    cardController.clear();
  }

  void checkAddCard(InnerList innerList) {
    isAddCardSubject.value = true;
    innerList.isAddCard = true;
    for (final e in listInnerSubject.value) {
      if (e != innerList) {
        e.isAddCard = false;
      }
    }
  }

  void onItemReorder(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    final movedItem =
        listInnerSubject.value[oldListIndex].task.removeAt(oldItemIndex);
    listInnerSubject.value[newListIndex].task.insert(newItemIndex, movedItem);
  }

  void onListReorder(int oldListIndex, int newListIndex) {
    final movedList = listInnerSubject.value.removeAt(oldListIndex);
    listInnerSubject.value.insert(newListIndex, movedList);
  }

  late final appBloc = ref.read(BlocProvider.app);

  DragAndDropBloc(this.ref, {this.idBoard}) {
    init();
  }
}

class InnerList {
  int? id;
  final String name;
  List<String> task;
  bool isAddCard;

  InnerList({
    this.id,
    required this.name,
    required this.task,
    this.isAddCard = false,
  });
}
