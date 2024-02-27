import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/menu_board/widget/cusstom_text_field_invite_member_screen.dart';

class InviteMemberScreen extends ConsumerWidget {
  const InviteMemberScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.inviteMember);
    return ObsBuilder(
      streams: [bloc.checkMemberSubject],
      builder: (context) {
        return Scaffold(
          appBar: !bloc.checkMemberSubject.value? AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.cancel,size: 20,color: Colors.black),
              onPressed: () => bloc.back(),
            ),
            title: const Text('Quản lý thành viên hội đồng quản trị',style: TextStyle(fontSize: 15,color: Colors.black),),
          ): null,
          body: ObsBuilder(
            streams: [
              bloc.checkMemberSubject,
            ],
            builder: (context) {
              return Container(
                padding: EdgeInsetsConstants.left8 + EdgeInsetsConstants.right8,
                margin: bloc.checkMemberSubject.value? EdgeInsetsConstants.top30: EdgeInsetsConstants.top4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBoxConstants.h20,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          CustomTextFieldInviteMember(
                            controller: bloc.searchController,
                            hintText: 'thêm bằng email, username',
                            prefixIcon: const Icon(Icons.search_outlined),
                          ),
                          !bloc.checkMemberSubject.value
                              ? Container()
                              : Container(
                                  width: MediaQuery.of(context).size.width * 0.20,
                                  child: TextButton(
                                      onPressed: () => bloc.onTapCancelFocus(),
                                      child: const Text(
                                        'xong',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 18),
                                      )),
                                ),
                        ],
                      ),
                    ),
                    SizedBoxConstants.h20,
                    ObsBuilder(
                      streams: [bloc.checkMemberSubject],
                      builder: (context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: !bloc.checkMemberSubject.value
                              ? const Text('Thành viên')
                              : const Text('Tất cả người dùng'),
                        );
                      },
                    ),
                    SizedBoxConstants.h28,
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ObsBuilder(
                          streams: [bloc.checkMemberSubject],
                          builder: (context) => ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return !bloc.checkMemberSubject.value
                                  ? Container(
                                      margin: EdgeInsetsConstants.top4,
                                      padding: EdgeInsetsConstants.all10,
                                      alignment: Alignment.centerLeft,
                                      width:
                                          MediaQuery.of(context).size.width * 0.95,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.10,
                                            height:
                                                MediaQuery.of(context).size.width *
                                                    0.10,
                                            child: const ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                              child: Image(
                                                image: NetworkImage(
                                                  'https://petapixel.com/assets/uploads/2022/08/The-DJI-Avata-is-a-Compact-FPV-Drone-for-Designed-for-Everyone.jpg',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBoxConstants.w16,
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.55,
                                            padding: EdgeInsetsConstants.left8,
                                            child: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'lanh',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'lanh',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBoxConstants.w4,
                                        ],
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsetsConstants.all8,
                                      alignment: Alignment.centerLeft,
                                      width:
                                          MediaQuery.of(context).size.width * 0.95,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.10,
                                            height:
                                                MediaQuery.of(context).size.width *
                                                    0.10,
                                            child: const ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                              child: Image(
                                                image: NetworkImage(
                                                  'https://petapixel.com/assets/uploads/2022/08/The-DJI-Avata-is-a-Compact-FPV-Drone-for-Designed-for-Everyone.jpg',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBoxConstants.w16,
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.62,
                                            padding: EdgeInsetsConstants.left8,
                                            child: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'lanh',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'lanh',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBoxConstants.w4,
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add_circle_outline,
                                            ),
                                            iconSize:
                                                MediaQuery.of(context).size.width *
                                                    0.05,
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
