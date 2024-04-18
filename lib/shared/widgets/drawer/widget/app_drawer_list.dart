import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/shared/enum/navigation_enum.dart';
import 'package:task_manager/shared/widgets/drawer/widget/menu_item.dart';

class DrawerList extends ConsumerWidget {
  const DrawerList({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: EdgeInsetsConstants.top16,
      child: const Column(
        children: [
          MenuItem(navigationEnum: NavigationEnum.broad),
          Divider(color: Colors.black12),
          MenuItem(navigationEnum: NavigationEnum.myBroad),
          MenuItem(
            navigationEnum: NavigationEnum.closeBoard,
          ),
          Divider(color: Colors.black12),
          MenuItem(navigationEnum: NavigationEnum.myCard),
          MenuItem(navigationEnum: NavigationEnum.help),
        ],
      ),
    );
  }
}
