import 'package:flutter/material.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/enum/detail_card_app_bar_enum.dart';
import 'package:task_manager/graphql/Fragment/check_list_fragment.graphql.dart';

extension DetailCardCheckListExtension on DetailCardBloc {
  void onBackCheckListItem() {
    FocusManager.instance.primaryFocus?.unfocus();
    appBarEnumSubject.value = null;
  }

  void onChangeShowCheckList() {
    isShowChecklistSubject.value = !isShowChecklistSubject.value;
  }

  void onTapCheckListItem() {
    appBarEnumSubject.value = DetailCardAppBarEnum.checklistItem;
  }

  void onTapAddCheckList() {
    isShowChecklistSubject.value = true;
    final content = checklistController.text;
    if (content.isEmpty) {
      checklistController.clear();
      appBarEnumSubject.value = null;
      focusNodeChecklist.unfocus();
      return;
    }
    final randomId = DateTime.now().millisecondsSinceEpoch.toString();
    final newCheckList = Fragment$CheckListFragment(
      id: randomId,
      content: content,
      isChecked: false,
    );
    final newCheckListItems = [...listCheckListSubject.value, newCheckList];
    listCheckListSubject.value = newCheckListItems;
    checklistController.clear();
  }

  void onCheckListCheckBox(Fragment$CheckListFragment item) {
    final index = listCheckListSubject.value
        .indexWhere((element) => element.id == item.id);
    final checkList = listCheckListSubject.value[index];
    final newCheckList = Fragment$CheckListFragment(
      id: checkList.id,
      content: checkList.content,
      isChecked: !checkList.isChecked,
    );
    final newCheckListItems = [...listCheckListSubject.value];
    newCheckListItems[index] = newCheckList;
    listCheckListSubject.value = newCheckListItems;
  }

  void onCheckListDeleted(Fragment$CheckListFragment item) {
    final newCheckListItems = [...listCheckListSubject.value];
    newCheckListItems.removeWhere((element) => element.id == item.id);
    listCheckListSubject.value = [...newCheckListItems];
    for (final checkList in newCheckListItems) {
      print(checkList.toJson());
    }
    for (final checkList in listCheckListSubject.value) {
      print(checkList.toJson());
    }
  }

  void onCheckListChanged(Fragment$CheckListFragment item, String text) {
    isShowChecklistSubject.value = true;
    final index = listCheckListSubject.value
        .indexWhere((element) => element.id == item.id);
    final checkList = listCheckListSubject.value[index];
    final newCheckList = Fragment$CheckListFragment(
      id: checkList.id,
      content: text,
      isChecked: checkList.isChecked,
    );
    final newCheckListItems = [...listCheckListSubject.value];
    newCheckListItems[index] = newCheckList;
    listCheckListSubject.value = newCheckListItems;
  }
}
