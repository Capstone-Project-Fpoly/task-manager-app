import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/feature/notification/enum/notification_options.dart';
import 'package:task_manager/feature/notification/widget/option_bottom_sheet.dart';

class NotificationBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  final selectedOptionSubject = BehaviorSubject<NotificationOptionsEnum>.seeded(
    NotificationOptionsEnum.all,
  );

  final isSeenSubject = BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    selectedOptionSubject.close();
    isSeenSubject.close();
    super.dispose();
  }

  void onTapChangeSeen() {
    isSeenSubject.value = !isSeenSubject.value;
  }

  void init() {}

  void onBackToBoardScreen() {
    routerService.pop();
  }

  void onTapOption({required NotificationOptionsEnum option}) {
    selectedOptionSubject.value = option;
    routerService.pop();
  }

  Future<void> showOptionBottomSheet({
    required BuildContext context,
  }) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const OptionBottomSheet();
      },
    );
  }

  NotificationBloc(this.ref) {
    init();
  }
}
