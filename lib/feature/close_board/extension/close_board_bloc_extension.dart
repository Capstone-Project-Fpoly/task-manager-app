import 'package:task_manager/feature/close_board/close_board_bloc.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';

extension BoardBlocExtension on CloseBoardBloc {
  Map<String, List<Fragment$BoardFragment?>> groupByBoards(
    List<Fragment$BoardFragment?> boards,
  ) {
    final Map<String, List<Fragment$BoardFragment?>> groupedMap = {};

    for (final board in boards) {
      final uid = board?.ownerUser?.uid;
      if (uid == null) continue;
      if (!groupedMap.containsKey(uid)) {
        groupedMap[uid] = [];
      }
      groupedMap[uid]!.add(board);
    }
    return groupedMap;
  }
}
