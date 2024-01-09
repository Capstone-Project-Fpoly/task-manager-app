import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';

class LoginBloc extends BlocBase {
  final Ref ref;
  late final graphqlService = ref.read(AppService.graphQL);

  LoginBloc(this.ref) {
    init();
  }

  Future<void> init() async {
    // final result = await graphqlService.client.query$getAllBooks(
    //   Options$Query$getAllBooks(),
    // );
  }

  Future<void> onTapLoginByGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    print(userCredential);
  }
}
