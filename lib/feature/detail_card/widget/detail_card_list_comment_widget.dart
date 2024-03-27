import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/utilities/datetime.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';

class DetailCardListCommentWidget extends ConsumerWidget {
  const DetailCardListCommentWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [
        bloc.listCommentFragmentsSubject,
        bloc.listNotificationFragmentsSubject,
        bloc.isShowNotificationSubject,
      ],
      builder: (context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBoxConstants.w12,
                  Text(
                    bloc.isShowNotificationSubject.value
                        ? 'Thông báo'
                        : 'Hoạt động',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: true,
                        child: bloc.isShowNotificationSubject.value
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green[400],
                                  ),
                                  SizedBoxConstants.w8,
                                  const Text('Hiện thông báo'),
                                ],
                              )
                            : const Row(
                                children: [
                                  Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.black,
                                  ),
                                  SizedBoxConstants.w8,
                                  Text('Hiện thông báo'),
                                ],
                              ),
                      ),
                    ],
                    onSelected: (value) {
                      bloc.showNotification(value);
                    },
                    constraints: BoxConstraints(
                      minWidth: width - 350,
                    ),
                    child: const Icon(
                      Icons.more_vert,
                      color: ColorConstants.primary,
                    ),
                  ),
                  SizedBoxConstants.w12,
                ],
              ),
              SizedBoxConstants.h10,
              if (!bloc.isShowNotificationSubject.value)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bloc.listCommentFragmentsSubject.value.length,
                  itemBuilder: (context, i) {
                    final comment = bloc.listCommentFragmentsSubject.value[i];
                    return Container(
                      padding: EdgeInsetsConstants.horizontal12 +
                          EdgeInsetsConstants.bottom12,
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppCircleAvatar(
                            url: comment.user?.avatar ?? '',
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: (width - 114),
                                ),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: ColorConstants.comment,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      comment.user?.fullName ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      comment.comment,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  formatDateTimeCommentCard(
                                    comment.createdAt,
                                  ),
                                  style: const TextStyle(
                                    color: ColorConstants.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'delete',
                                child: const Text(
                                  'Xóa',
                                  style: TextStyle(color: ColorConstants.red),
                                ),
                                onTap: () => bloc.deleteComment(comment.id),
                              ),
                            ],
                            constraints: BoxConstraints(
                              minWidth: width - 350,
                            ),
                            child: Icon(
                              Icons.more_vert,
                              color: ColorConstants.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              if (bloc.isShowNotificationSubject.value)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bloc.listNotificationFragmentsSubject.value.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsetsConstants.horizontal12 +
                          EdgeInsetsConstants.bottom16,
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsConstants.right12,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: ColorConstants.black,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                child: Text(
                                  'Khang'.toUpperCase().substring(0, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: (width - 114),
                                ),
                                // padding: const EdgeInsets.only(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      bloc.listNotificationFragmentsSubject
                                          .value[i].content,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                bloc.listNotificationFragmentsSubject.value[i]
                                    .createdAt,
                                style: const TextStyle(
                                  color: ColorConstants.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
