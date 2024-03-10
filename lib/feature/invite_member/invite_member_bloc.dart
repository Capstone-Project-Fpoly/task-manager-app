import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/invite_user_to_board.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_invite_to_board.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';

class InviteMemberBloc extends BlocBase {
  final Ref ref;

  InviteMemberBloc(this.ref) {
    init();
  }

  final searchController = TextEditingController();
  final isSearchUsersSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
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
  late Timer debounceTimer;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    isSearchUsersSubject.close();
    listMemberSubject.close();
    listSearchInviteUsersSubject.close();
    isLoadingSubject.close();
    isSearchSubject.close();
    listInviteUsersSubject.close();
  }

  Future<void> init() async {
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
    listSearchInviteUsersSubject.value = [];
    isSearchUsersSubject.value = false;
    searchController.text = '';
  }

  void back() {
    routerService.pop();
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
    listInviteUsersSubject.value = [];
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
    final board = boardBloc.boardFragment;
    if (user == board.ownerUser) return 'Quản trị viên';
    return 'Thành viên';
  }

  bool checkMemberBoard(String? email) {
    final list = listMemberSubject.value;
    final result = list
        .where((element) => element?.email?.contains(email ?? '') ?? false)
        .toList();
    if (result.isEmpty) return false;
    return true;
  }
}
