import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/constants/colors.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(BlocProvider.login);
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Center(
        child: TextButton(
          child: const Text('Login google'),
          onPressed: () => bloc.onTapLoginByGoogle(),
        ),
      ),
    );
  }
}
