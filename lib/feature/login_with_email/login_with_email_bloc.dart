import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';

import 'package:task_manager/base/dependency/router/utils/route_input.dart';

class LoginWithEmailBloc extends BlocBase {
  final Ref ref;
  LoginWithEmailBloc(this.ref);

  late final toastService = ref.watch(AppService.toast);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);

  void onTapLoginOtherEmail() {
    routerService.push(RouteInput.loginOtherEmail());
  }
}
