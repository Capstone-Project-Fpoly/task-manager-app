import 'package:task_manager/base/dependency/router/utils/route_name.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';

class RouteInput {
  String routeName;
  Object? arguments;

  RouteInput.login() : routeName = RouteName.login;
  RouteInput.root() : routeName = RouteName.root;
  RouteInput.loginEmail() : routeName = RouteName.loginEmail;
  RouteInput.loginOtherEmail() : routeName = RouteName.loginOtherEmail;
  RouteInput.regEmail() : routeName = RouteName.regEmail;
  RouteInput.boardDetail({required Fragment$BoardFragment boardFragment})
      : routeName = RouteName.boardDetail,
        arguments = boardFragment;
  RouteInput.addBoard() : routeName = RouteName.addBoard;
  RouteInput.addCard() : routeName = RouteName.addCard;
  RouteInput.backgroundBoard() : routeName = RouteName.backgroundBoard;
  RouteInput.detailCard() : routeName = RouteName.detailCard;
}
