import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/menu_board/widget/custom_text_field_invite_member_screen.dart';
import 'package:task_manager/feature/menu_board/widget/list_member_widget.dart';
import 'package:task_manager/feature/menu_board/widget/list_search_widget.dart';
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
        bloc.checkMemberSubject,
        bloc.isLoadingSubject,
        bloc.isSearchSubject,
      ],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: darkerColor,
              leading: bloc.checkMemberSubject.value
                  ? IconButton(
                      icon: const Icon(Icons.cancel,
                          size: 20, color: Colors.white,),
                      onPressed: () => bloc.onTapCancelSearch(),
                    )
                  : IconButton(
                      icon: const Icon(Icons.arrow_back,
                          size: 20, color: Colors.white,),
                      onPressed: () => bloc.back(),
                    ),
              title: const Text(
                'Quản lý thành viên hội đồng quản trị',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            body: ObsBuilder(
              streams: [
                bloc.checkMemberSubject,
                bloc.listSearchInviteUsersSubject,
                bloc.listMemberSubject,
              ],
              builder: (context) {
                return Container(
                  padding:
                      EdgeInsetsConstants.left8 + EdgeInsetsConstants.right8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBoxConstants.h20,
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CustomTextFieldInviteMember(
                          controller: bloc.searchController,
                          hintText: 'Email, username',
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
                      SizedBoxConstants.h20,
                      ObsBuilder(
                        streams: [bloc.checkMemberSubject],
                        builder: (context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: !bloc.checkMemberSubject.value
                                ? const Text('Thành viên')
                                : const Text('Tất cả người dùng'),
                          );
                        },
                      ),
                      SizedBoxConstants.h28,
                      bloc.checkMemberSubject.value
                          ? Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: ObsBuilder(
                                  streams: [
                                    bloc.listSearchInviteUsersSubject,
                                  ],
                                  builder: (context) {
                                    final inviteUsers =
                                        bloc.listSearchInviteUsersSubject.value;
                                    return ListView.builder(
                                      itemCount: inviteUsers.length,
                                      itemBuilder: (context, index) {
                                        final inviteUser = inviteUsers[index];
                                        return SearchListWidget(
                                            context: context, user: inviteUser,);
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                          : Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: ObsBuilder(
                                  streams: [
                                    bloc.listMemberSubject,
                                  ],
                                  builder: (context) {
                                    final memberBoards =
                                        bloc.listMemberSubject.value;
                                    return ListView.builder(
                                      itemCount: memberBoards.length,
                                      itemBuilder: (context, index) {
                                        final memberBoard = memberBoards[index];
                                        return MemberListWidget(
                                          context: context,
                                          user: memberBoard,
                                        );
                                      },
                                    );
                                  },
                                ),
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
