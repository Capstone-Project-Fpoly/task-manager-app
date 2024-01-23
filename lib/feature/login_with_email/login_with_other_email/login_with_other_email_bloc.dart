import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Mutations/login_by_email.graphql.dart';

class LoginWithOtherEmailBloc extends BlocBase {
  Ref ref;
  LoginWithOtherEmailBloc(this.ref);

  final isShowPassSubject = BehaviorSubject<bool>.seeded(false);
  final isPassSubject = BehaviorSubject<bool>.seeded(false);

  late final toastService = ref.watch(AppService.toast);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);


  bool validateEmail(String email){
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  void showPass() {
    isShowPassSubject.value = !isShowPassSubject.value;
  }

  void showTextFieldPass(String email) {
    if(validateEmail(email)) isPassSubject.value = true;
  }

  void loginEmailFinish(){
    routerService.push(RouteInput.root());
  }

  Future<void> loginEmail({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    User? user;
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = await userCredential.user?.getIdToken();
      if (token == null || token.isEmpty) return;
      final result = await graphqlService.client.mutate$LoginByEmail(
        Options$Mutation$LoginByEmail(
          variables: Variables$Mutation$LoginByEmail(
            idToken: token,
          ),
        ),
      );
    } on FirebaseAuthException {
      toastService.showText(message: 'Sai mật khẩu');
    }
  }


}
