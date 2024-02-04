import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/router/utils/route_page.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/app_bar/custom_app_bar.dart';
import 'package:task_manager/shared/enum/navigation_enum.dart';
import 'package:task_manager/shared/extensions/enum/navigation_enum_extention.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/widgets/drawer/app_drawer.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(BlocProvider.app);
    return ObsBuilder(
      streams: [bloc.isLoadingSubject],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: Scaffold(
            // appBar: CustomAppBar(
            //   title: ObsBuilder(
            //     streams: [bloc.selectedNavigationEnumSubject],
            //     builder: (context) {
            //       return Text(
            //         bloc.selectedNavigationEnumSubject.value.label,
            //         style: const AppTextStyle(
            //           color: ColorConstants.white,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       );
            //     },
            //   ),
            //   color: ColorConstants.primary,
            // ),
            // drawer: const AppDrawer(),
            body: Stack(
              children: NavigationEnum.values.map((tab) {
                return ObsBuilder(
                  streams: [bloc.selectedNavigationEnumSubject],
                  builder: (ctx) => Offstage(
                    offstage: tab != bloc.selectedNavigationEnumSubject.value,
                    child: Navigator(
                      key: bloc.navigatorKeysMap[tab],
                      onGenerateRoute: buildRouteFactory(tab),
                      initialRoute: tab.route,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  RouteFactory buildRouteFactory(NavigationEnum tab) {
    switch (tab) {
      case NavigationEnum.broad:
        return RoutePage.onGenerateBoardTab;
      case NavigationEnum.myBroad:
        return RoutePage.onGenerateMyBoardTab;
      case NavigationEnum.myCard:
        return RoutePage.onGenerateMyCardTab;
      case NavigationEnum.setting:
        return RoutePage.onGenerateSettingTab;
      case NavigationEnum.help:
        return RoutePage.onGenerateHelpTab;
    }
  }
}
