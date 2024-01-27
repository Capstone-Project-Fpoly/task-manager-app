import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/feature/board/board_Bloc.dart';
import 'package:task_manager/feature/login/login_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_bloc.dart';
import 'package:task_manager/feature/reg_with_email/reg_with_email_bloc.dart';
import 'package:task_manager/shared/bloc/app_bloc.dart';

class BlocProvider {
  static final app = Provider((ref) => AppBloc(ref));
  static late AutoDisposeProvider<LoginBloc> login;
  static late AutoDisposeProvider<LoginWithEmailBloc> loginWithEmail;
  static late AutoDisposeProvider<LoginWithOtherEmailBloc> loginWithOtherEmail;
  static late AutoDisposeProvider<RegEmailBloc> regWithEmail;
  static late AutoDisposeProvider<BoardBloc> board;

  BlocProvider._();
}
