import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/graphql/Mutations/board/create_board.graphql.dart';

class AddBoardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final appBloc = ref.read(BlocProvider.app);

  final colorButtonSubject =
      BehaviorSubject<Color>.seeded(ColorConstants.grayText);
  final colorSubject = BehaviorSubject.seeded('2196F3');
  final backgroundColorSubject = BehaviorSubject<Color>.seeded(
    const Color(0XFF2196F3),
  );
  final nameBoardSubject = BehaviorSubject<String>.seeded('');
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final isPublicSubject = BehaviorSubject<bool>.seeded(false);
  final titleOptionSubject = BehaviorSubject<String>.seeded('Riêng tư');
  final privateOptionSubject = BehaviorSubject<String>.seeded('Riêng tư');
  final publicOptionSubject = BehaviorSubject<String>.seeded('Công khai');

  @override
  void dispose() {
    nameBoardSubject.close();
    isLoadingSubject.close();
    titleOptionSubject.close();
    privateOptionSubject.close();
    publicOptionSubject.close();
    isPublicSubject.close();
    colorButtonSubject.close();
    backgroundColorSubject.close();
    colorSubject.close();
    super.dispose();
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  void init() {}

  void chooseRight(String value) {
    titleOptionSubject.value = value;
    if (titleOptionSubject.value == privateOptionSubject.value) {
      isPublicSubject.value = false;
    } else {
      isPublicSubject.value = true;
    }
  }

  void onChanged() {
    if (nameBoardSubject.value.trim().isEmpty) {
      colorButtonSubject.value = ColorConstants.grayText;
    } else {
      colorButtonSubject.value = ColorConstants.primary;
    }
  }

  Future<void> onTapAddBoard() async {
    if (nameBoardSubject.value.trim().isEmpty) return;
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$CreateBoard(
      Options$Mutation$CreateBoard(
        variables: Variables$Mutation$CreateBoard(
          title: nameBoardSubject.value.trim(),
          isPublic: isPublicSubject.value,
          color: colorSubject.value,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message,
      );
      routerService.pop(result: false);
      return;
    }
    routerService.pop(result: true);
  }

  Future<void> onNextToBackgroundBoardWidget() async {
    final resultColor = await routerService.push(RouteInput.backgroundBoard());
    if (resultColor != null) {
      colorSubject.value = resultColor.toString();
      backgroundColorSubject.value =
          Color(int.tryParse('0XFF${colorSubject.value}') ?? 0XFF2196F3);
    }
  }

  AddBoardBloc(this.ref) {
    init();
  }
}
