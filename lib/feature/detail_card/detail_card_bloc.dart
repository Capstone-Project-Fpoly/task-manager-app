import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
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
  final isShowAllSubject = BehaviorSubject<bool>.seeded(false);
  final isShowFloatingSubject = BehaviorSubject<bool>.seeded(true);

  final listColorSubject = BehaviorSubject<List<ColorLabel>>.seeded([]);
  final listNotificationFragmentsSubject =
      BehaviorSubject<List<Fragment$NotificationFragment>>.seeded([]);
  final listCommemtFragmentsSubject =
      BehaviorSubject<List<Fragment$CommentFragment>>.seeded([]);

  final descriptionController = TextEditingController();
  final commentController = TextEditingController();
  final startDateTimeController = TextEditingController();
  final endDateTimeController = TextEditingController();
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();

  final focusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    isShowQuickActionsSubject.close();
    descriptionController.dispose();
    commentController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    isShowLabelSubject.close();
    isShowAllSubject.close();
    listColorSubject.close();
    isShowFloatingSubject.close();
    listNotificationFragmentsSubject.close();
    listCommemtFragmentsSubject.close();
    startDateTimeController.dispose();
    endDateTimeController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
  }

  void init() {
    listColorSubject.add([
      ColorLabel(color: '2196F3'),
      ColorLabel(color: 'FBFADA'),
      ColorLabel(color: '436850'),
      ColorLabel(color: '6962AD'),
      ColorLabel(color: '1B1A55'),
    ]);

    listNotificationFragmentsSubject.add([
      Fragment$NotificationFragment(
        id: '1',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 1',
        topic: Enum$TopicNotification.Card,
        createdAt: '',
        creater: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '2',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 2',
        topic: Enum$TopicNotification.Card,
        createdAt: '',
        creater: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '3',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 3',
        topic: Enum$TopicNotification.Card,
        createdAt: '',
        creater: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '4',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 4',
        topic: Enum$TopicNotification.Card,
        createdAt: '',
        creater: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '5',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 5',
        topic: Enum$TopicNotification.Card,
        createdAt: '',
        creater: Fragment$UserFragment(uid: '0'),
      ),
      Fragment$NotificationFragment(
        id: '6',
        content: 'Nội dung thông báo',
        data: 'data',
        is_seen: false,
        title: 'Thông báo 6',
        topic: Enum$TopicNotification.Card,
        createdAt: '',
        creater: Fragment$UserFragment(uid: '0'),
      ),
    ]);

    listCommemtFragmentsSubject.add([
      Fragment$CommentFragment(
        id: '1',
        createdAt: '',
        user: Fragment$UserFragment(uid: '1'),
        comment: 'Bình luận 1',
      ),
      // Fragment$CommentFragment(id:'2', createdAt: '', user: Fragment$UserFragment(uid: '1'), comment: 'Bình luận 2'),
      // Fragment$CommentFragment(id:'3', createdAt: '', user: Fragment$UserFragment(uid: '1'), comment: 'Bình luận 3'),
      // Fragment$CommentFragment(id:'4', createdAt: '', user: Fragment$UserFragment(uid: '1'), comment: 'Bình luận 4'),
      // Fragment$CommentFragment(id:'5', createdAt: '', user: Fragment$UserFragment(uid: '1'), comment: 'Bình luận 5'),
    ]);
  }

  void onBackToBoardScreen() {
    if (!isShowFloatingSubject.value) {
      focusNode.unfocus();
      isShowFloatingSubject.value = true;
      return;
    }
    if (focusNode.hasFocus) {
      focusNode.unfocus();
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

  void changeCheckBoxAll() {
    isShowAllSubject.value = !isShowAllSubject.value;
  }

  void showLabel() {
    isShowLabelSubject.value = !isShowLabelSubject.value;
  }

  void chooseOption() {
    isShowAllSubject.value = !isShowAllSubject.value;
  }

  void onBack() {
    routerService.pop();
  }

  void onTapDescription() {
    isShowFloatingSubject.value = false;
  }

  //TODO: Label Widget Bloc
  void onTapToSelect(ColorLabel colorLabel) {
    colorLabel.isSelected = !colorLabel.isSelected;
  }

  //TODO: DateTime Widget Bloc
  void completeSelectStartDate() {
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
    startTimeController.clear();
    startDateController.clear();
  }

  void completeSelectEndDate() {
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
    endTimeController.clear();
    endDateController.clear();
  }

  late final appBloc = ref.read(BlocProvider.app);
  DetailCardBloc(this.ref) {
    init();
  }
}

class ColorLabel {
  String? color;
  bool isSelected;

  ColorLabel({this.color, this.isSelected = false});
}
