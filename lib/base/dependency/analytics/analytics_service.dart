import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsService {
  final Ref ref;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  AnalyticsService(this.ref) {
    analytics.setAnalyticsCollectionEnabled(true);
    analytics.logAppOpen(
      parameters: {'open_time': DateTime.now().toUtc().toIso8601String()},
    );
  }

  Future<void> logEvent({
    required String eventName,
    Map<String, dynamic>? parameters,
  }) async {
    await analytics.logEvent(name: eventName, parameters: parameters);
  }
}
