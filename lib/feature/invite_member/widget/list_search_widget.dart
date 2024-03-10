import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';

class SearchItemListWidget extends ConsumerWidget {
  const SearchItemListWidget({
    super.key,
    required this.context,
    required this.user,
  });

  final BuildContext context;
  final Fragment$UserFragment user;

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.inviteMember);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppCircleAvatar(
          url: user.avatar ?? '',
          width: MediaQuery.of(context).size.width * 0.10,
        ),
        SizedBoxConstants.w16,
        Container(
          width: MediaQuery.of(context).size.width * 0.62,
          padding: EdgeInsetsConstants.left8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.fullName ?? '',
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.email ?? '',
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => bloc.addMemberToList(user),
          icon: ObsBuilder(
            streams: [bloc.listInviteUsersSubject],
            builder: (context) {
              final isAdd = bloc.listInviteUsersSubject.value.contains(user);
              return isAdd
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.add_circle_outline,
                      color: Colors.blue,
                    );
            },
          ),
          iconSize: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }
}
