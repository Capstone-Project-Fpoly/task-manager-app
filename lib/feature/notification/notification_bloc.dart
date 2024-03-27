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
    boardBloc.getBoard();
  }

  void onTapOption({required NotificationOptionsEnum option}) {
    selectedOptionSubject.value = option;

    if (option == NotificationOptionsEnum.card) {
      notificationListSubject.value = notificationListCardSubject.value;
      noSeenNotificationListSubject.value = notificationListCardSubject.value
          .where((element) => element?.is_seen == false)
          .toList();
    }else if(option == NotificationOptionsEnum.comment){
      notificationListSubject.value = notificationListCommentSubject.value;
      noSeenNotificationListSubject.value = notificationListCommentSubject.value
          .where((element) => element?.is_seen == false)
          .toList();
    }else if(option == NotificationOptionsEnum.invite){
      notificationListSubject.value = notificationListInviteSubject.value;
      noSeenNotificationListSubject.value = notificationListInviteSubject.value
          .where((element) => element?.is_seen == false)
          .toList();
    }else{
      notificationListSubject.value = notificationListAllSubject.value;
      noSeenNotificationListSubject.value = notificationListAllSubject.value
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
    final list = notificationListSubject.value;
    notificationListAllSubject.value = list;
    final result1 = list
        .where((element) => element?.topic.toString().contains('Enum\$TopicNotification.Card') ?? false,)
        .toList();
    notificationListCardSubject.value = result1;
    final result2 = list
        .where((element) => element?.topic.toString().contains('Enum\$TopicNotification.Comment') ?? false,)
        .toList();
    notificationListCommentSubject.value = result2;
    final result3 = list
        .where((element) => element?.topic.toString().contains('Enum\$TopicNotification.InviteUserToBoard') ?? false,)
        .toList();
    notificationListInviteSubject.value = result3;
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
    for(var i=0;i<=boardBloc.listBoardSubject.value.length;i++){
      if(boardBloc.listBoardSubject.value[i]?.id == notification?.idBoard){
        board = boardBloc.listBoardSubject.value[i];
        break;
      }
    }

    if(notification?.topic.toString() =='Enum\$TopicNotification.RemoveUserFromBoard')return;
    if(notification?.topic.toString() =='Enum\$TopicNotification.Card'||notification?.topic.toString() =='Enum\$TopicNotification.Comment'||notification?.topic.toString() =='Enum\$TopicNotification.CheckList'){
      idCard = notification?.data;
      if (idCard == null || idCard.isEmpty) return;
      final detailCardArgument = DetailCardArgument(
        idCard: idCard,
        idBoard: board?.id??'',
      );
      await routerService.push(
        RouteInput.detailCard(
          detailCardArgument: detailCardArgument,
        ),
      );
    }else{
      if (board == null) return;
      routerService.push(RouteInput.boardDetail(boardFragment: board));
    }
    if (isSeen) return;
    seenLocalNotification(notification?.id??'');
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
