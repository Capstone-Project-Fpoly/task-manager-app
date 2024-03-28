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
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class LoginWithOtherEmailScreen extends ConsumerWidget {
  const LoginWithOtherEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.loginWithOtherEmail);
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
                  bloc.isPassSubject,
                  bloc.isShowPassSubject,
                  bloc.errorCheckTextSubject,
                  bloc.errorCheckPassSubject,
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
                            style: AppTextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBoxConstants.h32,
                    const Text('Đăng nhập để tiếp tục'),
                    SizedBoxConstants.h40,
                    CustomTextField(
                      controller: bloc.emailController,
                      hintText: 'Nhập Email',
                      keyBroadType: TextInputType.emailAddress,
                    ),
                    SizedBoxConstants.h4,
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        bloc.errorCheckTextSubject.value,
                        style:
                            const AppTextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ),
                    SizedBoxConstants.h12,
                    if (bloc.isPassSubject.value)
                      CustomTextField(
                        autoFocus: true,
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
                    SizedBoxConstants.h4,
                    if (bloc.isPassSubject.value)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          bloc.errorCheckPassSubject.value,
                          style: const AppTextStyle(
                              fontSize: 12, color: Colors.red),
                        ),
                      ),
                    SizedBoxConstants.h20,
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorConstants.backgroundColorApp,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            bloc.loginEmail();
                          },
                          child: const Text(
                            'Đăng nhập',
                            style:
                                AppTextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
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
                          width: MediaQuery.of(context).size.width * 0.75,
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
