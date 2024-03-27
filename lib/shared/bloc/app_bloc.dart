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
import 'package:task_manager/graphql/Subscriptions/test.graphql.dart';
import 'package:task_manager/graphql/queries/me.graphql.dart';
import 'package:task_manager/shared/enum/navigation_enum.dart';
import 'package:task_manager/shared/widgets/custom_toast_notification.dart';

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
    selectedNavigationEnumSubject.value = navigationEnum;
  }

  Future<void> init() async {
    _initGraphqlClient();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _setupFirebaseMessaging();
      FirebaseMessaging.onMessage.listen(_onInAppFirebaseMessage);
    });
    await getCurrentUser();
    try {
      graphQLService.client
          .subscribe$TestSub(
        Options$Subscription$TestSub(
          variables: Variables$Subscription$TestSub(
            id: 'abc',
          ),
        ),
      )
          .listen((event) {
        debugPrint('$event');
      });
    } catch (e) {
      debugPrint('$e');
    }
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
    final result = await graphQLService.client.query$me(Options$Query$me());
    if (result.hasException) return null;
    if (result.parsedData == null) return null;
    userSubject.value = result.parsedData?.me;
    return result.parsedData?.me;
  }

  Future<void> _onInAppFirebaseMessage(RemoteMessage message) async {

    if (message.notification == null) return;
    final title = message.notification!.title?? '';
    final body = message.notification!.body?? '';

    toastService.showToastNotification(
      builder: (context) {
        return CustomToastNotification(title: title,body: body);
      },
    );
  }

  Future<void> onTapLogout() async {
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
    routerService.pushReplacement(RouteInput.login());
  }
}
