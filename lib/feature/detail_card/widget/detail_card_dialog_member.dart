import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_user_extension.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';

class DetailCardDialogMemberWidget extends ConsumerWidget {
  const DetailCardDialogMemberWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    return Dialog(
      child: Container(
        color: ColorConstants.white,
        padding: EdgeInsetsConstants.all16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Thành viên của thẻ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ObsBuilder(
              streams: [bloc.usersOfBoard],
              builder: (context) {
                final users = bloc.usersOfBoard.value;
                if (users.isEmpty) {
                  return const SizedBox();
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return InkWell(
                      onTap: () {
                        bloc.addUserToCard(user);
                      },
                      child: Ink(
                        padding: EdgeInsetsConstants.vertical12,
                        child: Row(
                          children: [
                            AppCircleAvatar(
                              width: 40,
                              height: 40,
                              url: user?.avatar ?? '',
                            ),
                            SizedBoxConstants.w8,
                            Text(
                              user?.fullName ?? '',
                              style: const TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            ObsBuilder(
                              streams: [bloc.usersSubject],
                              builder: (context) {
                                final isCheck =
                                    bloc.usersSubject.value.contains(user);
                                if (!isCheck) {
                                  return SizedBoxConstants.shrink;
                                }
                                return const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  weight: 30,
                                );
                              },
                            ),
                            SizedBoxConstants.w16,
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBoxConstants.h20,
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    bloc.onBack();
                  },
                  child: Ink(
                    child: const Text(
                      'Hoàn tất',
                      style: TextStyle(
                        color: ColorConstants.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBoxConstants.w12,
              ],
            ),
            SizedBoxConstants.h8,
          ],
        ),
      ),
    );
  }
}
