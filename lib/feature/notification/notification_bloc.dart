import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/arguments/detail_card_argument.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/feature/notification/enum/notification_options.dart';
import 'package:task_manager/feature/notification/widget/notification_option_bottom_sheet.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/accept_invite_user_to_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/notification/seen_notification.graphql.dart';
import 'package:task_manager/graphql/queries/notification/notification_collection.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

class NotificationBloc extends BlocBase {
  final Ref ref;
  final String? idBoard;
  late final routerService = ref.watch(AppService.router);
  late final graphQLService = ref.watch(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final boardBloc = ref.read(BlocProvider.board);
  late final boardDetailBloc = ref.read(BlocProvider.boardDetail);

  final selectedOptionSubject = BehaviorSubject<NotificationOptionsEnum>.seeded(
    NotificationOptionsEnum.all,
  );

  final isNoSeenSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final notificationListSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);
  final noSeenNotificationListSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);

  final notificationListCurrentSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);
  final notificationListCardSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);
  final notificationListCommentSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);
  final notificationListInviteSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);
  final notificationListAllSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);
  @override
  void dispose() {
    selectedOptionSubject.close();
    isNoSeenSubject.close();
    isLoadingSubject.close();
    notificationListSubject.close();
    noSeenNotificationListSubject.close();
    notificationListCardSubject.close();
    notificationListCommentSubject.close();
    notificationListInviteSubject.close();
    notificationListAllSubject.close();
    notificationListCurrentSubject.close();
    super.dispose();
  }

  void onTapChangeSeen() {
    isNoSeenSubject.value = !isNoSeenSubject.value;
  }

  void init() {
    fetchNotification();
  }

  Future<void> onBackToBoardScreen() async {
    routerService.pop();
  }

  void onTapOption({required NotificationOptionsEnum option}) {
    selectedOptionSubject.value = option;
    switch (option) {
      case NotificationOptionsEnum.card:
        notificationListSubject.value = notificationListCurrentSubject.value;
        notificationListSubject.value = notificationListSubject.value
            .where(
              (element) => element?.topic == Enum$TopicNotification.Card,
            )
            .toList();
        noSeenNotificationListSubject.value = notificationListSubject.value
            .where((element) => element?.is_seen == false)
            .toList();
        break;
      case NotificationOptionsEnum.comment:
        notificationListSubject.value = notificationListCurrentSubject.value;
        notificationListSubject.value = notificationListSubject.value
            .where(
              (element) => element?.topic == Enum$TopicNotification.Comment,
            )
            .toList();
        noSeenNotificationListSubject.value = notificationListSubject.value
            .where((element) => element?.is_seen == false)
            .toList();
      case NotificationOptionsEnum.invite:
        notificationListSubject.value = notificationListCurrentSubject.value;
        notificationListSubject.value = notificationListSubject.value
            .where(
              (element) =>
                  element?.topic == Enum$TopicNotification.InviteUserToBoard,
            )
            .toList();
        noSeenNotificationListSubject.value = notificationListSubject.value
            .where((element) => element?.is_seen == false)
            .toList();
      default:
        notificationListSubject.value = notificationListCurrentSubject.value;
        noSeenNotificationListSubject.value = notificationListSubject.value
            .where((element) => element?.is_seen == false)
            .toList();
    }
    routerService.pop();
  }

  Future<void> showOptionBottomSheet({
    required BuildContext context,
  }) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const OptionBottomSheet();
      },
    );
  }

  NotificationBloc({required this.ref, this.idBoard}) {
    init();
  }

  Future<void> fetchNotification() async {
    isLoadingSubject.value = true;
    final result = await graphQLService.client.query$NotificationCollection(
      Options$Query$NotificationCollection(
        variables: Variables$Query$NotificationCollection(
          idBoard: idBoard,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) return;
    notificationListSubject.value =
        result.parsedData?.notificationCollection ?? [];
    noSeenNotificationListSubject.value = notificationListSubject.value
        .where((element) => element?.is_seen == false)
        .toList();
    notificationListCurrentSubject.value = notificationListSubject.value;
  }

  void seenLocalNotification(String idNotification) {
    final listTemp = notificationListSubject.value;
    final noSeenListTemp = noSeenNotificationListSubject.value;
    for (var i = 0; i < listTemp.length; i++) {
      final notification = listTemp[i];
      if (notification == null) continue;
      if (notification.id == idNotification) {
        noSeenListTemp.removeWhere((element) => element?.id == idNotification);
        listTemp[i] = notification.copyWith(is_seen: true);
        seenNotification(idNotification);
        break;
      }
    }
    noSeenNotificationListSubject.value = noSeenListTemp;
    notificationListSubject.value = listTemp;
  }

  Future<void> onTapNotificationItem({
    required Fragment$NotificationFragment? notification,
    required bool isSeen,
  }) async {
    if (notification?.id == null) return;
    //hàm next hàm hình
    Fragment$BoardFragment? board;
    String? idCard;
    for (var i = 0; i <= boardBloc.listBoardSubject.value.length; i++) {
      if (boardBloc.listBoardSubject.value[i]?.id == notification?.idBoard) {
        board = boardBloc.listBoardSubject.value[i];
        break;
      }
    }

    if (notification?.topic == Enum$TopicNotification.InviteUserToBoard) return;
    if (notification?.topic == Enum$TopicNotification.Card ||
        notification?.topic == Enum$TopicNotification.Comment ||
        notification?.topic == Enum$TopicNotification.CheckList) {
      idCard = notification?.data;
      if (idCard == null || idCard.isEmpty) return;
      final detailCardArgument = DetailCardArgument(
        idCard: idCard,
        idBoard: board?.id ?? '',
      );
      await routerService.push(
        RouteInput.detailCard(
          detailCardArgument: detailCardArgument,
        ),
      );
    } else {
      if (board == null) return;
      routerService.push(RouteInput.boardDetail(boardFragment: board));
    }
    if (isSeen) return;
    seenLocalNotification(notification?.id ?? '');
  }

  Future<void> seenNotification(String idNotification) async {
    final result = await graphQLService.client.mutate$SeenNotification(
      Options$Mutation$SeenNotification(
        variables: Variables$Mutation$SeenNotification(
          idNotification: idNotification,
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(
        message:
            result.exception?.graphqlErrors.first.message ?? 'Có lỗi xảy ra',
      );
      fetchNotification();
      return;
    }
  }

  Future<void> onTapAcceptInviteToBoard({
    required String? idNotification,
    required String? idBoard,
  }) async {
    if (idNotification == null || idBoard == null) return;
    final result = await graphQLService.client.mutate$AcceptInviteUserBoard(
      Options$Mutation$AcceptInviteUserBoard(
        variables: Variables$Mutation$AcceptInviteUserBoard(
          idNotification: idNotification,
          idBoard: idBoard,
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(
        message:
            result.exception?.graphqlErrors.first.message ?? 'Có lỗi xảy ra',
      );
      return;
    }
    final listTemp = notificationListSubject.value;
    listTemp.removeWhere((element) => element?.id == idNotification);
    notificationListSubject.value = listTemp;
  }
}
