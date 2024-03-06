import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';

class SettingBoardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  final colorSubject = BehaviorSubject.seeded('2196F3');
  final backgroundColorSubject = BehaviorSubject<Color>.seeded(
    const Color(0XFF2196F3),
  );
  late final boardDetailBloc = ref.read(BlocProvider.boardDetail);

  @override
  void dispose() {
    colorSubject.close();
    backgroundColorSubject.close();
    super.dispose();
  }

  void init() {
    backgroundColorSubject.value = Color(
      int.tryParse('0XFF${boardDetailBloc.boardFragment.color}') ?? 0XFF2196F3,
    );
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  Future<void> onNextToBackgroundBoardWidget() async {
    final resultColor = await routerService.push(RouteInput.backgroundBoard());
    if (resultColor != null) {
      colorSubject.value = resultColor.toString();
      backgroundColorSubject.value =
          Color(int.tryParse('0XFF${colorSubject.value}') ?? 0XFF2196F3);
    }
  }

  SettingBoardBloc(this.ref) {
    init();
  }
}
