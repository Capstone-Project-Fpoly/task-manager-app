import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTapLeadingButton;
  final Widget? title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;
  final Color? tintColor;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  const CustomAppBar({
    super.key,
    this.onTapLeadingButton,
    this.title,
    this.centerTitle = true,
    this.leading,
    this.actions,
    this.color,
    this.tintColor,
    this.bottom,
    this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    return buildAppBar(context);
  }

  AppBar buildAppBar(BuildContext context) {
    final color = this.color ?? ColorConstants.background;
    return AppBar(
      title: title ??
          const Text(
            '',
            style: AppTextStyle(
              color: ColorConstants.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
      backgroundColor: color,
      foregroundColor: color,
      surfaceTintColor: tintColor ?? color,
      elevation: 0,
      leading: leading ??
          IconButton(
            icon: const Icon(Icons.menu),
            color: ColorConstants.white,
            onPressed: () {
              onTapLeadingButton != null
                  ? onTapLeadingButton?.call()
                  : Scaffold.of(context).openDrawer();
            },
          ),
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
