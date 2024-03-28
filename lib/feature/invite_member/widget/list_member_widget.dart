import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class InviteMemberItemList extends ConsumerWidget {
  const InviteMemberItemList({
    super.key,
    required this.context,
    required this.user,
  });

  final BuildContext context;
  final Fragment$UserFragment user;

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.inviteMember);
    return GestureDetector(
      onTap: () => bloc.onTapEditMemberOfBoard(context: context, user: user),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppCircleAvatar(
            url: user.avatar ?? '',
            width: MediaQuery.of(context).size.width * 0.10,
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
                  user.fullName ?? '',
                  maxLines: 2,
                  style: const AppTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.email ?? '',
                  maxLines: 2,
                  style: const AppTextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(bloc.getUserPermissions(user)),
        ],
      ),
    );
  }
}
