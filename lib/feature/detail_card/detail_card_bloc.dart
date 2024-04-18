import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/feature/detail_card/enum/detail_card_app_bar_enum.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_extension.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_on_back_extension.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_end_date.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_moving_card.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_start_date.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/check_list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/comment_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/label_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/shared/utilities/datetime.dart';

class DetailCardBloc extends BlocBase {
  final String idCard;
  final String idBoard;
  final Ref ref;

  DetailCardBloc(this.ref, {required this.idCard, required this.idBoard}) {
    fetchCard();
  }
  late final appBloc = ref.read(BlocProvider.app);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final isShowQuickActionsSubject = BehaviorSubject<bool>.seeded(false);
  final isChatCommentSubject = BehaviorSubject<bool>.seeded(false);
  final isShowNotificationSubject = BehaviorSubject<bool>.seeded(false);
  final isShowErrorStartDateSubject = BehaviorSubject<bool>.seeded(false);
  final isShowErrorEndDateSubject = BehaviorSubject<bool>.seeded(false);

  final listLabelOfCardSubject =
      BehaviorSubject<List<Fragment$LabelFragment?>>.seeded([]);
  final listLabelOfBoardSubject =
      BehaviorSubject<List<Fragment$LabelFragment?>>.seeded([]);

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
  final titleController = TextEditingController();
  final scrollDetailCardController = ScrollController();
  final labelController = TextEditingController();

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

  final focusNodeTitle = FocusNode();

  final isShowChecklistSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingAddCommentSubject = BehaviorSubject<bool>.seeded(false);

  final keyListComment = GlobalKey();
  List<String> listColorDefault = [
    '000000',
    'FF0000',
    '0000FF',
    '00FF00',
    'FFA500',
    '800080',
    '003333',
    'FFC0CB',
    'FFFF00',
    '4682B4',
    'A52A2A',
    '808080',
    '00FFFF',
    'FFB6C1',
    '008000',
    'EE82EE',
    'D2B48C',
    'B87333',
    'FF8C00',
    '008080',
  ];
  final listLabelDefaultSubject =
      BehaviorSubject<List<Fragment$LabelFragment>>.seeded([]);
  final labelSelectedAddSubject =
      BehaviorSubject<Fragment$LabelFragment?>.seeded(null);
  final labelSelectedEditSubject =
      BehaviorSubject<Fragment$LabelFragment?>.seeded(null);

  @override
  void dispose() {
    final listInputCheckList = getListInputCheckListToUpdateCard();
    final users = getListIdUserToUpdateCard();
    final labels = getListIdLabelToUpdateCard();
    if (listInputCheckList != null || users != null || labels != null) {
      updateCard(checkLists: listInputCheckList, users: users, labels: labels);
    }
    super.dispose();
    isShowQuickActionsSubject.close();
    descriptionController.dispose();
    commentController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    listLabelOfCardSubject.close();
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
    listLabelOfBoardSubject.close();
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

    isLoadingAddCommentSubject.close();
    scrollDetailCardController.dispose();
    listLabelDefaultSubject.close();
    labelController.dispose();
    labelSelectedAddSubject.close();
    labelSelectedEditSubject.close();
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
    if (startDateController.text.isNotEmpty &&
        startTimeController.text.isNotEmpty) {
      startDateTimeController.text =
          'Bắt đầu từ ${startTimeController.text} ngày ${startDateController.text}';
    }
    if (endDateController.text.isNotEmpty &&
        endTimeController.text.isNotEmpty) {
      endDateTimeController.text =
          'Kết thúc vào ${endTimeController.text} ngày ${endDateController.text}';
    }
  }

  void init() {
    final card = cardSubject.value;
    setDateTime();

    final listLabelDefault = listColorDefault
        .map(
          (e) => Fragment$LabelFragment(
            id: DateTime.now().toString(),
            title: '',
            color: e,
          ),
        )
        .toList();
    listLabelDefaultSubject.value = listLabelDefault;

    descriptionController.text = card?.description ?? '';
    final comments = [...?card?.comments];
    listCommentFragmentsSubject.value = comments.reversed.toList();
    listCheckListSubject.value = [...card?.checkLists ?? []];
    usersSubject.value = [...card?.users ?? []];
    listLabelOfCardSubject.value = [...card?.labels ?? []];
    addTitleStartDateTime();
    addTitleEndDateTime();

    titleController.text = card?.title ?? '';
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

  // DateTime Widget Bloc
  void completeSelectStartDate() {
    if (addTitleStartDateTime() == false) return;
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

  bool addTitleStartDateTime() {
    if (startTimeController.text.isNotEmpty &&
        startDateController.text.isNotEmpty) {
      startDateTimeController.text =
          'Bắt đầu từ ${startTimeController.text} ngày ${startDateController.text}';
    } else {
      startDateTimeController.text =
          '${startTimeController.text}${startDateController.text}';
    }
    return true;
  }

  bool addTitleEndDateTime() {
    if (endTimeController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      endDateTimeController.text =
          'Kết thúc vào ${endTimeController.text} ngày ${endDateController.text}';
    } else {
      endDateTimeController.text =
          '${endTimeController.text}${endDateController.text}';
    }
    return true;
  }

  void completeSelectEndDate() {
    if (addTitleEndDateTime() == false) return;
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

  void scrollToListComment() {
    Scrollable.ensureVisible(
      keyListComment.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void showNotification(bool value) {
    isShowNotificationSubject.value = !isShowNotificationSubject.value;
  }
}
