import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';

class DialogEditMemberOfBoard extends ConsumerWidget {
  const DialogEditMemberOfBoard({super.key, required this.user});

  final Fragment$UserFragment user;

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.inviteMember);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ObsBuilder(
        streams: [bloc.isLoadingRemoveSubject],
        builder: (context) {
          return LoadingOverlay(
            isLoading: bloc.isLoadingRemoveSubject.value,
            child: Container(
              padding: EdgeInsetsConstants.all12,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        AppCircleAvatar(
                          url: user.avatar ?? '',
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              user.email ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBoxConstants.h12,
                  ObsBuilder(
                    streams: [bloc.isSetAdminForMemberSubject],
                    builder: (context) {
                      return Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsetsConstants.left16 +
                              EdgeInsetsConstants.right16,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    bloc.onTapSetPermissionMemberOfBoard(
                                        user: user, selectAdmin: true,),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsetsConstants.all8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.5,
                                      color:
                                          bloc.isSetAdminForMemberSubject.value
                                              ? Colors.greenAccent
                                              : Colors.grey,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Quản trị viên',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'Quản trị viên có thể xóa các thành viên bảng, chỉnh sửa thẻ và danh sách, thay đổi cài đặt bảng và xóa bảng',
                                        maxLines: 4,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      if (bloc.checkAdminOfBoard(user))
                                        Container(
                                          margin: EdgeInsetsConstants.top4,
                                          child: const Text(
                                            'Bạn không thể thay đổi vai trò vì bạn là quoản trị viên của bảng này',
                                            maxLines: 4,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBoxConstants.h4,
                              GestureDetector(
                                onTap: () =>
                                    bloc.onTapSetPermissionMemberOfBoard(
                                        user: user, selectAdmin: false,),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsetsConstants.all8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.5,
                                      color:
                                          !bloc.isSetAdminForMemberSubject.value
                                              ? Colors.greenAccent
                                              : Colors.grey,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Thành viên',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: !bloc.checkAdminOfBoard(user)
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Các thành viên bình thường có thể xem và chỉnh sửa thẻ, danh sách và một số cài đặt bảng',
                                        maxLines: 4,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: !bloc.checkAdminOfBoard(user)
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBoxConstants.h12,
                  bloc.checkAdminOfBoard(user)
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsetsConstants.right16,
                            child: GestureDetector(
                              onTap: () => bloc.back(),
                              child: const Text(
                                'ĐÓNG',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsetsConstants.left16 +
                                EdgeInsetsConstants.right16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => bloc.removeUserFromBoard(user),
                                  child: const Text(
                                    'LOẠI BỎ THÀNH VIÊN',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => bloc
                                      .onTapUpdatePermissionForMemberOfBoard(
                                          user,),
                                  child: const Text(
                                    'LƯU',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
