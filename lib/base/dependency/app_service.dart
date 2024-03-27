import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/dependency/admob/admob_service.dart';
import 'package:task_manager/base/dependency/analytics/analytics_service.dart';
import 'package:task_manager/base/dependency/graphql/graphql_service.dart';
import 'package:task_manager/base/dependency/local_storage/local_storage_service.dart';
import 'package:task_manager/base/dependency/router/router_provider.dart';
import 'package:task_manager/base/dependency/router/router_service.dart';
import 'package:task_manager/base/dependency/toast/toast_service.dart';

class AppProvider {
  static final router = Provider((ref) => RouterProvider());
  static final analytics = Provider((ref) => AnalyticsService(ref));

  AppProvider._();
}

class AppService {
  static final router = Provider(
    (ref) {
      return RouterService(
        routerInterface: ref.watch(AppProvider.router),
      );
    },
  );

  static late final Provider<LocalStorageService> localStorage;

  static final graphQL = Provider(
    (ref) {
      return GraphQLService(
        ref,
        localStorage: ref.watch(AppService.localStorage),
      );
    },
  );

  static final analytic = Provider<FirebaseAnalyticsObserver>(
    (ref) {
      final analytics = ref.watch(AppProvider.analytics);
      return FirebaseAnalyticsObserver(analytics: analytics.analytics);
    },
  );

  static final toast = Provider((ref) => ToastService());

  static final admob = Provider(
    (ref) => AdmobService(
      ref,
      appId: 'ca-app-pub-3940256099942544~3347511713',
      bannerAdUnitId: 'ca-app-pub-5948553297384633/3085893333',
      interstitialAdUnitId: 'ca-app-pub-3940256099942544/1033173712',
      rewardedAdUnitId: 'ca-app-pub-5948553297384633/4562626532',
    ),
  );

  AppService._();
}
