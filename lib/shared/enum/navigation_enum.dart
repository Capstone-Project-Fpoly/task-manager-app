import 'package:task_manager/base/dependency/router/utils/route_name.dart';

enum NavigationEnum {
  broad(route: RouteName.board),
  myBroad(route: RouteName.myBoard),
  myCard(route: RouteName.myCard),
  help(route: RouteName.help);

  const NavigationEnum({required this.route});
  final String route;
}
