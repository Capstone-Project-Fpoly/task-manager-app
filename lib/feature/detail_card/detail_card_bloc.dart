import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/comment_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/utilities/datetime.dart';

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
    isShowOptionAllSubject.close();
    listColorSubject.close();
    isShowFloatingSubject.close();
    listNotificationFragmentsSubject.close();
    listCommemtFragmentsSubject.close();
    startDateTimeController.dispose();
    endDateTimeController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    isSendCommentSubject.close();
    isShowNotificationSubject.close();
    isShowErrorEndDateSubject.close();
    isShowErrorStartDateSubject.close();
  }

  void init() {
    listColorSubject.add([
      ColorLabel(color: '2196F3', id: 1),
      ColorLabel(color: 'FBFADA', id: 2),
      ColorLabel(color: '436850', id: 3),
      ColorLabel(color: '6962AD', id: 4),
      ColorLabel(color: '1B1A55', id: 5),
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

    listCommemtFragmentsSubject.add([
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

  void showLabel() {
    isShowLabelSubject.value = !isShowLabelSubject.value;
  }

  void chooseOption() {
    isShowOptionAllSubject.value = !isShowOptionAllSubject.value;
  }

  void onBack() {
    routerService.pop();
  }

  void onTapDescription() {
    isShowFloatingSubject.value = false;
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
    startTimeController.clear();
    startDateController.clear();
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
    endTimeController.clear();
    endDateController.clear();
  }

  void showDialogStartDate({required BuildContext context}) {
    isShowErrorStartDateSubject.value = false;
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (_) => Container(
        alignment: Alignment.center,
        child: ObsBuilder(
          streams: [isShowErrorStartDateSubject],
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: 300,
              height: 165,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ngày bắt đầu',
                    style: TextStyle(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBoxConstants.h10,
                  Row(
                    children: [
                      SizedBox(
                        width: 175,
                        child: Material(
                          color: ColorConstants.white,
                          child: InkWell(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              ).then((value) {
                                startDateController.text =
                                    formatDateTimeDetailCard(
                                  value.toString(),
                                );
                              });
                            },
                            child: TextField(
                              style: const TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontSize: 14,
                              ),
                              enabled: false,
                              controller: startDateController,
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsetsConstants.bottom4,
                                hintText: 'Chọn ngày',
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  color: ColorConstants.primaryBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBoxConstants.w10,
                      SizedBox(
                        width: 75,
                        child: Material(
                          color: ColorConstants.white,
                          child: InkWell(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.dial,
                              ).then((value) {
                                if (value != null) {
                                  startTimeController.text =
                                      '${value.hour}:${value.minute}';
                                }
                              });
                            },
                            child: TextField(
                              style: const TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontSize: 14,
                              ),
                              enabled: false,
                              controller: startTimeController,
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsetsConstants.bottom4,
                                hintText: 'Chọn giờ',
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  color: ColorConstants.primaryBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBoxConstants.h10,
                  !isShowErrorStartDateSubject.value
                      ? const SizedBox.shrink()
                      : const Text(
                          'Ngày bắt đầu không được muộn hơn ngày kết thúc',
                          style: TextStyle(
                            color: ColorConstants.red,
                            fontSize: 11,
                          ),
                        ),
                  SizedBoxConstants.h10,
                  Material(
                    color: ColorConstants.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            cancelSelectStartDate();
                          },
                          child: const Text(
                            'Hủy',
                            style: TextStyle(
                              color: ColorConstants.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBoxConstants.w15,
                        InkWell(
                          onTap: () {
                            completeSelectStartDate();
                          },
                          child: const Text(
                            'Hoàn tất',
                            style: TextStyle(
                              color: ColorConstants.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showDialogEndDate({required BuildContext context}) {
    isShowErrorEndDateSubject.value = false;
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (_) => Container(
        alignment: Alignment.center,
        child: ObsBuilder(
          streams: [isShowErrorEndDateSubject],
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: 300,
              height: 165,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ngày kết thúc',
                    style: TextStyle(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBoxConstants.h10,
                  Row(
                    children: [
                      SizedBox(
                        width: 175,
                        child: Material(
                          color: ColorConstants.white,
                          child: InkWell(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              ).then((value) {
                                endDateController.text =
                                    formatDateTimeDetailCard(
                                  value.toString(),
                                );
                              });
                            },
                            child: TextField(
                              style: const TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontSize: 14,
                              ),
                              enabled: false,
                              controller: endDateController,
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsetsConstants.bottom4,
                                hintText: 'Chọn ngày',
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  color: ColorConstants.primaryBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBoxConstants.w10,
                      SizedBox(
                        width: 75,
                        child: Material(
                          color: ColorConstants.white,
                          child: InkWell(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.dial,
                              ).then((value) {
                                if (value != null) {
                                  endTimeController.text =
                                      '${value.hour}:${value.minute}';
                                }
                              });
                            },
                            child: TextField(
                              style: const TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontSize: 14,
                              ),
                              enabled: false,
                              controller: endTimeController,
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsetsConstants.bottom4,
                                hintText: 'Chọn giờ',
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  color: ColorConstants.primaryBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBoxConstants.h10,
                  !isShowErrorEndDateSubject.value
                      ? const SizedBox.shrink()
                      : const Text(
                          'Ngày kết thúc không được sớm hơn ngày bắt đầu',
                          style: TextStyle(
                            color: ColorConstants.red,
                            fontSize: 11,
                          ),
                        ),
                  SizedBoxConstants.h10,
                  Material(
                    color: ColorConstants.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            cancelSelectEndDate();
                          },
                          child: const Text(
                            'Hủy',
                            style: TextStyle(
                              color: ColorConstants.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBoxConstants.w15,
                        InkWell(
                          onTap: () {
                            completeSelectEndDate();
                          },
                          child: const Text(
                            'Hoàn tất',
                            style: TextStyle(
                              color: ColorConstants.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
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
    listCommemtFragmentsSubject.value = [
      ...[comment],
      ...listCommemtFragmentsSubject.value,
    ];
  }

  void showNotification(bool value) {
    isShowNotificationSubject.value = !isShowNotificationSubject.value;
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
