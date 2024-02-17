import 'package:task_manager/feature/drag_and_drop/drag_and_drop_bloc.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/create_card.graphql.dart';

extension DragAndDropCardExtention on DragAndDropBloc {
  Future<Fragment$CardFragment?> fetchCreateCard({
    required String idList,
    required String title,
  }) async {
    isLoadingAddSubject.value = true;
    final result = await graphqlService.client.mutate$CreateCard(
      Options$Mutation$CreateCard(
        variables: Variables$Mutation$CreateCard(
          idList: idList,
          title: title,
        ),
      ),
    );
    isLoadingAddSubject.value = false;
    if (result.hasException) {
      toastService.showText(
          message: result.exception?.graphqlErrors[0].message,);
      return null;
    }
    return result.parsedData?.createCard;
  }
}
