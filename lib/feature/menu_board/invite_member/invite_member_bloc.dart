import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
class InviteMemberBloc extends BlocBase{
  final Ref ref;

  InviteMemberBloc(this.ref){init();}

  final searchController = TextEditingController();
  final checkMemberSubject = BehaviorSubject<bool>.seeded(false);
  final isInviteSubject = BehaviorSubject<bool>.seeded(false);
  final focusNode = FocusNode();

  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    checkMemberSubject.close();
    isInviteSubject.close();
  }
  Future<void> init() async{}

  void onTapFocus() {
    checkMemberSubject.value = true;
  }

  void onTapCancelFocus() {
    focusNode.unfocus();
    checkMemberSubject.value = false;
  }

  void onTapInviteMember(){
    isInviteSubject.value = !isInviteSubject.value;
  }

  void back(){
   routerService.pop();
  }
}