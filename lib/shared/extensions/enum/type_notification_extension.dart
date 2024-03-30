import 'package:flutter/material.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/schema.graphql.dart';

extension TypeNotificationExtension on Enum$TopicNotification {
  RouteInput? getRouteInput({required dynamic data}) {
    switch (this) {
      case Enum$TopicNotification.Board:
        return RouteInput.boardDetail(boardFragment: data);
      case Enum$TopicNotification.Card:
      // TODO: Handle this case.
      case Enum$TopicNotification.CheckList:
      // TODO: Handle this case.
      case Enum$TopicNotification.Comment:
      // TODO: Handle this case.
      case Enum$TopicNotification.InviteUserToBoard:
        return RouteInput.boardDetail(boardFragment: data);
      case Enum$TopicNotification.$List:
        return RouteInput.boardDetail(boardFragment: data);
      case Enum$TopicNotification.$unknown:
        return null;
      default:
        return RouteInput.boardDetail(boardFragment: data);
    }
  }

  Icon get getIcon {
    switch (this) {
      case Enum$TopicNotification.Board:
        return const Icon(
          Icons.dashboard,
          color: Colors.black,
          size: 25,
        );
      case Enum$TopicNotification.Card:
        return const Icon(
          Icons.credit_card_outlined,
          color: Colors.black,
          size: 25,
        );
      case Enum$TopicNotification.CheckList:
        return const Icon(
          Icons.check_box_outlined,
          color: Colors.black,
          size: 25,
        );
      case Enum$TopicNotification.Comment:
        return const Icon(
          Icons.comment,
          color: Colors.black,
          size: 25,
        );
      case Enum$TopicNotification.InviteUserToBoard:
        return const Icon(
          Icons.person_add_outlined,
          color: Colors.black,
          size: 25,
        );
      case Enum$TopicNotification.$List:
        return const Icon(
          Icons.list_alt_outlined,
          color: Colors.black,
          size: 25,
        );
      case Enum$TopicNotification.$unknown:
        return const Icon(
          Icons.notifications_active_sharp,
          color: Colors.black,
          size: 25,
        );
      default:
        return const Icon(
          Icons.notifications_active_sharp,
          color: Colors.black,
          size: 25,
        );
    }
  }
}
