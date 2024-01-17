import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/app_bar/custom_app_bar.dart';
import 'package:task_manager/shared/widgets/drawer/drawer_menu.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      drawer: DrawerMenu(),
      appBar: CustomAppBar(title: 'Màn Root', color: ColorConstants.primary),
      backgroundColor: ColorConstants.white,
      body: Text('data'),
    );
  }
}
