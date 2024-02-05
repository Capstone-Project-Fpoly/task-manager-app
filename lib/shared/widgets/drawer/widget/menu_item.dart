import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/enum/navigation_enum.dart';
import 'package:task_manager/shared/extensions/enum/navigation_enum_extention.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class MenuItem extends ConsumerWidget {
  const MenuItem({
    super.key,
    required this.navigationEnum,
  });

  final NavigationEnum navigationEnum;

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.app);
    return ObsBuilder(
      streams: [bloc.selectedNavigationEnumSubject],
      builder: (context) {
        final selected =
            bloc.selectedNavigationEnumSubject.value == navigationEnum;
        return Stack(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(left: 19),
              leading: selected
                  ? navigationEnum.iconSelected
                  : navigationEnum.iconUnSelected,
              title: Text(
                navigationEnum.label,
                textAlign: TextAlign.start,
                style: AppTextStyle(
                  color: selected
                      ? ColorConstants.primary
                      : ColorConstants.primaryText,
                ),
              ),
              onTap: () {
                Scaffold.of(context).closeDrawer();
                bloc.onTapSelectedNavigation(navigationEnum);
              },
            ),
            if (selected)
              Positioned.fill(
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
          ],
        );
      },
    );
  }
}
