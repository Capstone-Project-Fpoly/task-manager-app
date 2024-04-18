import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/feature/close_board/extension/close_board_bloc_extension.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/board/get_close_board.graphql.dart';

class CloseBoardBloc extends BlocBase {
  final Ref ref;
  final isDialOpenSubject = BehaviorSubject<bool>.seeded(false);
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  final extendSubject = BehaviorSubject<bool>.seeded(false);
  final clickSubject = BehaviorSubject<bool>.seeded(false);
  late final appBloc = ref.watch(BlocProvider.app);

  final listBoardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  final selectedSearchSubject = BehaviorSubject<bool>.seeded(false);
  final searchTextSubject = BehaviorSubject<String>.seeded('');
  final isOwnerBroadSubject = BehaviorSubject<bool>.seeded(false);
  final groupByBoardSubject =
      BehaviorSubject<List<List<Fragment$BoardFragment?>>>.seeded([]);

  void init() {
    getBoardsClosed();
  }

  @override
  void dispose() {
    super.dispose();
    isDialOpenSubject.close();
    extendSubject.close();
    clickSubject.close();
    isLoadingSubject.close();
    listBoardSubject.close();
    selectedSearchSubject.close();
    searchTextSubject.close();
    isOwnerBroadSubject.close();
    groupByBoardSubject.close();
  }

  void openSearch(bool open) {
    selectedSearchSubject.value = open;
    if (!open) {
      searchTextSubject.value = '';
      restoreBoard();
    }
  }

  void changeClick(bool change) {
    clickSubject.value = change;
  }

  void searchLocalBoard(String query) {
    if (query.isEmpty) {
      restoreBoard();
      return;
    }
    final list = [...listBoardSubject.value];
    final result = list
        .where((element) => element?.title?.contains(query) ?? false)
        .toList();
    final groupBoard = groupByBoards([...result]);
    groupByBoardSubject.value = groupBoard.values.toList();
  }

  void getBoardsClosed() async {
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$getBoardsClosed(
      Options$Mutation$getBoardsClosed(),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ?? 'Lỗi',
      );
      return;
    }
    if (result.parsedData == null) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ??
            'Không lấy được dữ liệu!',
      );
      return;
    }
    listBoardSubject.value = result.parsedData?.getBoardsClosed ?? [];
    restoreBoard();
  }

  void restoreBoard() {
    final groupBoard = groupByBoards([...listBoardSubject.value]);
    groupByBoardSubject.value = groupBoard.values.toList();
  }

  CloseBoardBloc(this.ref) {
    init();
  }
}
