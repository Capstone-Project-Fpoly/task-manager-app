import 'package:task_manager/feature/drag_and_drop/drag_and_drop_bloc.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/create_list.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/moveList.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

extension DragAndDropListExtention on DragAndDropBloc {
  Future<Fragment$ListFragment?> fetchCreateList({
    required String label,
  }) async {
    isLoadingAddSubject.value = true;
    final result = await graphqlService.client.mutate$CreateList(
      Options$Mutation$CreateList(
        variables: Variables$Mutation$CreateList(
          idBoard: boardFragment.id,
          label: label,
        ),
      ),
    );
    isLoadingAddSubject.value = false;
    if (result.hasException) {
      return null;
    }
    return result.parsedData?.createList;
  }

  Future<void> fetchMoveList({
    required int oldListIndex,
    required int newListIndex,
  }) async {
    final result = await graphqlService.client.mutate$MoveList(
      Options$Mutation$MoveList(
        variables: Variables$Mutation$MoveList(
          idBoard: boardFragment.id,
          input: Input$InputMoveList(
            newListIndex: newListIndex,
            oldListIndex: oldListIndex,
          ),
        ),
      ),
    );
    if (result.hasException || result.parsedData == null) {
      toastService.showText(
        message: 'Di chuyển danh sách thất bại. Hãy thử lại',
      );
      fetchListFragmentByIdBoard();
      return;
    }
  }
}
