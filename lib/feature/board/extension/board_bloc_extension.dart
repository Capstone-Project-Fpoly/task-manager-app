import 'package:task_manager/feature/board/board_bloc.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';

extension BoardBlocExtension on BoardBloc {
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
