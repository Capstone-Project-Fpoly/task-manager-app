import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/local_storage/local_storage_key.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/base/dependency/router/utils/route_name.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/logout.graphql.dart';
import 'package:task_manager/graphql/Querys/me.graphql.dart';
import 'package:task_manager/shared/enum/navigation_enum.dart';
import 'package:task_manager/shared/utilities/fcm.dart';

class AppBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphQLService = ref.watch(AppService.graphQL);
  late final localStorageService = ref.watch(AppService.localStorage);
  late final toastService = ref.watch(AppService.toast);
  final userSubject = BehaviorSubject<Fragment$UserFragment?>.seeded(null);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  final navigatorKeysMap = NavigationEnum.values
      .fold<Map<NavigationEnum, GlobalKey<NavigatorState>>>(
    {},
    (previousValue, element) =>
        previousValue..[element] = GlobalKey<NavigatorState>(),
  );

  final selectedNavigationEnumSubject =
      BehaviorSubject<NavigationEnum>.seeded(NavigationEnum.broad);

  AppBloc(this.ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      init();
    });
  }

  @override
  void dispose() {
    selectedNavigationEnumSubject.close();
    userSubject.close();
    isLoadingSubject.close();
    super.dispose();
  }

  void onTapSelectedNavigation(NavigationEnum navigationEnum) {
    routerService.pop();
    selectedNavigationEnumSubject.value = navigationEnum;
  }

  Future<void> init() async {
    _initGraphqlClient();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _setupFirebaseMessaging();
      FirebaseMessaging.onMessage.listen(_onInAppFirebaseMessage);
    });
    await getCurrentUser();
  }

  Future _setupFirebaseMessaging() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleInitialMessage(initialMessage);
      return;
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleInitialMessage);
  }

  void _handleInitialMessage(RemoteMessage initialMessage) {}

  Future _initGraphqlClient() async {
    final token = localStorageService.getString(LocalStorageKey.key) ?? '';
    graphQLService.updateGraphQLClientWithToken(token);
  }

  void onTapBack(BuildContext context) {
    routerService.pop(context: context, result: false);
  }

  Future<Fragment$UserFragment?> getCurrentUser() async {
    final deviceId = await FirebaseMessagingUtils.getDeviceToken();
    print(deviceId);
    final result = await graphQLService.client.query$me(Options$Query$me());
    if (result.hasException) return null;
    if (result.parsedData == null) return null;
    userSubject.value = result.parsedData?.me;
    return result.parsedData?.me;
  }

  Future<void> _onInAppFirebaseMessage(RemoteMessage message) async {}

  Future<void> onTapLogout({required BuildContext context}) async {
    showDialog(context: context, builder: (context) {
      return  AlertDialog(
        title: const Text('Đăng xuất',style: TextStyle(color: Colors.red)),
        content: const Text('Bạn có chắc muốn đăng xuất'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              isLoadingSubject.value = true;
              final result =
                  await graphQLService.client.mutate$Logout(Options$Mutation$Logout());
              isLoadingSubject.value = false;
              if (result.hasException) return;
              if (result.parsedData == null) return;
              if (!result.parsedData!.logout!) return;
              localStorageService.delete(LocalStorageKey.key);
              selectedNavigationEnumSubject.value = NavigationEnum.broad;
              userSubject.value = null;
              await FirebaseAuth.instance.signOut();
              routerService.popUntil(
                    (route) => route.settings.name == RouteName.root,
              );
              routerService.pushReplacement(RouteInput.login());// Đóng hộp thoại khi nhấn nút
            },
            child: const Text('Đồng ý'),
          ),
          TextButton(
            onPressed: () {
              routerService.pop(); // Đóng hộp thoại khi nhấn nút
            },
            child: const Text('Hủy',style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },);
  }
}
