import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';

class LoginWithEmailScreen extends ConsumerWidget {
  const LoginWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.loginWithEmail);
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () => bloc.loginEmail(
            email: 'hlndzzkum@gmail.com',
            password: '123456',
          ),
          child: const Text('Đây là màn hình email'),
        ),
      ),
    );
  }
}
