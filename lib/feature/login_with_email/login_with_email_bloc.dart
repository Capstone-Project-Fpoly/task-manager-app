import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';

class LoginWithEmailBloc extends BlocBase {
  final Ref ref;
  final bool isLogin;
  LoginWithEmailBloc(this.ref,this.isLogin);

  late final toastService = ref.watch(AppService.toast);
  late final graphqlService = ref.read(AppService.graphQL);

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
  void onTapLoginOtherEmail(){
    routerService.push(RouteInput.loginOtherEmail());
  }
}
