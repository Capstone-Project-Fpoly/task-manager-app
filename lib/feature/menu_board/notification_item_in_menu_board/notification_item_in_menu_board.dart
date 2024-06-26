import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/shared/extensions/enum/type_notification_extension.dart';
import 'package:task_manager/shared/utilities/datetime.dart';
import 'package:task_manager/shared/widgets/drawer/widget/mark_down_bold.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class NotificationItemInMenuBoard extends ConsumerWidget {
  final Fragment$NotificationFragment? notification;
  const NotificationItemInMenuBoard({required this.notification});

  @override
  Widget build(BuildContext context, ref) {
    // print(notification?.toJson());
    return InkWell(
      onTap: () {},
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsetsConstants.vertical16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      alignment: Alignment.center,
                      child: notification?.topic.getIcon,
                    ),
                    SizedBoxConstants.w4,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          MarkDownBold(text: notification?.content ?? ''),
                          SizedBoxConstants.h2,
                          Text(
                            formatDateTimeNotification(
                              notification?.createdAt ??
                                  DateTime.now().toIso8601String(),
                            ),
                            style: const AppTextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBoxConstants.w24,
          ],
        ),
      ),
    );
  }
}
