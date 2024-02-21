import 'package:task_manager/base/dependency/router/utils/route_name.dart';

class RouteInput {
  String routeName;
  Object? arguments;

  RouteInput.login() : routeName = RouteName.login;
  RouteInput.root() : routeName = RouteName.root;
  RouteInput.loginEmail() : routeName = RouteName.loginEmail;
  RouteInput.loginOtherEmail() : routeName = RouteName.loginOtherEmail;
  RouteInput.regEmail() : routeName = RouteName.regEmail;
  RouteInput.dragAndDrop(String idBoard)
      : routeName = RouteName.dragAndDrop,
        arguments = idBoard;
  RouteInput.addBoard() : routeName = RouteName.addBoard;
  RouteInput.addCard() : routeName = RouteName.addCard;
  RouteInput.backgroundBoard() : routeName = RouteName.backgroundBoard;
}
