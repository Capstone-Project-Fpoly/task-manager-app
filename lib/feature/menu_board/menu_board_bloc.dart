import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';

class MenuBoardBloc extends BlocBase {
  final Ref ref;
  final Fragment$BoardFragment boardFragment;

  late final toastService = ref.watch(AppService.toast);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);

  MenuBoardBloc(this.ref, {required this.boardFragment});

  void onTapSettingBoard() {
    routerService.push(RouteInput.settingBoard());
  }

  void onTapBack() {
    routerService.pop();
  }

  void onTapInviteMember() {
    routerService.push(RouteInput.inviteMember());
  }
}
