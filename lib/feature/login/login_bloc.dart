import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Mutations/loginByGoogle.graphql.dart';

class LoginBloc extends BlocBase {
  final Ref ref;
  late final graphqlService = ref.read(AppService.graphQL);
  late final localStorageService = ref.watch(AppService.localStorage);
  late final routerService = ref.watch(AppService.router);

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
    final token = await userCredential.user?.getIdToken();
    loginByGoogle(idToken: token);
  }

  Future<void> loginByGoogle({required String? idToken}) async {
    if (idToken == null) return;
    final result = await graphqlService.client.mutate$LoginByGoogle(
      Options$Mutation$LoginByGoogle(
        variables: Variables$Mutation$LoginByGoogle(idToken: idToken),
      ),
    );
    if (result.hasException) return;
    if (result.parsedData == null) return;
    _saveToken(result.parsedData!.loginByGoogle);
  }

  Future<void> _saveToken(String? token) async {
    if (token == null) return;
    await localStorageService.put('token', token);
    graphqlService.updateGraphQLClientWithToken(token);
    routerService.push(RouteInput.root());
  }
}
