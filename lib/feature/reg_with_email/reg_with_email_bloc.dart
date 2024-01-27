import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
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
  final isRegSubject = BehaviorSubject<bool>.seeded(false);
  final isOnTapRegSubject = BehaviorSubject<bool>.seeded(false);
  final isTapSendSubject = BehaviorSubject<bool>.seeded(false);

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

  void onTapBack() {
    routerService.pop();
  }

  void validate() {
    if (emailController.text == '') {
      errorCheckTextSubject.value = 'Không được để trống';
    } else if (!RegexConstants.email.hasMatch(emailController.text)) {
      errorCheckTextSubject.value = 'email không đúng định dạng';
    } else {
      errorCheckTextSubject.value = '';
    }

    if (passController.text == '') {
      errorCheckPassSubject.value = 'Không được để trống';
    } else {
      errorCheckPassSubject.value = '';
    }

    if (passController.text != rePassController.text) {
      errorCheckRePassSubject.value = 'Mật khẩu không trùng khớp';
    } else {
      errorCheckRePassSubject.value = '';
    }
    if (oTPController.text == '') {
      errorCheckOtpSubject.value = 'Không được để trống';
    } else {
      errorCheckOtpSubject.value = '';
    }

    if (errorCheckPassSubject.value != '' ||
        errorCheckRePassSubject.value != '' ||
        errorCheckTextSubject.value != '' ||
        errorCheckRePassSubject.value != '') {
      isRegSubject.value = false;
    } else {
      isRegSubject.value = true;
    }
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

  Future<void> sendOTPEmail() async {
    setTimeSendOtpAgain();
    final emailOtp = await graphqlService.client.mutate$SendOTPEmail(
      Options$Mutation$SendOTPEmail(
        variables: Variables$Mutation$SendOTPEmail(
          email: emailController.text,
        ),
      ),
    );
    if (emailOtp.hasException || emailOtp.parsedData == null) {
      toastService.showText(message: 'lỗi');
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
    validate();
    if (isRegSubject.value != true) {
      toastService.showText(message: 'Điền không hợp lệ');
    }
    final checkOTP = await verifyEmailCheck(
        email: emailController.text, otp: oTPController.text);
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
    isRegSubject.close();
    isOnTapRegSubject.close();

    errorCheckOtpSubject.close();
    errorCheckRePassSubject.close();
    errorCheckPassSubject.close();
    errorCheckTextSubject.close();
    countSubject.close();
    isTapSendSubject.close();
    super.dispose();
  }
}
