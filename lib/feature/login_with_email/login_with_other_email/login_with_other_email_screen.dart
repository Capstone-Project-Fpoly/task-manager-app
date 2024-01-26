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

class LoginWithOtherEmailScreen extends ConsumerWidget {
  LoginWithOtherEmailScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.loginWithOtherEmail);
    final blocLogin = ref.watch(BlocProvider.login);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: ObsBuilder(
          streams: [bloc.isPassSubject,bloc.isShowPassSubject],
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
              const Text('Đăng nhập để tiếp tục'),
              SizedBoxConstants.h40,
              CusstomTextField(
                controller: emailController,
                hintText: 'Nhập Email',
                keyBroadType: TextInputType.emailAddress,
              ),
              SizedBoxConstants.h12,
              if(bloc.isPassSubject.value)CusstomTextField(
                controller: passController,
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
              SizedBoxConstants.h20,
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
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
                    onPressed: (){
                      bloc.showTextFieldPass(emailController.text);
                      if(passController.text != ''){
                        // bloc.loginEmail(email: emailController.text, password: passController.text);
                        bloc.loginEmailFinish();
                      }
                    },
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 15, color: Colors.white),
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
                        GoogleIcon(width: 20,),
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
