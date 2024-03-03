import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/feature/notification/widget/option_bottom_sheet.dart';

class NotificationBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  final selectedOptionSubject = BehaviorSubject<int>.seeded(0);
  @override
  void dispose() {
    selectedOptionSubject.close();
    super.dispose();
  }

  void init() {}
  void onBackToBoardScreen() {
    routerService.pop();
  }

  void onTapOptionAll() {
    selectedOptionSubject.value = 0;
    routerService.pop();
  }

  void onTapOptionI() {
    selectedOptionSubject.value = 1;
    routerService.pop();
  }

  void onTapOptionComment() {
    selectedOptionSubject.value = 2;
    routerService.pop();
  }

  void onTapOptionRequestJoin() {
    selectedOptionSubject.value = 3;
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
