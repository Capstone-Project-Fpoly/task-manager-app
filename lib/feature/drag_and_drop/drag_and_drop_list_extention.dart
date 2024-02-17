import 'package:task_manager/feature/drag_and_drop/drag_and_drop_bloc.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/list/create_list.graphql.dart';

extension DragAndDropListExtention on DragAndDropBloc {
  Future<Fragment$ListFragment?> fetchCreateList({
    required String label,
  }) async {
    isLoadingAddSubject.value = true;
    final result = await graphqlService.client.mutate$CreateList(
      Options$Mutation$CreateList(
        variables: Variables$Mutation$CreateList(
          idBoard: idBoard,
          label: label,
        ),
      ),
    );
    isLoadingAddSubject.value = false;
    if (result.hasException) {
      toastService.showText(
          message: result.exception?.graphqlErrors[0].message,);
      return null;
    }
    return result.parsedData?.createList;
  }
}
