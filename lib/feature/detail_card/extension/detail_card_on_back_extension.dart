import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/schema.graphql.dart';

extension DetailCardOnBackExtension on DetailCardBloc {
  List<Input$CheckListInput>? getListInputCheckListToUpdateCard() {
    listCheckListSubject.value
        .removeWhere((element) => element.content.isEmpty);
    if (listCheckListSubject.value.length !=
        cardSubject.value?.checkLists?.length) {
      return listCheckListSubject.value
          .map(
            (e) => Input$CheckListInput(
              content: e.content,
              isChecked: e.isChecked,
            ),
          )
          .toList();
    }

    for (int i = 0; i < listCheckListSubject.value.length; i++) {
      if (listCheckListSubject.value[i].content !=
              cardSubject.value?.checkLists?[i].content ||
          listCheckListSubject.value[i].isChecked !=
              cardSubject.value?.checkLists?[i].isChecked) {
        return listCheckListSubject.value
            .map(
              (e) => Input$CheckListInput(
                content: e.content,
                isChecked: e.isChecked,
              ),
            )
            .toList();
      }
    }
    return null;
  }

  List<String>? getListIdUserToUpdateCard() {
    usersSubject.value.removeWhere((element) => element == null);
    if (usersSubject.value.length != cardSubject.value?.users?.length) {
      return usersSubject.value.map((e) => e!.uid).toList();
    }
    for (int i = 0; i < usersSubject.value.length; i++) {
      if (usersSubject.value[i]?.uid != cardSubject.value?.users?[i].uid) {
        return usersSubject.value.map((e) => e!.uid).toList();
      }
    }
    return null;
  }

  List<String>? getListIdLabelToUpdateCard() {
    // so sánh id của label trong card và label đã chọn để update
    listLabelOfCardSubject.value.removeWhere((element) => element == null);
    if (listLabelOfCardSubject.value.length !=
        cardSubject.value?.labels?.length) {
      return listLabelOfCardSubject.value.map((e) => e!.id).toList();
    }
    // chỉ cần 1 id khác nhau thì update
    for (int i = 0; i < listLabelOfCardSubject.value.length; i++) {
      if (listLabelOfCardSubject.value[i]?.id !=
          cardSubject.value?.labels?[i].id) {
        return listLabelOfCardSubject.value.map((e) => e!.id).toList();
      }
    }
    return null;
  }

  void onBackToBoardScreen() {
    if (appBarEnumSubject.value != null) {
      focusNodeComment.unfocus();
      focusNodeChecklist.unfocus();
      focusNodeDescription.unfocus();
      appBarEnumSubject.value = null;
      return;
    }
    routerService.pop();
  }

  void onTapBackDescription() {
    appBarEnumSubject.value = null;
    focusNodeDescription.unfocus();
    descriptionController.text = cardSubject.value?.description ?? '';
  }

  void onTapBackTitle() {
    appBarEnumSubject.value = null;
    focusNodeTitle.unfocus();
    titleController.text = cardSubject.value?.title ?? '';
  }
}
