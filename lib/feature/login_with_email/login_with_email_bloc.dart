import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';

class LoginWithEmailBloc extends BlocBase {
  final Ref ref;
  final bool isLogin;
  LoginWithEmailBloc(this.ref,this.isLogin);
  late final routerService = ref.watch(AppService.router);

  void onTapLoginOtherEmail(){
    routerService.push(RouteInput.loginOtherEmail());
  }
}
