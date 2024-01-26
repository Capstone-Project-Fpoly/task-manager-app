import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/constants/regexs.dart';
import 'package:task_manager/graphql/Mutations/login_by_email.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/utilities/fcm.dart';

import '../../../base/dependency/local_storage/local_storage_key.dart';

class LoginWithOtherEmailBloc extends BlocBase {
  Ref ref;
  LoginWithOtherEmailBloc(this.ref);

  final emailController = TextEditingController();
  final passController = TextEditingController();

  final isShowPassSubject = BehaviorSubject<bool>.seeded(false);
  final isPassSubject = BehaviorSubject<bool>.seeded(false);
  final isLoginSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  final errorCheckTextSubject = BehaviorSubject<String>.seeded('');
  final errorCheckPassSubject = BehaviorSubject<String>.seeded('');


  late final toastService = ref.watch(AppService.toast);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final localStorageService = ref.watch(AppService.localStorage);
  late final appBloc = ref.watch(BlocProvider.app);


  Future<void> validate() async {

    if (emailController.text == '') {
      errorCheckTextSubject.value = 'Không được để trống';
    } else if (!RegexConstants.email.hasMatch(emailController.text)) {
      errorCheckTextSubject.value = 'email không đúng định dạng';
    } else {
      errorCheckTextSubject.value = '';
      isPassSubject.value = true;
    }


    if (passController.text == '') {
      errorCheckPassSubject.value = 'Không được để trống';
    } else {
      errorCheckPassSubject.value = '';
    }


    if (errorCheckPassSubject.value != '' ||
        errorCheckTextSubject.value != '') {
      isLoginSubject.value = false;
    } else {
      isLoginSubject.value = true;
    }
  }

  void showPass() {
    isShowPassSubject.value = !isShowPassSubject.value;
  }


  Future<void> loginEmail() async {
    await validate();
    if(isLoginSubject.value){
      final auth = FirebaseAuth.instance;
      try {
        final userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        final token = await userCredential.user?.getIdToken();
        if (token == null || token.isEmpty) return;
        final deviceId = await FirebaseMessagingUtils.getDeviceToken();
        if (deviceId == null) return;
        isLoadingSubject.value = true;
        final result = await graphqlService.client.mutate$LoginByEmail(
          Options$Mutation$LoginByEmail(
            variables: Variables$Mutation$LoginByEmail(
              input: Input$InputLogin(
                deviceId: deviceId,
                idToken: token,
              ),
            ),
          ),
        );
        isLoadingSubject.value = false;
        if(result.hasException)return;
        if(result.parsedData == null )return;
        _saveToken(token);
      } on FirebaseAuthException {
        toastService.showText(message: 'Sai mật khẩu');
      }
    }
  }

  Future<void> _saveToken(String? token) async {
    if (token == null) return;
    localStorageService.put(LocalStorageKey.key, token);
    graphqlService.updateGraphQLClientWithToken(token);
    isLoadingSubject.value = true;
    await appBloc.getCurrentUser();
    isLoadingSubject.value = false;
    routerService.pushReplacement(RouteInput.root());
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();

    isShowPassSubject.close();
    isPassSubject.close();
    isLoadingSubject.close();
    isLoginSubject.close();

    errorCheckPassSubject.close();
    errorCheckTextSubject.close();

    super.dispose();
  }

}
