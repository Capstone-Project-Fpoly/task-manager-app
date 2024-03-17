import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/widgets/drawer/widget/cusstom_text_field.dart';
import 'package:task_manager/shared/widgets/icons/google_icon.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';

class RegEmailScreen extends ConsumerWidget {
  const RegEmailScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.regWithEmail);
    final width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [bloc.isLoadingSubject],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: Scaffold(
            body: SingleChildScrollView(
              child: ObsBuilder(
                streams: [
                  bloc.isShowPassSubject,
                  bloc.isShowRePassSubject,
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
                    CustomTextField(
                      controller: bloc.emailController,
                      hintText: 'Nhập Email',
                      keyBroadType: TextInputType.emailAddress,
                    ),
                    Container(
                      padding: EdgeInsetsConstants.left8,
                      width: width * 0.75,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        bloc.errorCheckTextSubject.value,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ),
                    SizedBoxConstants.h8,
                    CustomTextField(
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
                      width: width * 0.75,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        bloc.errorCheckPassSubject.value,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ),
                    SizedBoxConstants.h12,
                    CustomTextField(
                      controller: bloc.rePassController,
                      hintText: 'Xác nhận mật khẩu',
                      isObsText: !bloc.isShowRePassSubject.value,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          bloc.showPassRe();
                        },
                        child: bloc.isShowRePassSubject.value
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
                      width: width * 0.75,
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
                        return CustomTextField(
                          controller: bloc.oTPController,
                          hintText: 'Nhập mã xác minh',
                          suffixIcon: Container(
                            width: 90,
                            margin: EdgeInsetsConstants.left8 +
                                EdgeInsetsConstants.right8,
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                if (!bloc.isTapSendSubject.value) {
                                  bloc.sendOTPEmail();
                                }
                              },
                              child: Text(
                                bloc.isTapSendSubject.value
                                    ? '${bloc.countSubject.value}'
                                    : 'Gửi mã',
                                style: const TextStyle(
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
                      width: width * 0.75,
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
                            width: width * 0.75,
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
                                      bloc.onTapRegEmail();
                                    }
                                  : null,
                              child: const Text(
                                'Đăng ký',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
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
                          bloc.onTapLoginByGoogle();
                        },
                        child: Container(
                          width: width * 0.75,
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
          ),
        );
      },
    );
  }
}
