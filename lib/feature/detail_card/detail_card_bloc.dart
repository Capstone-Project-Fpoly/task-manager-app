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
import 'package:task_manager/graphql/Fragment/label_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/get_card.graphql.dart';
import 'package:task_manager/graphql/Mutations/comment/create_comment.graphql.dart';
import 'package:task_manager/graphql/Mutations/comment/delete_comment.graphql.dart';
import 'package:task_manager/graphql/Mutations/label/get_labels_of_board.graphql.dart';
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
    listCommentFragmentsSubject.value =
        [...card?.comments ?? []].reversed.toList();
    listCheckListSubject.value = [...card?.checkLists ?? []];
    usersSubject.value = [...card?.users ?? []];
    listLabelOfCardSubject.value = [...card?.labels ?? []];
    addTitleStartDateTime();
    addTitleEndDateTime();

    titleController.text = card?.title ?? '';
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
    final listInputCheckList = getListInputCheckListToUpdateCard();
    final users = getListIdUserToUpdateCard();
    final labels = getListIdLabelToUpdateCard();
    if (listInputCheckList != null || users != null || labels != null) {
      updateCard(checkLists: listInputCheckList, users: users, labels: labels);
    }
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

  Future<void> sendComment() async {
    if (!isChatCommentSubject.value) {
      return;
    }
    isLoadingAddCommentSubject.value = true;
    final resultCreateComment =
        await graphqlService.client.mutate$CreateComment(
      Options$Mutation$CreateComment(
        variables: Variables$Mutation$CreateComment(
          idCard: cardSubject.value!.id,
          content: commentController.text,
        ),
      ),
    );
    if (resultCreateComment.hasException) {
      final message =
          resultCreateComment.exception?.graphqlErrors.first.message;
      toastService.showText(message: message);
      routerService.pop();
      return;
    }
    if (resultCreateComment.parsedData?.createComment != null) {
      listCommentFragmentsSubject.value = [
        ...listCommentFragmentsSubject.value,
        resultCreateComment.parsedData!.createComment!,
      ].reversed.toList();
    } else {
      toastService.showText(message: 'Thêm thất bại');
    }
    commentController.clear();
    isLoadingAddCommentSubject.value = false;
    scrollToListComment();
  }

  Future<void> deleteComment(String idComment) async {
    await graphqlService.client.mutate$DeleteComment(
      Options$Mutation$DeleteComment(
        variables: Variables$Mutation$DeleteComment(
          idComment: idComment,
        ),
      ),
    );
    final listTemp = [...listCommentFragmentsSubject.value];
    listTemp.removeWhere((element) => element.id == idComment);
    listCommentFragmentsSubject.value = [...listTemp].reversed.toList();
    toastService.showText(message: 'Xóa thành công');
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

  //Checklist Bloc
  void onTapChecklistField() {
    appBarEnumSubject.value = DetailCardAppBarEnum.checklist;
    focusNodeChecklist.requestFocus();
  }

  // void onTapAddColorLabel() {
  //   for (final e in listLabelDefaultSubject.value) {
  //     if (e.isSelected) {
  //       listLabelSubject.value = [...listLabelSubject.value, e];
  //     }
  //   }
  //   routerService.pop();
  // }

  late final appBloc = ref.read(BlocProvider.app);

  DetailCardBloc(this.ref, {required this.idCard, required this.idBoard}) {
    fetchCard();
  }

  Future<void> fetchCard() async {
    isLoadingSubject.value = true;
    final (resultGetCard, resultGetUser, resultLabelOfBoard) = await (
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
      graphqlService.client.mutate$GetLabelsOfBoard(
        Options$Mutation$GetLabelsOfBoard(
          variables: Variables$Mutation$GetLabelsOfBoard(
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

    if (!resultLabelOfBoard.hasException) {
      final labels = resultLabelOfBoard.parsedData?.getLabelsOfBoard ?? [];
      listLabelOfBoardSubject.value = labels;
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
