import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql/client.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/local_storage/local_storage_key.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/loginByGoogle.graphql.dart';
import 'package:task_manager/graphql/queries/me.graphql.dart';
import 'package:task_manager/schema.graphql.dart';
import 'package:task_manager/shared/utilities/fcm.dart';

class LoginBloc extends BlocBase {
  final Ref ref;

  late final graphqlService = ref.read(AppService.graphQL);
  late final localStorageService = ref.watch(AppService.localStorage);
  late final routerService = ref.watch(AppService.router);
  late final analyticService = ref.watch(AppService.analytic);
  late final appBloc = ref.watch(BlocProvider.app);
  late final toastService = ref.watch(AppService.toast);
  late BuildContext context;
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  LoginBloc(this.ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _checkLogin();
    });
  }

  void onTapBack() {
    routerService.pop();
  }

  void onTapLoginEmail() {
    routerService.push(RouteInput.loginOtherEmail());
  }

  void onTapRegEmail() {
    routerService.push(RouteInput.regEmail());
  }

  Future<void> _checkLogin() async {
    final token = localStorageService.getString(LocalStorageKey.key);
    if (token == null) return;
    final client = graphqlService.buildGraphQLClientWithToken(token);
    graphqlService.clientSubject.value = client;
    isLoadingSubject.value = true;
    final user = await appBloc.getCurrentUser();
    isLoadingSubject.value = false;
    if (user == null) {
      toastService.showText(message: 'Đăng nhập thất bại');
      return;
    }
    routerService.pushReplacement(RouteInput.root());
  }

  Future<Fragment$UserFragment?> getCurrentUser(GraphQLClient client) async {
    final result = await client.query$me(Options$Query$me());
    if (result.hasException) return null;
    if (result.parsedData == null) return null;
    final user = result.parsedData!.me;
    return user;
  }

  Future<void> onTapLoginByGoogle() async {
    isLoadingSubject.value = true;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      isLoadingSubject.value = false;
      return;
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
    final token = await userCredential.user?.getIdToken();
    await loginByGoogle(idToken: token);
    isLoadingSubject.value = false;
  }

  Future<void> loginByGoogle({required String? idToken}) async {
    if (idToken == null) return;
    final deviceId = await FirebaseMessagingUtils.getDeviceToken();
    if (deviceId == null) return;
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$LoginByGoogle(
      Options$Mutation$LoginByGoogle(
        variables: Variables$Mutation$LoginByGoogle(
          input: Input$InputLogin(
            deviceId: deviceId,
            idToken: idToken,
          ),
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) return;
    if (result.parsedData == null) return;
    _saveToken(result.parsedData!.loginByGoogle);
  }

  Future<void> _saveToken(String? token) async {
    if (token == null) return;
    localStorageService.put(LocalStorageKey.key, token);
    graphqlService.updateGraphQLClientWithToken(token);
    isLoadingSubject.value = true;
    await appBloc.getCurrentUser();
    isLoadingSubject.value = false;
    analyticService.analytics.logLogin(loginMethod: 'google');
    routerService.pushReplacement(RouteInput.root());
  }

  @override
  void dispose() {
    isLoadingSubject.close();
    super.dispose();
  }
}
