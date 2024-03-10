import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/invite_member/widget/custom_text_field_invite_member_screen.dart';
import 'package:task_manager/feature/invite_member/widget/list_member_widget.dart';
import 'package:task_manager/feature/invite_member/widget/list_search_widget.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/utilities/color.dart';

class InviteMemberScreen extends ConsumerWidget {
  const InviteMemberScreen({super.key});


  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.inviteMember);
    final color =
        ColorUtils.getColorFromHex(bloc.boardBloc.boardFragment.color);
    final hslColor = HSLColor.fromColor(color);
    final darkerColor =
        hslColor.withLightness(hslColor.lightness * 0.5).toColor();
    return ObsBuilder(
      streams: [
        bloc.isSearchUsersSubject,
        bloc.isLoadingSubject,
        bloc.isSearchSubject,
        bloc.nameBoardSubject,
      ],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: darkerColor,
              leading: bloc.isSearchUsersSubject.value
                  ? IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.white,
                      ),
                      onPressed: () => bloc.onTapCancelSearch(),
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () => bloc.back(),
                    ),
              title: const Text(
                'Quản lý thành viên',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                ObsBuilder(
                  streams: [bloc.isSearchUsersSubject],
                  builder: (context) {
                    if (!bloc.isSearchUsersSubject.value) {
                      return const SizedBox();
                    }
                    return IconButton(
                      icon: const Icon(
                        Icons.done,
                        size: 24,
                        color: Colors.white,
                      ),
                      onPressed: bloc.inviteMembersToBoard,
                    );
                  },
                ),
              ],
            ),
            body: ObsBuilder(
              streams: [
                bloc.isSearchUsersSubject,
                bloc.listSearchInviteUsersSubject,
                bloc.listMemberSubject,
              ],
              builder: (context) {
                return Container(
                  padding: EdgeInsetsConstants.horizontal24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBoxConstants.h20,
                      const Text(
                        'Mời thành viên:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBoxConstants.h20,
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CustomTextFieldInviteMember(
                          controller: bloc.searchController,
                          hintText: 'Email, tên người dùng muốn mời',
                          prefixIcon: bloc.isSearchSubject.value
                              ? Transform.scale(
                                  scale: 0.35,
                                  child: const CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 5,
                                  ),
                                )
                              : const Icon(Icons.search_outlined),
                        ),
                      ),
                      SizedBoxConstants.h24,
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        padding: EdgeInsetsConstants.left20 +
                            EdgeInsetsConstants.right20,
                        decoration: BoxDecoration(
                          color: darkerColor.withOpacity(0.25),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              bloc.nameBoardSubject.value,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.copy,
                                    weight: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    weight: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBoxConstants.h24,
                      ObsBuilder(
                        streams: [bloc.isSearchUsersSubject],
                        builder: (context) {
                          return !bloc.isSearchUsersSubject.value
                              ? const Text('Thành viên')
                              : const Text('Tất cả người dùng');
                        },
                      ),
                      SizedBoxConstants.h24,
                      bloc.isSearchUsersSubject.value
                          ? Expanded(
                              child: ObsBuilder(
                                streams: [
                                  bloc.listSearchInviteUsersSubject,
                                ],
                                builder: (context) {
                                  final inviteUsers =
                                      bloc.listSearchInviteUsersSubject.value;
                                  return ListView.separated(
                                    itemCount: inviteUsers.length,
                                    itemBuilder: (context, index) {
                                      final inviteUser = inviteUsers[index];
                                      if (inviteUser == null) {
                                        return const SizedBox();
                                      }
                                      return SearchItemListWidget(
                                        context: context,
                                        user: inviteUser,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBoxConstants.h12;
                                    },
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: ObsBuilder(
                                streams: [
                                  bloc.listMemberSubject,
                                ],
                                builder: (context) {
                                  final memberBoards =
                                      bloc.listMemberSubject.value;
                                  return ListView.separated(
                                    itemCount: memberBoards.length,
                                    itemBuilder: (context, index) {
                                      final memberBoard = memberBoards[index];
                                      if (memberBoard == null) {
                                        return const SizedBox();
                                      }
                                      return InviteMemberItemList(
                                        context: context,
                                        user: memberBoard,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBoxConstants.h12;
                                    },
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
