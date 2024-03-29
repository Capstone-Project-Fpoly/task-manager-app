import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/utilities/datetime.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:task_manager/shared/widgets/drawer/widget/mark_down_bold.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';
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
                      child: Wrap(
                        children: [
                          if (notification?.topic ==
                              Enum$TopicNotification.InviteUserToBoard)
                            const Icon(Icons.person_add_alt_sharp),
                          if (notification?.topic ==
                              Enum$TopicNotification.Card)
                            const TrelloIcon(
                              width: 20,
                              color: Colors.black,
                            ),
                          if (notification?.topic ==
                              Enum$TopicNotification.Comment)
                            AppCircleAvatar(
                              url: notification?.creator?.avatar ?? '',
                              width: 30,
                            ),
                          if (notification?.topic ==
                              Enum$TopicNotification.$List)
                            const Icon(
                              CupertinoIcons.layers_alt,
                              color: Colors.black,
                            ),
                        ],
                      ),
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
