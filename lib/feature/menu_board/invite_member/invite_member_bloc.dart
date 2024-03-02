import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_invite_to_board.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';

class InviteMemberBloc extends BlocBase {
  final Ref ref;

  InviteMemberBloc(this.ref) {
    init();
  }

  final searchController = TextEditingController();
  final checkMemberSubject = BehaviorSubject<bool>.seeded(false);
  final isInviteSubject = BehaviorSubject<bool>.seeded(false);
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
    isInviteSubject.close();
    listMemberSubject.close();
    listSearchInviteUsersSubject.close();
    isLoadingSubject.close();
    isSearchSubject.close();
  }

  Future<void> init() async {
    await memberBoard();
    debounceTimer = Timer(const Duration(milliseconds: 500), () {});
  }

  void onSearchTextChanged(String text) {
    debounceTimer.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 500), () {
      searchUser(text);
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

  void onTapInviteMember() {
    isInviteSubject.value = !isInviteSubject.value;
  }


  void back() {
    routerService.pop();
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
    final board = boardBloc.boardFragment;
    final result = await graphqlService.client.query$GetUserOfBoard(
      Options$Query$GetUserOfBoard(
        variables:
        Variables$Query$GetUserOfBoard(idBoard: board.id, query: null),
      ),
    );
    listMemberSubject.value = result.parsedData!.getUsersOfBoard!;
    isLoadingSubject.value = false;
  }

}
