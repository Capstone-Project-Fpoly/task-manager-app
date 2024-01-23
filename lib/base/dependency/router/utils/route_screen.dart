import 'package:flutter/material.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/feature/board/board_Bloc.dart';
import 'package:task_manager/feature/board/board_screen.dart';
import 'package:task_manager/feature/help/help_screen.dart';
import 'package:task_manager/feature/login/login_bloc.dart';
import 'package:task_manager/feature/login/login_screen.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_screen.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_screen.dart';
import 'package:task_manager/feature/my_board/my_board_screen.dart';
import 'package:task_manager/feature/my_card/my_card_screen.dart';
import 'package:task_manager/feature/root/root_screen.dart';
import 'package:task_manager/feature/setting/setting_screen.dart';
import 'package:task_manager/feature/unknown/unknown_screen.dart';

class RouteScreen {
  static PageRoute unknownPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const UnknownScreen(),
    );
  }

  static PageRoute rootPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const RootScreen(),
    );
  }

  static PageRoute boardPageRoute(RouteSettings settings) {
    BlocProvider.board = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => BoardBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const BoardScreen(),
    );
  }

  static PageRoute myBoardPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const MyBoardScreen(),
    );
  }

  static PageRoute myCardPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const MyCradScreen(),
    );
  }

  static PageRoute settingPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SettingScreen(),
    );
  }

  static PageRoute helpPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const HelpScreen(),
    );
  }

  static PageRoute loginPageRoute(RouteSettings settings) {
    BlocProvider.login = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => LoginBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LoginScreen(),
    );
  }

  static PageRoute loginEmailPageRoute(RouteSettings settings) {
    final isLogin = settings.arguments as bool;
    BlocProvider.loginWithEmail = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => LoginWithEmailBloc(ref, isLogin),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LoginWithEmailScreen(),
    );
  }

  static PageRoute loginOtherEmailPageRoute(RouteSettings settings) {
    BlocProvider.loginWithOtherEmail = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => LoginWithOtherEmailBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => LoginWithOtherEmailScreen(),
    );
  }
}
