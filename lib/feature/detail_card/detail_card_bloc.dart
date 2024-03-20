import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/toast/toast_service.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_end_date.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_moving_card.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_start_date.dart';
import 'package:task_manager/graphql/Fragment/comment_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

class DetailCardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final isShowQuickActionsSubject = BehaviorSubject<bool>.seeded(false);
  final isShowLabelSubject = BehaviorSubject<bool>.seeded(false);
  final isShowOptionAllSubject = BehaviorSubject<bool>.seeded(false);
  final isShowFloatingSubject = BehaviorSubject<bool>.seeded(true);
  final isSendCommentSubject = BehaviorSubject<bool>.seeded(false);
  final isShowNotificationSubject = BehaviorSubject<bool>.seeded(false);
  final isShowErrorStartDateSubject = BehaviorSubject<bool>.seeded(false);
  final isShowErrorEndDateSubject = BehaviorSubject<bool>.seeded(false);
  final isShowTitleCommentSubject = BehaviorSubject<bool>.seeded(false);
  final isShowChecklistSubject = BehaviorSubject<bool>.seeded(false);
  final isShowTitleChecklistSubject = BehaviorSubject<bool>.seeded(false);
  final isShowTitleDescriptionSubject = BehaviorSubject<bool>.seeded(false);

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

  final focusNode = FocusNode();
  final focusNodeComment = FocusNode();
  final focusNodeChecklist = FocusNode();
  @override
  void dispose() {
    super.dispose();
    isShowQuickActionsSubject.close();
    descriptionController.dispose();
    commentController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    isShowLabelSubject.close();
    isShowOptionAllSubject.close();
    listColorSubject.close();
    isShowFloatingSubject.close();
    listNotificationFragmentsSubject.close();
    listCommentFragmentsSubject.close();
    startDateTimeController.dispose();
    endDateTimeController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    isSendCommentSubject.close();
    isShowNotificationSubject.close();
    isShowErrorEndDateSubject.close();
    isShowErrorStartDateSubject.close();
    isShowTitleCommentSubject.close();
    isShowChecklistSubject.close();
    isShowTitleChecklistSubject.close();
    isShowTitleDescriptionSubject.close();
    listColorDefaultSubject.close();
    checklistController.dispose();
  }

  void init() {
    startDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    endDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    startTimeController.text = DateFormat('HH:mm').format(DateTime.now());
    endTimeController.text = DateFormat('HH:mm').format(DateTime.now());

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

    listNotificationFragmentsSubject.add([
      Fragment$NotificationFragment(
        id: '1',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 1',
        topic: Enum$TopicNotification.Card,
        createdAt: '2024-03-09',
        creator: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '2',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 2',
        topic: Enum$TopicNotification.Card,
        createdAt: '2024-03-09',
        creator: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '3',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 3',
        topic: Enum$TopicNotification.Card,
        createdAt: '2024-03-09',
        creator: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '4',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 4',
        topic: Enum$TopicNotification.Card,
        createdAt: '2024-03-09',
        creator: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '5',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 5',
        topic: Enum$TopicNotification.Card,
        createdAt: '2024-03-09',
        creator: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '6',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 6',
        topic: Enum$TopicNotification.Card,
        createdAt: '2024-03-09',
        creator: Fragment$UserFragment(uid: '0'),
      ),
    ]);

    listCommentFragmentsSubject.add([
      Fragment$CommentFragment(
        id: '1',
        createdAt: '2024-03-09',
        user: Fragment$UserFragment(uid: '1', fullName: 'Đinh Viết Khang'),
        comment: 'Bình luận 1',
      ),
      Fragment$CommentFragment(
        id: '2',
        createdAt: '2024-03-09',
        user: Fragment$UserFragment(uid: '1', fullName: 'Đinh Viết Khang'),
        comment: 'Bình luận 2',
      ),
      // Fragment$CommentFragment(id:'3', createdAt: '', user: Fragment$UserFragment(uid: '1'), comment: 'Bình luận 3'),
      // Fragment$CommentFragment(id:'4', createdAt: '', user: Fragment$UserFragment(uid: '1'), comment: 'Bình luận 4'),
      // Fragment$CommentFragment(id:'5', createdAt: '', user: Fragment$UserFragment(uid: '1'), comment: 'Bình luận 5'),
    ]);
  }

  void onBackToBoardScreen() {
    if (!isShowFloatingSubject.value) {
      focusNode.unfocus();
      focusNodeChecklist.unfocus();

      isShowFloatingSubject.value = true;
      isShowTitleCommentSubject.value = false;
      isShowTitleDescriptionSubject.value = false;
      isShowTitleChecklistSubject.value = false;
      return;
    }
    if (focusNode.hasFocus) {
      focusNode.unfocus();
      return;
    }
    if (focusNodeComment.hasFocus) {
      focusNodeComment.unfocus();
      isShowTitleCommentSubject.value = false;
      return;
    }
    if (isShowLabelSubject.value == true) {
      isShowLabelSubject.value = false;
      return;
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
    isShowLabelSubject.value = !isShowLabelSubject.value;
  }

  void chooseOption({required int idOption, required BuildContext context}) {
    switch (idOption) {
      case 0:
        print('xem');
        break;
      case 1:
        movingCard(context);
        break;
      case 2:
        print('sao chép');
        break;
      case 3:
        print('lưu');
        break;
      case 4:
        print('xóa');
        break;
      default:
        return;
    }
  }

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
    isShowFloatingSubject.value = false;
    isShowTitleDescriptionSubject.value = !isShowTitleDescriptionSubject.value;
  }

  //Quick Action Bloc

  void onTapShowChecklist() {
    isShowChecklistSubject.value = !isShowChecklistSubject.value;
    isShowTitleChecklistSubject.value = !isShowTitleChecklistSubject.value;
    isShowFloatingSubject.value = !isShowFloatingSubject.value;
    if (focusNodeChecklist.hasFocus) {
      focusNodeChecklist.unfocus();
    } else {
      focusNodeChecklist.requestFocus();
    }
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
    routerService.pop();
  }

  void cancelSelectStartDate() {
    routerService.pop();
    startDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    startTimeController.text = DateFormat('HH:mm').format(DateTime.now());
  }

  void completeSelectEndDate() {
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
    routerService.pop();
  }

  void cancelSelectEndDate() {
    routerService.pop();
    // endDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    // endTimeController.text = DateFormat('HH:mm').format(DateTime.now());
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
      isSendCommentSubject.value = false;
    } else {
      isSendCommentSubject.value = true;
    }
  }

  void onTapCommentField() {
    isShowTitleCommentSubject.value = true;
  }

  void sendComment() {
    if (!isSendCommentSubject.value) {
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
    isShowTitleDescriptionSubject.value = false;
    isShowTitleChecklistSubject.value = true;
    isShowFloatingSubject.value = false;
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
  DetailCardBloc(this.ref) {
    init();
  }
}

class ColorLabel {
  int? id;
  String? color;
  bool isSelected;

  ColorLabel({this.id, this.color, this.isSelected = false});
}
