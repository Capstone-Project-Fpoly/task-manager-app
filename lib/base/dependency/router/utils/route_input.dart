import 'package:task_manager/base/dependency/router/utils/route_name.dart';

class RouteInput {
  String routeName;
  Object? arguments;

  RouteInput.login() : routeName = RouteName.login;
  RouteInput.root() : routeName = RouteName.root;
}
