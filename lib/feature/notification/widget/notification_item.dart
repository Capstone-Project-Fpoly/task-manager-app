import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/utilities/datetime.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:task_manager/shared/widgets/drawer/widget/mark_down_bold.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class NotificationItem extends ConsumerWidget {
  final Fragment$NotificationFragment? notification;

  const NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(notification?.toJson());
    final isSeen = notification?.is_seen ?? false;
    final bloc = ref.read(BlocProvider.notificationBloc);
    return InkWell(
      onTap: () => bloc.onTapNotificationItem(
        idNotification: notification?.id,
        isSeen: isSeen,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 3,
              color: isSeen ? Colors.white : Colors.redAccent,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsetsConstants.vertical16,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 11,
                    ),
                    AppCircleAvatar(
                      url: notification?.creator?.avatar ?? '',
                      width: 46,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsetsConstants.left8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            MarkDownBold(text: notification?.content ?? ''),
                            SizedBoxConstants.h8,
                            Text(
                              formatDateTimeNotification(
                                notification?.createdAt ??
                                    DateTime.now().toIso8601String(),
                              ),
                              style: const AppTextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (notification?.topic == Enum$TopicNotification.InviteUserToBoard)
              GestureDetector(
                onTap: () {
                  bloc.onTapAcceptInviteToBoard(
                    idNotification: notification?.id,
                    idBoard: notification?.data,
                  );
                },
                child: const Icon(
                  Icons.done_all,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            SizedBoxConstants.w24,
          ],
        ),
      ),
    );
  }
}
