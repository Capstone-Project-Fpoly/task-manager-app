import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/widgets/divider/app_divider.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      surfaceTintColor: ColorConstants.white,
      backgroundColor: ColorConstants.white,
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: const Text(''),
    );
  }
}
