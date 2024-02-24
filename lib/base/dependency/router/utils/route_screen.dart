import 'package:flutter/material.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/feature/add_board/add_board_bloc.dart';
import 'package:task_manager/feature/add_board/add_board_screen.dart';
import 'package:task_manager/feature/add_board/widget/background_widget/background_board_bloc.dart';
import 'package:task_manager/feature/add_board/widget/background_widget/background_board_widget.dart';
import 'package:task_manager/feature/add_card/add_card_bloc.dart';
import 'package:task_manager/feature/add_card/add_card_screen.dart';
import 'package:task_manager/feature/board/board_bloc.dart';
import 'package:task_manager/feature/board/board_screen.dart';
import 'package:task_manager/feature/board_detail/board_detail_screen.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/feature/help/help_screen.dart';
import 'package:task_manager/feature/login/login_bloc.dart';
import 'package:task_manager/feature/login/login_screen.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_screen.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_screen.dart';
import 'package:task_manager/feature/my_board/my_board_screen.dart';
import 'package:task_manager/feature/my_board/my_board_bloc.dart';
import 'package:task_manager/feature/my_card/my_card_screen.dart';
import 'package:task_manager/feature/reg_with_email/reg_with_email_bloc.dart';
import 'package:task_manager/feature/reg_with_email/reg_with_email_screen.dart';
import 'package:task_manager/feature/root/root_screen.dart';
import 'package:task_manager/feature/setting/setting_screen.dart';
import 'package:task_manager/feature/unknown/unknown_screen.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';

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
    BlocProvider.myBoard = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => MyBoardBloc(ref),
    );
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
    BlocProvider.loginWithEmail = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => LoginWithEmailBloc(ref),
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
      builder: (_) => const LoginWithOtherEmailScreen(),
    );
  }

  static PageRoute regEmailPageRoute(RouteSettings settings) {
    BlocProvider.regWithEmail = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => RegEmailBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const RegEmailScreen(),
    );
  }

  static PageRoute boardDetailRoute(RouteSettings settings) {
    final boardFragment = settings.arguments as Fragment$BoardFragment;
    BlocProvider.boardDetail = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => BoardDetailBloc(ref, boardFragment: boardFragment),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const BoardDetailScreen(),
    );
  }

  static PageRoute addBoard(RouteSettings settings) {
    // final id = settings.arguments as String;
    BlocProvider.addBoard = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => AddBoardBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const AddBoardScreen(),
    );
  }

  static PageRoute addCard(RouteSettings settings) {
    // final id = settings.arguments as String;
    BlocProvider.addCard = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => AddCardBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const AddCardScreen(),
    );
  }

  static PageRoute backgroundBoardRoute(RouteSettings settings) {
    // final id = settings.arguments as String;
    BlocProvider.backgroundBoardBloc = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => BackgroundBoardBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const BackgroundBoardWidget(),
    );
  }
}
