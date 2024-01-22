import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:task_manager/shared/widgets/drawer/widget/app_drawer_list.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.app);
    return Drawer(
      surfaceTintColor: ColorConstants.white,
      backgroundColor: ColorConstants.white,
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ObsBuilder(
              streams: [bloc.userSubject],
              builder: (context) {
                final user = bloc.userSubject.value;
                return UserAccountsDrawerHeader(
                  otherAccountsPictures: [
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        bloc.onTapLogout();
                      },
                    ),
                  ],
                  decoration: const BoxDecoration(
                    color: ColorConstants.primary,
                  ),
                  currentAccountPictureSize: const Size(65, 65),
                  accountName: Text(
                    user?.fullName ?? 'Full Name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(
                    user?.email ?? 'Email',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  currentAccountPicture:
                      AppCircleAvatar(url: user?.avatar ?? ''),
                );
              },
            ),
            const DrawerList(),
          ],
        ),
      ),
    );
  }
}
