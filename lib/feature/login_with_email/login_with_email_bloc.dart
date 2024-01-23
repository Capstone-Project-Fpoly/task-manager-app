import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Mutations/login_by_email.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/utilities/fcm.dart';

class LoginWithEmailBloc extends BlocBase {
  Ref ref;

  LoginWithEmailBloc(this.ref);

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
      final deviceId = await FirebaseMessagingUtils.getDeviceToken();
      if (deviceId == null) return;
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
    } on FirebaseAuthException {
      toastService.showText(message: 'Sai mật khẩu');
    }
  }
}
