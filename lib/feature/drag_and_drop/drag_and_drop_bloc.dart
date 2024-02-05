import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/get_lists.graphql.dart';

class DragAndDropBloc extends BlocBase {
  final Ref ref;
  final String idBoard;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final boardBloc = ref.read(BlocProvider.board);

  final isAddListSubject = BehaviorSubject<bool>.seeded(false);
  final isAddCardSubject = BehaviorSubject<bool>.seeded(false);
  final indexAddCardSubject = BehaviorSubject<int?>.seeded(null);
  final listFragmentsSubject =
      BehaviorSubject<List<Fragment$ListFragment?>>.seeded([]);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  final isZoomSubject = BehaviorSubject<bool>.seeded(false);

  final listController = TextEditingController();
  final cardController = TextEditingController();

  Future<void> fetchListFragmentByIdBoard() async {
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$getList(
      Options$Mutation$getList(
        variables: Variables$Mutation$getList(
          idBoard: idBoard,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException || result.parsedData == null) return;
    listFragmentsSubject.value = result.parsedData?.getLists ?? [];
  }

  void init() {
    fetchListFragmentByIdBoard();
    // listFragmentsSubject.value.addAll(
    //   [
    //     InnerList(
    //       id: 1,
    //       name: 'Khoan',
    //       task: ['test', 'test 2', 'test 3', 'test 4'],
    //     ),
    //     InnerList(
    //       id: 2,
    //       name: 'Thành Kc',
    //       task: ['test', 'test 2', 'test 3', 'test 4'],
    //     ),
    //     InnerList(id: 3, name: 'Khang', task: []),
    //     InnerList(id: 4, name: 'Lành', task: ['login']),
    //   ],
    // );
  }

  void onTapAddList() {
    listController.text = '';
    isAddListSubject.value = true;
    isAddCardSubject.value = false;
    indexAddCardSubject.value = null;
  }

  void onTapAddCard(int index) {
    cardController.text = '';
    indexAddCardSubject.value = index;
    isAddCardSubject.value = true;
    isAddListSubject.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    isAddListSubject.close();
    isAddCardSubject.close();
    listFragmentsSubject.close();
    listController.dispose();
    cardController.dispose();
    isLoadingSubject.close();
    indexAddCardSubject.close();
    isZoomSubject.close();
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  void closeAdd() {
    isAddListSubject.value = false;
    isAddCardSubject.value = false;
    indexAddCardSubject.value = null;
  }

  void add() {
    if (listController.text == '' && cardController.text == '') return;
    if (isAddListSubject.value) {
      listFragmentsSubject.value.add(
        Fragment$ListFragment(
          id: 'id',
          label: listController.text,
          cards: [],
          createdAt: '',
          createdBy: Fragment$UserFragment(uid: 'uid'),
        ),
      );
      isAddListSubject.value = false;
      listController.clear();
      return;
    }

    final indexAddCard = indexAddCardSubject.value;
    if (indexAddCard == null) return;
    listFragmentsSubject.value[indexAddCard]?.cards?.add(
      Fragment$CardFragment(
        id: '',
        startedDate: '',
        title: cardController.text,
        createdAt: '',
        createdBy: Fragment$UserFragment(uid: ''),
      ),
    );
    indexAddCardSubject.value = null;
    isAddCardSubject.value = false;
    cardController.clear();
  }

  // void checkAddCard(InnerList innerList) {
  //   // isAddCardSubject.value = true;
  //   // innerList.isAddCard = true;
  //   // for (final e in listInnerSubject.value) {
  //   //   if (e != innerList) {
  //   //     e.isAddCard = false;
  //   //   }
  //   // }
  // }

  void onItemReorder(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    final lisTemp = listFragmentsSubject.value;
    final movedItem = lisTemp[oldListIndex]?.cards?.removeAt(oldItemIndex);
    lisTemp[newListIndex]?.cards?.insert(newItemIndex, movedItem!);
    listFragmentsSubject.value = lisTemp;
  }

  void onListReorder(int oldListIndex, int newListIndex) {
    final lisTemp = listFragmentsSubject.value;
    final movedList = lisTemp.removeAt(oldListIndex);
    lisTemp.insert(newListIndex, movedList);
    listFragmentsSubject.value = lisTemp;
  }

  late final appBloc = ref.read(BlocProvider.app);

  DragAndDropBloc(this.ref, {required this.idBoard}) {
    init();
  }

  void onTapZoom() {
    final check = isZoomSubject.value;
    isZoomSubject.value = !check;
  }
}
