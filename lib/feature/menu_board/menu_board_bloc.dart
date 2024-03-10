import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';

class MenuBoardBloc extends BlocBase {
  final Ref ref;

  final Fragment$BoardFragment boardFragment;
  late final toastService = ref.watch(AppService.toast);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final boardBloc = ref.read(BlocProvider.boardDetail);

  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final listMemberSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);

  MenuBoardBloc(this.ref, {required this.boardFragment}) {
    init();
  }

  @override
  void dispose() {
    super.dispose();
    isLoadingSubject.close();
    listMemberSubject.close();
  }

  Future<void> init() async {
    isLoadingSubject.value = true;
    await memberBoard();
  }

  void onTapSettingBoard() {
    routerService.push(RouteInput.settingBoard());
  }

  void onTapBack() {
    routerService.pop();
  }

  void onTapInviteMember() {
    routerService.push(RouteInput.inviteMember());
  }

  bool checkAdminOfBoard(Fragment$UserFragment user) {
    final board = boardBloc.boardFragment;
    if (user == board.ownerUser) return true;
    return false;
  }

  Future<void> memberBoard() async {
    final result = await graphqlService.client.query$GetUserOfBoard(
      Options$Query$GetUserOfBoard(
        variables: Variables$Query$GetUserOfBoard(
          idBoard: boardFragment.id,
          query: null,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) return;
    listMemberSubject.value = result.parsedData?.getUsersOfBoard ?? [];
  }
}
