import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/feature/add_board/add_board_bloc.dart';
import 'package:task_manager/feature/add_card/add_card_bloc.dart';
import 'package:task_manager/feature/background_board/background_board_bloc.dart';
import 'package:task_manager/feature/board/board_bloc.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/feature/invite_member/invite_member_bloc.dart';
import 'package:task_manager/feature/login/login_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_bloc.dart';
import 'package:task_manager/feature/menu_board/menu_board_bloc.dart';
import 'package:task_manager/feature/my_board/my_board_bloc.dart';
import 'package:task_manager/feature/notification/notification_bloc.dart';
import 'package:task_manager/feature/reg_with_email/reg_with_email_bloc.dart';
import 'package:task_manager/feature/setting_board/setting_board_bloc.dart';
import 'package:task_manager/shared/bloc/app_bloc.dart';

class BlocProvider {
  static final app = Provider((ref) => AppBloc(ref));
  static late AutoDisposeProvider<LoginBloc> login;
  static late AutoDisposeProvider<LoginWithEmailBloc> loginWithEmail;
  static late AutoDisposeProvider<LoginWithOtherEmailBloc> loginWithOtherEmail;
  static late AutoDisposeProvider<RegEmailBloc> regWithEmail;
  static late AutoDisposeProvider<BoardBloc> board;
  static late AutoDisposeProvider<MyBoardBloc> myBoard;
  static late AutoDisposeProvider<BoardDetailBloc> boardDetail;
  static late AutoDisposeProvider<AddBoardBloc> addBoard;
  static late AutoDisposeProvider<AddCardBloc> addCard;
  static late AutoDisposeProvider<InviteMemberBloc> inviteMember;
  static late AutoDisposeProvider<BackgroundBoardBloc> backgroundBoardBloc;
  static late AutoDisposeProvider<MenuBoardBloc> menuBoardBloc;
  static late AutoDisposeProvider<SettingBoardBloc> settingBoardBloc;
  static late AutoDisposeProvider<NotificationBloc> notificationBloc;

  BlocProvider._();
}
