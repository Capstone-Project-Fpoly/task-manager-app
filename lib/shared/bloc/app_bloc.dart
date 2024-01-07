import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/local_storage/local_storage_key.dart';

class AppBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphQLService = ref.watch(AppService.graphQL);
  late final localStorageService = ref.watch(AppService.localStorage);
  late final toastService = ref.watch(AppService.toast);

  AppBloc(this.ref) {
    init();
  }

  void init() {
    _initGraphqlClient();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _setupFirebaseMessaging();
      FirebaseMessaging.onMessage.listen(_onInAppFirebaseMessage);
    });
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
    final accessToken =
        localStorageService.getString(LocalStorageKey.accessToken.name) ?? '';
    graphQLService.updateGraphQLClientWithToken(accessToken);
  }

  void onTapBack(BuildContext context) {
    routerService.pop(context: context, result: false);
  }

  Future<void> _onInAppFirebaseMessage(RemoteMessage message) async {}
}
