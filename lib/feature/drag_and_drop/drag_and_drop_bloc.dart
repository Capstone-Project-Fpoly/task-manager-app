import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/feature/drag_and_drop/drag_and_drop_card_extention.dart';
import 'package:task_manager/feature/drag_and_drop/drag_and_drop_list_extention.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/get_lists.graphql.dart';

class DragAndDropBloc extends BlocBase {
  final Ref ref;
  final String idBoard;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final boardBloc = ref.read(BlocProvider.board);
  late final localStorage = ref.read(AppService.localStorage);

  final isAddListSubject = BehaviorSubject<bool>.seeded(false);
  final isAddCardSubject = BehaviorSubject<bool>.seeded(false);
  final indexAddCardSubject = BehaviorSubject<int?>.seeded(null);
  final listFragmentsSubject =
      BehaviorSubject<List<Fragment$ListFragment?>>.seeded([]);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingAddSubject = BehaviorSubject<bool>.seeded(false);

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
    isLoadingAddSubject.close();
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
      addList();
      return;
    }
    addCard();
  }

  Future<void> addList() async {
    final result = await fetchCreateList(label: listController.text);
    if (result == null) {
      toastService.showText(message: 'Lỗi không thể tạo list');
    }
    listFragmentsSubject.value.add(result);
    isAddListSubject.value = false;
    listController.clear();
  }

  Future<void> addCard() async {
    final indexAddCard = indexAddCardSubject.value;
    if (indexAddCard == null) return;
    final idList = listFragmentsSubject.value[indexAddCard]?.id;
    if (idList == null) return;
    final result = await fetchCreateCard(
      idList: idList,
      title: cardController.text,
    );
    if (result == null) {
      toastService.showText(message: 'Lỗi không thể tạo card');
    }
    listFragmentsSubject.value[indexAddCard]?.cards?.add(result!);
    indexAddCardSubject.value = null;
    isAddCardSubject.value = false;
    cardController.clear();
  }

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
