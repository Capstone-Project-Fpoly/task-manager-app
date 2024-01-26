import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/drawer/widget/cusstom_text_field.dart';
import 'package:task_manager/shared/widgets/icons/google_icon.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';

class RegEmailScreen extends ConsumerWidget {
  const RegEmailScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.regWithEmail);
    final blocLogin = ref.watch(BlocProvider.login);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: ObsBuilder(
          streams: [
            bloc.isShowPassSubject,
            bloc.errorCheckTextSubject,
            bloc.errorCheckRePassSubject,
            bloc.errorCheckPassSubject,
            bloc.errorCheckOtpSubject,
          ],
          builder: (context) => Column(
            children: [
              SizedBoxConstants.h36,
              Container(
                width: width,
                height: 100,
                padding: EdgeInsetsConstants.top50,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TrelloIcon(width: 50),
                    SizedBoxConstants.w16,
                    Text(
                      'Task Manager',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBoxConstants.h32,
              const Text('Chào mừng bạn đăng ký tài khoán'),
              const Text('Task manager hãy dùng theo cách của bạn'),
              SizedBoxConstants.h32,
              CusstomTextField(
                controller: bloc.emailController,
                hintText: 'Nhập Email',
                keyBroadType: TextInputType.emailAddress,
              ),
              Container(
                padding: EdgeInsetsConstants.left8,
                width: width - 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  bloc.errorCheckTextSubject.value,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
              SizedBoxConstants.h8,
              CusstomTextField(
                controller: bloc.passController,
                hintText: 'Nhập mật khẩu',
                isObsText: !bloc.isShowPassSubject.value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    bloc.showPass();
                  },
                  child: bloc.isShowPassSubject.value
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                ),
              ),
              Container(
                padding: EdgeInsetsConstants.left8,
                width: width - 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  bloc.errorCheckPassSubject.value,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
              SizedBoxConstants.h12,
              CusstomTextField(
                controller: bloc.rePassController,
                hintText: 'Xác nhận mật khẩu',
                isObsText: !bloc.isShowPassSubject.value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    bloc.showPass();
                  },
                  child: bloc.isShowPassSubject.value
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                ),
              ),
              Container(
                padding: EdgeInsetsConstants.left8,
                width: width - 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  bloc.errorCheckRePassSubject.value,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
              SizedBoxConstants.h12,
              ObsBuilder(
                streams: [bloc.countSubject, bloc.isTapSendSubject],
                builder: (context) {
                  return CusstomTextField(
                    controller: bloc.oTPController,
                    hintText: 'Nhập mã xác minh',
                    suffixIcon: Container(
                      width: 90,
                      margin: EdgeInsetsConstants.left8 +
                          EdgeInsetsConstants.right8,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          bloc.sendOTPEmail(email: bloc.emailController.text);
                        },
                        child: Text(
                          bloc.isTapSendSubject.value
                              ? '${bloc.countSubject.value}'
                              : "Gửi mã",
                          style: TextStyle(
                            color: ColorConstants.backgroundColorApp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding: EdgeInsetsConstants.left8,
                width: width - 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  bloc.errorCheckOtpSubject.value,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
              SizedBoxConstants.h12,
              Center(
                child: ObsBuilder(
                  streams: [bloc.isOnTapRegSubject],
                  builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: bloc.isOnTapRegSubject.value
                            ? ColorConstants.backgroundColorApp
                            : ColorConstants.backgroundColorApp
                                .withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextButton(
                        onPressed: bloc.isOnTapRegSubject.value
                            ? () {
                                bloc.onTapRegEmail(
                                  email: bloc.emailController.value.text,
                                  pass: bloc.passController.value.text,
                                  otp: bloc.oTPController.value.text,
                                  rePass: bloc.rePassController.value.text,
                                );
                              }
                            : null,
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBoxConstants.h20,
              const Text('Hoặc tiếp tục với'),
              SizedBoxConstants.h20,
              Center(
                child: GestureDetector(
                  onTap: () {
                    blocLogin.onTapLoginByGoogle();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GoogleIcon(
                          width: 20,
                        ),
                        Text('Google'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
