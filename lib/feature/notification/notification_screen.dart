import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/notification/widget/notification_item.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(BlocProvider.notificationBloc);
    const textStyleWhite = AppTextStyle(
      color: ColorConstants.white,
      fontSize: 14,
    );
    const textStyleBlack = AppTextStyle(
      color: ColorConstants.primaryBlack,
      fontSize: 14,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: ColorConstants.white,
          onPressed: () {
            bloc.onBackToBoardScreen();
          },
        ),
        title: const Text('Thông Báo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: ColorConstants.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ObsBuilder(
        streams: [bloc.isLoadingSubject],
        builder: (context) {
          if (bloc.isLoadingSubject.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsConstants.horizontal16 +
                    EdgeInsetsConstants.top16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            bloc.showOptionBottomSheet(context: context);
                          },
                          child: Container(
                            padding: EdgeInsetsConstants.vertical8 +
                                EdgeInsetsConstants.horizontal12,
                            alignment: Alignment.centerLeft,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                width: 1,
                                color: ColorConstants.grayText,
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            child: ObsBuilder(
                              streams: [bloc.selectedOptionSubject],
                              builder: (context) {
                                return Row(
                                  children: [
                                    Text(
                                      bloc.selectedOptionSubject.value.title,
                                    ),
                                    SizedBoxConstants.h4,
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorConstants.primaryBlack,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBoxConstants.w10,
                        InkWell(
                          onTap: () {
                            bloc.onTapChangeSeen();
                          },
                          child: ObsBuilder(
                            streams: [bloc.isNoSeenSubject],
                            builder: (context) {
                              final isSeen = bloc.isNoSeenSubject.value;
                              return Container(
                                padding: EdgeInsetsConstants.vertical8 +
                                    EdgeInsetsConstants.horizontal12,
                                alignment: Alignment.centerLeft,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isSeen
                                      ? ColorConstants.darkColor
                                      : ColorConstants.transparent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: ColorConstants.grayText,
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  'Chưa xem',
                                  style:
                                      isSeen ? textStyleWhite : textStyleBlack,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBoxConstants.h12,
                    const Divider(
                      height: 0,
                      color: ColorConstants.divider,
                    ),
                    SizedBoxConstants.h12,
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Tuần này'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ObsBuilder(
                  streams: [
                    bloc.notificationListSubject,
                    bloc.noSeenNotificationListSubject,
                    bloc.isNoSeenSubject,
                  ],
                  builder: (context) {
                    final isNoSeen = bloc.isNoSeenSubject.value;
                    final listNotification = isNoSeen
                        ? bloc.noSeenNotificationListSubject.value
                        : bloc.notificationListSubject.value;
                    if (listNotification.isEmpty) {
                      return const Center(
                        child: Text('Không có thông báo nào'),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        bloc.fetchNotification();
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final notification = listNotification[index];
                          return NotificationItem(notification: notification);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 0,
                            color: ColorConstants.divider,
                          );
                        },
                        itemCount: listNotification.length,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
