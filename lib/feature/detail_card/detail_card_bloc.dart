import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';

class DetailCardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final isShowQuickActionsSubject = BehaviorSubject<bool>.seeded(false);
  final isShowLabelSubject = BehaviorSubject<bool>.seeded(false);
  final isShowAllSubject = BehaviorSubject<bool>.seeded(false);
  final descriptionController = TextEditingController();
  final commentController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    isShowQuickActionsSubject.close();
    descriptionController.dispose();
    commentController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    isShowLabelSubject.close();
    isShowAllSubject.close();
  }

  void init() {}

  void onBackToBoardScreen() {
    if (isShowLabelSubject.value == true) {
      isShowLabelSubject.value = false;
      return;
    }
    routerService.pop();
  }

  void setEndDate(String time) {
    endDateController.text = time;
  }

  void setStartTime(String time) {
    startDateController.text = time;
  }

  void showQuickAction() {
    isShowQuickActionsSubject.value = !isShowQuickActionsSubject.value;
  }

  void changeCheckBoxAll() {
    isShowAllSubject.value = !isShowAllSubject.value;
  }

  void showLabel() {
    isShowLabelSubject.value = !isShowLabelSubject.value;
  }

  void chooseOption() {
    isShowAllSubject.value = !isShowAllSubject.value;
    print(isShowAllSubject.value);
  }

  void onBack() {
    routerService.pop();
  }

  late final appBloc = ref.read(BlocProvider.app);
  DetailCardBloc(this.ref) {
    init();
  }
}
