import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/feature/login/login_bloc.dart';
import 'package:task_manager/shared/bloc/app_bloc.dart';

class BlocProvider {
  static final app = Provider((ref) => AppBloc(ref));
  static late AutoDisposeProvider<LoginBloc> login;

  BlocProvider._();
}
