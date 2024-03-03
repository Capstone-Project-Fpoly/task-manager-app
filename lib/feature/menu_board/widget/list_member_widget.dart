import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';

class MemberListWidget extends ConsumerWidget {
  const MemberListWidget({
    super.key,
    required this.context,
    required this.user,
  });

  final BuildContext context;
  final Fragment$UserFragment? user;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: EdgeInsetsConstants.top4,
      padding: EdgeInsetsConstants.all10,
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            width: MediaQuery.of(context).size.width * 0.10,
            height: MediaQuery.of(context).size.width * 0.10,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: MediaQuery.of(context).size.width * 0.10,
              height: MediaQuery.of(context).size.width * 0.10,
              child: AppCircleAvatar(url: user?.avatar ?? ''),
            ),
          ),
          SizedBoxConstants.w16,
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsetsConstants.left8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user?.fullName ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user?.email ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBoxConstants.w4,
          const Text('Quản trị viên'),
        ],
      ),
    );
  }
}
