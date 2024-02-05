import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';

class AddBoardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final nameBoardSubject =
      BehaviorSubject<TextEditingController>.seeded(TextEditingController());

  void init() {}

  @override
  void dispose() {
    super.dispose();
    nameBoardSubject.close();
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  late final appBloc = ref.read(BlocProvider.app);
  AddBoardBloc(this.ref) {
    init();
  }
}
