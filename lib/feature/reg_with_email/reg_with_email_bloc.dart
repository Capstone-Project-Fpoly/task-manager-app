import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/constants/regexs.dart';
import 'package:task_manager/graphql/Mutations/reg_by_email.graphql.dart';
import 'package:task_manager/graphql/Mutations/send_otp_email.graphql.dart';
import 'package:task_manager/graphql/Mutations/verify_otp_email.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

class RegEmailBloc extends BlocBase {
  final Ref ref;

  final isShowPassSubject = BehaviorSubject<bool>.seeded(false);
  final isOnTapRegSubject = BehaviorSubject<bool>.seeded(false);
  final isTapSendSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  final errorCheckTextSubject = BehaviorSubject<String>.seeded('');
  final errorCheckPassSubject = BehaviorSubject<String>.seeded('');
  final errorCheckRePassSubject = BehaviorSubject<String>.seeded('');
  final errorCheckOtpSubject = BehaviorSubject<String>.seeded('');

  final countSubject = BehaviorSubject<int>.seeded(60);
  final countMax = 60;

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();
  final oTPController = TextEditingController();

  late final toastService = ref.watch(AppService.toast);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);

  late final blocLogin = ref.read(BlocProvider.login);
  void onTapBack() {
    routerService.pop();
  }

  bool validate() {
    errorCheckTextSubject.value = '';
    errorCheckPassSubject.value = '';
    errorCheckRePassSubject.value = '';
    errorCheckOtpSubject.value = '';

    if (emailController.text == '') {
      errorCheckTextSubject.value = 'Không được để trống';
      return false;
    }
    if (!RegexConstants.email.hasMatch(emailController.text)) {
      errorCheckTextSubject.value = 'email không đúng định dạng';
      return false;
    }
    if (passController.text == '') {
      errorCheckPassSubject.value = 'Không được để trống';
      return false;
    }
    if (passController.text.length < 6) {
      errorCheckPassSubject.value = 'Mật khẩu tối đa 6 ký tự';
      return false;
    }
    if (passController.text != rePassController.text) {
      errorCheckRePassSubject.value = 'Mật khẩu không trùng khớp';
      return false;
    }
    if (oTPController.text == '') {
      errorCheckOtpSubject.value = 'Không được để trống';
      return false;
    }
    return true;
  }

  void setTimeSendOtpAgain() {
    isTapSendSubject.value = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countSubject.value > 0) {
        countSubject.value = countSubject.value - 1;
      } else {
        timer.cancel();
        isTapSendSubject.value = false;
        countSubject.value = countMax;
      }
    });
  }

  void onChangeText() {
    oTPController.addListener(() {
      if (oTPController.value.text.isEmpty) {
        isOnTapRegSubject.value = false;
      } else {
        isOnTapRegSubject.value = true;
      }
    });
  }

  RegEmailBloc(this.ref) {
    init();
  }

  void init() {
    onChangeText();
  }

  void showPass() {
    isShowPassSubject.value = !isShowPassSubject.value;
  }

  Future<void> onTapLoginByGoogle() async {
    isLoadingSubject.value = true;
    await blocLogin.onTapLoginByGoogle();
    isLoadingSubject.value = false;
  }

  Future<void> sendOTPEmail() async {
    if (emailController.text != '') {
      setTimeSendOtpAgain();
      isLoadingSubject.value = true;
      final emailOtp = await graphqlService.client.mutate$SendOTPEmail(
        Options$Mutation$SendOTPEmail(
          variables: Variables$Mutation$SendOTPEmail(
            email: emailController.text,
          ),
        ),
      );
      isLoadingSubject.value = false;
      if (emailOtp.hasException || emailOtp.parsedData == null) {
        toastService.showText(message: 'lỗi');
      }
    } else {
      toastService.showText(message: 'chưa có Email');
    }
  }

  Future<bool> verifyEmailCheck({
    required String email,
    required String otp,
  }) async {
    final verifyEmail = await graphqlService.client.mutate$VerifyOTPEMail(
      Options$Mutation$VerifyOTPEMail(
        variables: Variables$Mutation$VerifyOTPEMail(
          input: Input$InputVerifyEmail(
            email: email,
            otp: otp,
          ),
        ),
      ),
    );
    if (verifyEmail.hasException) return false;
    if (verifyEmail.parsedData == null) return false;
    if (verifyEmail.parsedData!.verifyEmail == null) return false;
    return verifyEmail.parsedData!.verifyEmail!;
  }

  Future<void> onTapRegEmail() async {
    final check = validate();
    if (check == false) return;
    isLoadingSubject.value = true;
    final checkOTP = await verifyEmailCheck(
      email: emailController.text,
      otp: oTPController.text,
    );
    if (checkOTP == false) return;
    try {
      final result = await graphqlService.client.mutate$regByEmail(
        Options$Mutation$regByEmail(
          variables: Variables$Mutation$regByEmail(
            input: Input$InputEmail(
              email: emailController.text,
              passWord: passController.text,
            ),
          ),
        ),
      );
      isLoadingSubject.value = true;
      if (result.hasException) return;
      if (result.parsedData == null) return;
      routerService.pop();
      routerService.push(RouteInput.loginOtherEmail());
    } on FirebaseAuthException {
      toastService.showText(message: 'Không thành công');
    }
  }

  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    rePassController.dispose();
    oTPController.dispose();

    isShowPassSubject.close();
    isOnTapRegSubject.close();
    isLoadingSubject.close();

    errorCheckOtpSubject.close();
    errorCheckRePassSubject.close();
    errorCheckPassSubject.close();
    errorCheckTextSubject.close();
    countSubject.close();
    isTapSendSubject.close();
    super.dispose();
  }
}
