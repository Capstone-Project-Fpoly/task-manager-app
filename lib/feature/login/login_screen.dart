import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/login/login_bloc.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/widgets/icons/google_icon.dart';
import 'package:task_manager/shared/widgets/icons/mail_icon.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void showActionSheet(BuildContext context, bool checkLogin, LoginBloc bloc) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              bloc.onTapBack();
              if(checkLogin) {
                bloc.onTapLoginEmail();
              } else {
                bloc.onTapRegEmail();
              }
            },
            child: Padding(
              padding: EdgeInsetsConstants.left8,
              child: _buttomLoginItem(
                "${checkLogin ? "Đăng nhập" : "Đăng ký"} bằng email",
                const MailIcon(width: 20),
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              bloc.onTapBack();
              bloc.onTapLoginByGoogle();
            },
            child: Padding(
              padding: EdgeInsetsConstants.left8,
              child: _buttomLoginItem(
                'Tiếp tục với Google',
                const GoogleIcon(
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buttomLoginItem(String lable, Widget icon) {
    return Row(
      children: [
        icon,
        SizedBoxConstants.w20,
        Text(
          lable,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(BlocProvider.login);
    bloc.context = context;
    const styles = TextStyle(
      fontSize: 12, color: Colors.white,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white, // Màu của gạch chân
      decorationThickness: 2.0, // Độ dày của gạch chân
      decorationStyle: TextDecorationStyle.solid,
    ); // Use for text with click events
    return ObsBuilder(
      streams: [bloc.isLoadingSubject],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: Scaffold(
            backgroundColor: ColorConstants.white,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_sc_login.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsetsConstants.left20 +
                          EdgeInsetsConstants.right20,
                      child: const Text(
                        'Đưa tinh thần đồng đội tiến về phía trước - ngay cả khi đang di chuyển',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      margin: const EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () => showActionSheet(context, true, bloc),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(49, 101, 226, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBoxConstants.h12,
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () => showActionSheet(context, false, bloc),
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBoxConstants.h20,
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Khi đăng ký, bạn đồng ý với',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Thông báo người dùng',
                              style: styles,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' và  ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            Text(
                              'Chính sách',
                              style: styles,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBoxConstants.h8,
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Bạn không đăng nhập hoặc đăng ký được?',
                        style: styles,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBoxConstants.h12,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
