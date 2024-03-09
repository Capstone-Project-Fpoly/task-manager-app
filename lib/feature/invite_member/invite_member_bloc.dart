import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/feature/invite_member/widget/show_dialog_edit_member_of_board.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/invite_user_to_board.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/remove_user_from_board.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_invite_to_board.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';

class InviteMemberBloc extends BlocBase {
  final Ref ref;

  InviteMemberBloc(this.ref) {
    init();
  }

  final searchController = TextEditingController();
  final isSearchUsersSubject = BehaviorSubject<bool>.seeded(false);
  final nameBoardSubject = BehaviorSubject<String>.seeded('');
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingRemoveSubject = BehaviorSubject<bool>.seeded(false);
  final isSetAdminForMemberSubject = BehaviorSubject<bool>.seeded(false);
  final isSearchSubject = BehaviorSubject<bool>.seeded(false);

  final focusNode = FocusNode();
  final listMemberSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);
  final listSearchInviteUsersSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);
  final listInviteUsersSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);

  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final boardBloc = ref.read(BlocProvider.boardDetail);
  late final menuBoardBloc = ref.read(BlocProvider.menuBoardBloc);
  late final appBloc = ref.read(BlocProvider.app);
  late Timer debounceTimer;
  late Fragment$UserFragment currentUser;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    isSearchUsersSubject.close();
    listMemberSubject.close();
    listSearchInviteUsersSubject.close();
    isLoadingSubject.close();
    isLoadingRemoveSubject.close();
    isSearchSubject.close();
    listInviteUsersSubject.close();
    nameBoardSubject.close();
    isSetAdminForMemberSubject.close();
  }

  Future<void> init() async {
    currentUser = (await appBloc.getCurrentUser())!;
    await memberBoard();
    debounceTimer = Timer(const Duration(milliseconds: 500), () {});
  }

  void onSearchTextChanged(String query) {
    debounceTimer.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 500), () {
      searchUser(query);
    });
  }

  void onTapFocus() {
    isSearchUsersSubject.value = true;
  }

  void onTapCancelSearch() {
    focusNode.unfocus();
    isSearchUsersSubject.value = false;
    listSearchInviteUsersSubject.value.clear();
    listInviteUsersSubject.value.clear();
    searchController.text = '';
  }

  void back() {
    routerService.pop();
    menuBoardBloc.memberBoard();
  }

  void addMemberToList(Fragment$UserFragment user) {
    final listMember = listInviteUsersSubject.value;
    if (listMember.contains(user)) {
      listMember.remove(user);
    } else {
      listMember.add(user);
    }
    listInviteUsersSubject.value = listMember;
  }

  void inviteMembersToBoard() async {
    final board = boardBloc.boardFragment;
    focusNode.unfocus();
    if (listMemberSubject.value.isEmpty) return;
    final listUserId =
        listInviteUsersSubject.value.map((e) => e?.uid ?? '').toList();
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$InviteUserBoard(
      Options$Mutation$InviteUserBoard(
        variables: Variables$Mutation$InviteUserBoard(
          idBoard: board.id,
          idUsers: listUserId,
        ),
      ),
    );

    isSearchUsersSubject.value = false;
    listInviteUsersSubject.value.clear();
    listSearchInviteUsersSubject.value.clear();
    searchController.text = '';
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors.first.message ??
            'Lỗi. Không thể mời thành viên',
      );
      return;
    }
    if (result.parsedData == null) return;
  }

  Future<void> searchUser(String query) async {
    isSearchSubject.value = true;
    final board = boardBloc.boardFragment;
    final result = await graphqlService.client.query$getUsersInviteToBoard(
      Options$Query$getUsersInviteToBoard(
        variables: Variables$Query$getUsersInviteToBoard(
          idBoard: board.id,
          query: query,
        ),
      ),
    );
    if (result.hasException) return;
    if (result.parsedData == null) return;
    listSearchInviteUsersSubject.value =
        result.parsedData!.getUsersInviteToBoard!;
    isSearchSubject.value = false;
  }

  Future<void> memberBoard() async {
    isLoadingSubject.value = true;
    final board = boardBloc.boardFragment;
    nameBoardSubject.value = board.title!;
    final result = await searchMemberBoard(null);
    isLoadingSubject.value = false;
    if (result.hasException) return;
    listMemberSubject.value = result.parsedData?.getUsersOfBoard ?? [];
  }

  Future<QueryResult<Query$GetUserOfBoard>> searchMemberBoard(
    String? query,
  ) async {
    final board = boardBloc.boardFragment;
    final result = await graphqlService.client.query$GetUserOfBoard(
      Options$Query$GetUserOfBoard(
        variables:
            Variables$Query$GetUserOfBoard(idBoard: board.id, query: query),
      ),
    );
    return result;
  }

  String getUserPermissions(Fragment$UserFragment user) {
    if (checkAdminOfBoard(user)) return 'Quản trị viên';
    return 'Thành viên';
  }

  bool checkAdminOfBoard(Fragment$UserFragment user) {
    final board = boardBloc.boardFragment;
    if (user == board.ownerUser) return true;
    return false;
  }

  Future<void> onTapEditMemberOfBoard({
    required final context,
    required Fragment$UserFragment user,
  }) async {
    isSetAdminForMemberSubject.value = checkAdminOfBoard(user);
    final check = checkAdminOfBoard(currentUser);
    if (check) {
      showDialog(
        context: context,
        builder: (context) {
          return DialogEditMemberOfBoard(
            user: user,
          );
        },
      );
    }
  }

  Future<void> onTapSetPermissionMemberOfBoard(
      {required Fragment$UserFragment user, required bool selectAdmin,}) async {
    if (!checkAdminOfBoard(user)) {
      isSetAdminForMemberSubject.value = selectAdmin;
    }
  }

  Future<void> removeUserFromBoard(Fragment$UserFragment user) async {
    final board = boardBloc.boardFragment;
    final result = await graphqlService.client.mutate$RemoveUserFromBoard(
      Options$Mutation$RemoveUserFromBoard(
        variables: Variables$Mutation$RemoveUserFromBoard(
          idBoard: board.id,
          uid: user.uid,
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(message: 'Không thể loại bỏ thành viên');
      return;
    }
    routerService.pop();
    await memberBoard();
  }

  void onTapUpdatePermissionForMemberOfBoard(Fragment$UserFragment user) {
    routerService.pop();
  }
}
