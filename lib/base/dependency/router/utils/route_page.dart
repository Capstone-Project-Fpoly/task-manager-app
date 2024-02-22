import 'package:flutter/material.dart';
import 'package:task_manager/base/dependency/router/utils/route_name.dart';
import 'package:task_manager/base/dependency/router/utils/route_screen.dart';

class RoutePage {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.root:
        return RouteScreen.rootPageRoute(settings);
      case RouteName.login:
        return RouteScreen.loginPageRoute(settings);
      case RouteName.loginEmail:
        return RouteScreen.loginEmailPageRoute(settings);
      case RouteName.loginOtherEmail:
        return RouteScreen.loginOtherEmailPageRoute(settings);
      case RouteName.regEmail:
        return RouteScreen.regEmailPageRoute(settings);
      case RouteName.dragAndDrop:
        return RouteScreen.dragAndDropRoute(settings);
      case RouteName.addBoard:
        return RouteScreen.addBoard(settings);
      case RouteName.addCard:
        return RouteScreen.addCard(settings);
      case RouteName.backgroundBoard:
        return RouteScreen.backgroundBoardRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateBoardTab(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.board:
        return RouteScreen.boardPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateMyBoardTab(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.myBoard:
        return RouteScreen.myBoardPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateMyCardTab(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.myCard:
        return RouteScreen.myCardPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateSettingTab(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.setting:
        return RouteScreen.settingPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateHelpTab(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.help:
        return RouteScreen.helpPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }
}
