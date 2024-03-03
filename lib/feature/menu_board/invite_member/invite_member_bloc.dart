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
  final checkMemberSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final isSearchSubject = BehaviorSubject<bool>.seeded(false);
  final focusNode = FocusNode();
  final listMemberSubject =
      BehaviorSubject<List<Fragment$UserFragment?>>.seeded([]);
  final listSearchInviteUsersSubject =
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
    checkMemberSubject.close();
    listMemberSubject.close();
    listSearchInviteUsersSubject.close();
    isLoadingSubject.close();
    isSearchSubject.close();
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
    checkMemberSubject.value = true;
  }

  void onTapCancelSearch() {
    focusNode.unfocus();
    checkMemberSubject.value = false;
    listSearchInviteUsersSubject.value.clear();
    searchController.text = '';
  }

  void back() {
    routerService.pop();
  }

  void inviteMemberToBoard(Fragment$UserFragment user) async {
    if (checkMemberBoard(user.email)) return;
    final board = boardBloc.boardFragment;
    final listId = [];
    listId.add(user.uid);
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$InviteUserBoard(
      Options$Mutation$InviteUserBoard(
        variables: Variables$Mutation$InviteUserBoard(
          idBoard: board.id,
          idUser: listId[0] ?? '',
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) return;
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
    listSearchInviteUsersSubject.value =
        result.parsedData!.getUsersInviteToBoard!;
    isSearchSubject.value = false;
  }

  Future<void> memberBoard() async {
    isLoadingSubject.value = true;
    final result = await searchMemberBoard(null);
    isLoadingSubject.value = false;
    if (result.hasException) return;
    listMemberSubject.value = result.parsedData!.getUsersOfBoard!;
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

  bool checkMemberBoard(String? email) {
    final list = listMemberSubject.value;
    final result = list
        .where((element) => element?.email?.contains(email ?? '') ?? false)
        .toList();
    if (result.isEmpty) return false;
    return true;
  }
}
