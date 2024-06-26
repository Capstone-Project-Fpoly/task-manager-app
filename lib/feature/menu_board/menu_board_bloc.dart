import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/notification_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';
import 'package:task_manager/graphql/queries/notification/notification_collection.graphql.dart';

class MenuBoardBloc extends BlocBase {
  final Ref ref;

  // final Fragment$BoardFragment currentBoardSubject.value;
  late final toastService = ref.watch(AppService.toast);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final boardDetailBloc = ref.read(BlocProvider.boardDetail);
  late final appBloc = ref.watch(BlocProvider.app);
  late final graphQLService = ref.watch(AppService.graphQL);
  final notificationListSubject =
      BehaviorSubject<List<Fragment$NotificationFragment?>>.seeded([]);

  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final listMemberSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);
  final currentBoardSubject =
      BehaviorSubject<Fragment$BoardFragment?>.seeded(null);
  MenuBoardBloc(this.ref) {
    init();
  }

  @override
  void dispose() {
    super.dispose();
    isLoadingSubject.close();
    listMemberSubject.close();
    currentBoardSubject.close();
    notificationListSubject.close();
  }

  Future<void> init() async {
    isLoadingSubject.value = true;
    currentBoardSubject.value = boardDetailBloc.currentBoardSubject.value;
    await memberBoard();
    await fetchNotification();
  }

  Future<void> onTapSettingBoard() async {
    final user = appBloc.userSubject.value;
    if (!checkAdminOfBoard(user)) {
      toastService.showText(message: 'Bạn không phải quản trị viên');
      return;
    }
    final result = await routerService.push(RouteInput.settingBoard());
    if (result == null) return;
    currentBoardSubject.value = result as Fragment$BoardFragment;
    boardDetailBloc.currentBoardSubject.value = result;
  }

  Future<void> fetchNotification() async {
    isLoadingSubject.value = true;
    final result = await graphQLService.client.query$NotificationCollection(
      Options$Query$NotificationCollection(
        variables: Variables$Query$NotificationCollection(
          idBoard: boardDetailBloc.currentBoardSubject.value.id,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) return;
    notificationListSubject.value =
        result.parsedData?.notificationCollection ?? [];
  }

  void onTapBack() {
    routerService.pop();
  }

  void onTapInviteMember() {
    if (!checkAdminOfBoard(appBloc.userSubject.value)) {
      toastService.showText(message: 'Bạn không phải quản trị viên');
      return;
    }
    if (currentBoardSubject.value?.isPublic == false) {
      toastService.showText(message: 'Bảng không cho phép tham gia');
      return;
    }
    routerService.push(RouteInput.inviteMember());
  }

  bool checkAdminOfBoard(Fragment$UserFragment? user) {
    final board = currentBoardSubject.value;
    if (user?.uid == board?.ownerUser?.uid) return true;
    return false;
  }

  Future<void> memberBoard() async {
    final result = await graphqlService.client.query$GetUserOfBoard(
      Options$Query$GetUserOfBoard(
        variables: Variables$Query$GetUserOfBoard(
          idBoard: boardDetailBloc.currentBoardSubject.value.id,
          query: null,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) return;
    listMemberSubject.value = result.parsedData?.getUsersOfBoard ?? [];
  }
}
