import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/toast/toast_service.dart';
import 'package:task_manager/feature/detail_card/enum/detail_card_app_bar_enum.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_extension.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_end_date.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_moving_card.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_start_date.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/check_list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/comment_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/get_card.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/utilities/datetime.dart';

class DetailCardBloc extends BlocBase {
  final String idCard;
  final String idBoard;
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final isShowQuickActionsSubject = BehaviorSubject<bool>.seeded(false);
  final isChatCommentSubject = BehaviorSubject<bool>.seeded(false);
  final isShowNotificationSubject = BehaviorSubject<bool>.seeded(false);
  final isShowErrorStartDateSubject = BehaviorSubject<bool>.seeded(false);
  final isShowErrorEndDateSubject = BehaviorSubject<bool>.seeded(false);

  final listColorSubject = BehaviorSubject<List<ColorLabel>>.seeded([]);
  final listColorDefaultSubject = BehaviorSubject<List<ColorLabel>>.seeded([]);
  final listNotificationFragmentsSubject =
      BehaviorSubject<List<Fragment$NotificationFragment>>.seeded([]);
  final listCommentFragmentsSubject =
      BehaviorSubject<List<Fragment$CommentFragment>>.seeded([]);

  final descriptionController = TextEditingController();
  final commentController = TextEditingController();
  final startDateTimeController = TextEditingController();
  final endDateTimeController = TextEditingController();
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();
  final checklistController = TextEditingController();

  final focusNodeDescription = FocusNode();
  final focusNodeComment = FocusNode();
  final focusNodeChecklist = FocusNode();

  final appBarEnumSubject = BehaviorSubject<DetailCardAppBarEnum?>.seeded(null);

  final cardSubject = BehaviorSubject<Fragment$CardFragment?>.seeded(null);

  final startDateSubject = BehaviorSubject<DateTime?>.seeded(null);
  final startTimeSubject = BehaviorSubject<TimeOfDay?>.seeded(null);

  final endDateSubject = BehaviorSubject<DateTime?>.seeded(null);
  final endTimeSubject = BehaviorSubject<TimeOfDay?>.seeded(null);

  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final usersSubject = BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);
  final usersOfBoard = BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);

  final listCheckListSubject =
      BehaviorSubject<List<Fragment$CheckListFragment>>.seeded([]);

  final isLoadingUpdateSubject = BehaviorSubject<bool>.seeded(false);

  final titleController = TextEditingController();

  final focusNodeTitle = FocusNode();

  final isShowChecklistSubject = BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    super.dispose();
    isShowQuickActionsSubject.close();
    descriptionController.dispose();
    commentController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    listColorSubject.close();
    listNotificationFragmentsSubject.close();
    listCommentFragmentsSubject.close();
    startDateTimeController.dispose();
    endDateTimeController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    isChatCommentSubject.close();
    isShowNotificationSubject.close();
    isShowErrorEndDateSubject.close();
    isShowErrorStartDateSubject.close();
    listColorDefaultSubject.close();
    checklistController.dispose();
    appBarEnumSubject.close();
    focusNodeDescription.dispose();
    focusNodeComment.dispose();
    focusNodeChecklist.dispose();
    cardSubject.close();
    startDateSubject.close();
    endDateSubject.close();
    isLoadingSubject.close();
    usersSubject.close();
    listCheckListSubject.close();
    isLoadingUpdateSubject.close();
    startTimeSubject.close();
    endTimeSubject.close();
    titleController.dispose();
    focusNodeTitle.dispose();
    usersOfBoard.close();
    isShowChecklistSubject.close();
  }

  void setDateTime() {
    final card = cardSubject.value;
    final startDateTime = card?.startedDate != null
        ? parseDateString(card!.startedDate!, format: 'yyyy-MM-ddTHH:mm:ss.SSS')
        : null;
    final endDateTime = card?.endDate != null
        ? parseDateString(card!.endDate!, format: 'yyyy-MM-ddTHH:mm:ss.SSS')
        : null;
    startTimeSubject.value = startDateTime != null
        ? TimeOfDay(hour: startDateTime.hour, minute: startDateTime.minute)
        : null;
    startDateSubject.value = startDateTime;
    endTimeSubject.value = endDateTime != null
        ? TimeOfDay(hour: endDateTime.hour, minute: endDateTime.minute)
        : null;
    endDateSubject.value = endDateTime;
    startDateController.text = startDateTime != null
        ? DateFormat('dd/MM/yyyy').format(startDateTime)
        : '';
    endDateController.text =
        endDateTime != null ? DateFormat('dd/MM/yyyy').format(endDateTime) : '';
    startTimeController.text =
        startDateTime != null ? DateFormat('HH:mm').format(startDateTime) : '';
    endTimeController.text =
        endDateTime != null ? DateFormat('HH:mm').format(endDateTime) : '';
  }

  void init() {
    final card = cardSubject.value;
    setDateTime();

    descriptionController.text = card?.description ?? '';
    listCommentFragmentsSubject.value = [...card?.comments ?? []];
    listCheckListSubject.value = [...card?.checkLists ?? []];
    usersSubject.value = [...card?.users ?? []];
    addTitleStartDateTime();
    addTitleEndDateTime();

    titleController.text = card?.title ?? '';
    listColorSubject.add([
      ColorLabel(color: '2196F3', id: 1),
      ColorLabel(color: 'FBFADA', id: 2),
      ColorLabel(color: '436850', id: 3),
      ColorLabel(color: '6962AD', id: 4),
      ColorLabel(color: '1B1A55', id: 5),
    ]);

    listColorDefaultSubject.add([
      ColorLabel(color: '2196F3', id: 1, isSelected: false),
      ColorLabel(color: 'FBFADA', id: 2, isSelected: false),
      ColorLabel(color: '436850', id: 3, isSelected: false),
      ColorLabel(color: '6962AD', id: 4, isSelected: false),
      ColorLabel(color: '1B1A55', id: 5, isSelected: false),
      ColorLabel(color: 'baf3db', id: 6, isSelected: false),
      ColorLabel(color: 'f8e6a0', id: 7, isSelected: false),
      ColorLabel(color: 'fedec8', id: 8, isSelected: false),
      ColorLabel(color: 'c9372c', id: 9, isSelected: false),
      ColorLabel(color: '227d9b', id: 10, isSelected: false),
      ColorLabel(color: '626f86', id: 11, isSelected: false),
      ColorLabel(color: '946f00', id: 12, isSelected: false),
      ColorLabel(color: 'c6edfb', id: 13, isSelected: false),
      ColorLabel(color: 'f5cd47', id: 14, isSelected: false),
      ColorLabel(color: 'fdd0ec', id: 15, isSelected: false),
    ]);
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

  List<Input$CheckListInput>? getListInputCheckList() {
    listCheckListSubject.value
        .removeWhere((element) => element.content.isEmpty);
    if (listCheckListSubject.value.isEmpty) {
      return null;
    }
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

  List<String>? getListIdUser() {
    usersSubject.value.removeWhere((element) => element == null);
    if (usersSubject.value.isEmpty) return null;
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

  void onBackToBoardScreen() {
    if (appBarEnumSubject.value != null) {
      focusNodeComment.unfocus();
      focusNodeChecklist.unfocus();
      focusNodeDescription.unfocus();
      appBarEnumSubject.value = null;
      return;
    }
    final listInputCheckList = getListInputCheckList();
    final users = getListIdUser();

    updateCard(checkLists: listInputCheckList, users: users);
    routerService.pop();
  }

  void setEndDate(String time) {
    endDateController.text = time;
  }

  void setStartTime(String time) {
    startDateController.text = time;
  }

  void showQuickAction() {
    isShowQuickActionsSubject.value = !isShowQuickActionsSubject.value;
  }

  void showLabel() {
    appBarEnumSubject.value = DetailCardAppBarEnum.label;
  }

  void chooseOption({required int idOption, required BuildContext context}) {}

  void movingCard(BuildContext context) {
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (_) => const DetailCardDialogMovingCardWidget(),
    );
  }

  void onBack() {
    routerService.pop();
  }

  void onTapDescription() {
    appBarEnumSubject.value = DetailCardAppBarEnum.description;
  }

  void onTapTitle() {
    appBarEnumSubject.value = DetailCardAppBarEnum.title;
  }

  //Quick Action Bloc

  void onTapShowChecklist() {
    focusNodeChecklist.requestFocus();
    appBarEnumSubject.value = DetailCardAppBarEnum.checklist;
  }

  //Label Widget Bloc
  void onTapToSelect(ColorLabel colorLabel) {
    final listTemp = listColorSubject.value;
    for (final e in listTemp) {
      if (e.id == colorLabel.id) {
        e.isSelected = !e.isSelected;
      }
    }
    listColorSubject.value = listTemp;
  }

  // DateTime Widget Bloc
  void completeSelectStartDate() {
    addTitleStartDateTime();
    if (startDateSubject.value != null && startTimeSubject.value != null) {
      final startDateTime = DateTime(
        startDateSubject.value!.year,
        startDateSubject.value!.month,
        startDateSubject.value!.day,
        startTimeSubject.value!.hour,
        startTimeSubject.value!.minute,
      );
      updateCard(startedDate: startDateTime.toIso8601String());
    }
    routerService.pop();
  }

  void cancelSelectDateTime() {
    routerService.pop();
    setDateTime();
  }

  void addTitleStartDateTime() {
    if (startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      final startDate = DateFormat('dd/MM/yyyy HH:mm').parse(
        '${startDateController.text} ${startTimeController.text.isEmpty ? "00:00" : startTimeController.text}',
      );
      final endDate = DateFormat('dd/MM/yyyy HH:mm').parse(
        '${endDateController.text} ${endTimeController.text.isEmpty ? "23:59" : endTimeController.text}',
      );

      if (startDate.isAfter(endDate)) {
        isShowErrorStartDateSubject.value = true;
        return;
      }
    }
    if (startTimeController.text.isNotEmpty &&
        startDateController.text.isNotEmpty) {
      startDateTimeController.text =
          'Bắt đầu từ ${startTimeController.text} ngày ${startDateController.text}';
    } else {
      startDateTimeController.text =
          '${startTimeController.text}${startDateController.text}';
    }
  }

  void addTitleEndDateTime() {
    if (startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      final startDate = DateFormat('dd/MM/yyyy HH:mm').parse(
        '${startDateController.text} ${startTimeController.text.isEmpty ? "00:00" : startTimeController.text}',
      );
      final endDate = DateFormat('dd/MM/yyyy HH:mm').parse(
        '${endDateController.text} ${endTimeController.text.isEmpty ? "23:59" : endTimeController.text}',
      );
      if (startDate.isAfter(endDate)) {
        isShowErrorEndDateSubject.value = true;
        return;
      }
    }
    if (endTimeController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      endDateTimeController.text =
          'Kết thúc vào ${endTimeController.text} ngày ${endDateController.text}';
    } else {
      endDateTimeController.text =
          '${endTimeController.text}${endDateController.text}';
    }
  }

  void completeSelectEndDate() {
    addTitleEndDateTime();
    if (endDateSubject.value != null && endTimeSubject.value != null) {
      final endDateTime = DateTime(
        endDateSubject.value!.year,
        endDateSubject.value!.month,
        endDateSubject.value!.day,
        endTimeSubject.value!.hour,
        endTimeSubject.value!.minute,
      );
      updateCard(endDate: endDateTime.toIso8601String());
    }
    routerService.pop();
  }

  void showDialogStartDate({required BuildContext context}) {
    isShowErrorStartDateSubject.value = false;
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (_) => const DetailCardDialogStartDate(),
    );
  }

  void showDialogEndDate({required BuildContext context}) {
    if (startDateTimeController.text.isEmpty) {
      ToastService().showText(message: 'Vui lòng chọn ngày bắt đầu!');
      return;
    }
    isShowErrorEndDateSubject.value = false;
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (_) => const DetailCardDialogEndDate(),
    );
  }

  //Comment Widget Bloc
  void onChangeCommentField(String value) {
    if (value.isEmpty) {
      isChatCommentSubject.value = false;
    } else {
      isChatCommentSubject.value = true;
    }
  }

  void onTapCommentField() {
    focusNodeComment.requestFocus();
    appBarEnumSubject.value = DetailCardAppBarEnum.comment;
  }

  void sendComment() {
    if (!isChatCommentSubject.value) {
      return;
    }
    final comment = Fragment$CommentFragment(
      id: '1',
      createdAt: '',
      user: Fragment$UserFragment(uid: '1', fullName: 'Đinh Viết Khang'),
      comment: commentController.text,
    );
    listCommentFragmentsSubject.value = [
      ...[comment],
      ...listCommentFragmentsSubject.value,
    ];
  }

  void showNotification(bool value) {
    isShowNotificationSubject.value = !isShowNotificationSubject.value;
  }

  //Checklist Bloc
  void onTapChecklistField() {
    appBarEnumSubject.value = DetailCardAppBarEnum.checklist;
    focusNodeChecklist.requestFocus();
  }

  //Add Label Bloc
  void onTapSelectColorAddLabel(ColorLabel color) {
    final listTemp = listColorDefaultSubject.value;
    for (final e in listTemp) {
      if (e.id == color.id) {
        e.isSelected = !e.isSelected;
      } else {
        e.isSelected = false;
      }
    }
    listColorDefaultSubject.value = listTemp;
  }

  void onTapAddColorLabel() {
    for (final e in listColorDefaultSubject.value) {
      if (e.isSelected) {
        listColorSubject.value = [...listColorSubject.value, e];
      }
    }
    routerService.pop();
  }

  late final appBloc = ref.read(BlocProvider.app);

  DetailCardBloc(this.ref, {required this.idCard, required this.idBoard}) {
    fetchCard();
  }

  Future<void> fetchCard() async {
    isLoadingSubject.value = true;
    final (resultGetCard, resultGetUser) = await (
      graphqlService.client.mutate$GetCard(
        Options$Mutation$GetCard(
          variables: Variables$Mutation$GetCard(
            idCard: idCard,
          ),
        ),
      ),
      graphqlService.client.query$GetUserOfBoard(
        Options$Query$GetUserOfBoard(
          variables: Variables$Query$GetUserOfBoard(
            idBoard: idBoard,
          ),
        ),
      ),
    ).wait;
    isLoadingSubject.value = false;
    if (resultGetCard.hasException) {
      final message = resultGetCard.exception?.graphqlErrors.first.message;
      toastService.showText(message: message);
      routerService.pop();
      return;
    }
    // get user of board
    if (!resultGetUser.hasException) {
      usersOfBoard.value = resultGetUser.parsedData?.getUsersOfBoard ?? [];
    }
    cardSubject.value = resultGetCard.parsedData?.getCard;
    init();
  }

  Future<void> onTapUpdateDescription() async {
    if (descriptionController.text == cardSubject.value?.description) {
      onTapBackDescription();
      return;
    }
    isLoadingUpdateSubject.value = true;
    final card = await updateCard(description: descriptionController.text);
    isLoadingUpdateSubject.value = false;
    appBarEnumSubject.value = null;
    focusNodeDescription.unfocus();
    if (card == null) {
      return;
    }
    cardSubject.value = card;
  }

  Future<void> onTapUpdateTitle() async {
    if (titleController.text == cardSubject.value?.title) {
      onTapBackTitle();
      return;
    }
    isLoadingUpdateSubject.value = true;
    final card = await updateCard(title: titleController.text);
    isLoadingUpdateSubject.value = false;
    appBarEnumSubject.value = null;
    focusNodeTitle.unfocus();
    if (card == null) {
      return;
    }
    cardSubject.value = card;
  }
}

class ColorLabel {
  int? id;
  String? color;
  bool isSelected;

  ColorLabel({this.id, this.color, this.isSelected = false});
}
