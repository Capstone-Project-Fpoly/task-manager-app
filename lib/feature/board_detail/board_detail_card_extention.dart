import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/create_card.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/delete_card.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/move_card.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

extension BoardDetailCardExtention on BoardDetailBloc {
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
      return null;
    }
    return result.parsedData?.createCard;
  }

  Future<void> fetchMoveCard({
    required int oldItemIndex,
    required int oldListIndex,
    required int newItemIndex,
    required int newListIndex,
  }) async {
    final input = Input$InputMoveCard(
      newItemIndex: newItemIndex,
      newListIndex: newListIndex,
      oldItemIndex: oldItemIndex,
      oldListIndex: oldListIndex,
    );
    final result = await graphqlService.client.mutate$MoveCard(
      Options$Mutation$MoveCard(
        variables: Variables$Mutation$MoveCard(
          idBoard: currentBoardSubject.value.id,
          input: input,
        ),
      ),
    );
    if (result.hasException || result.parsedData == null) {
      toastService.showText(
        message: 'Di chuyển thẻ thất bại. Hãy thử lại',
      );
      fetchListFragmentByIdBoard();
      return;
    }
  }

  Future<void> deleteCard({
    required String? idCard,
    required String? idList,
  }) async {
    if (idCard == null || idList == null) return;
    if (idCard.isEmpty || idList.isEmpty) return;
    routerService.pop();
    final listTemps = listFragmentsSubject.value;
    for (final list in listTemps) {
      if (list == null) continue;
      if (list.id == idList) {
        if (list.cards == null) continue;
        list.cards!.removeWhere((element) => element.id == idCard);
      }
    }
    listFragmentsSubject.value = listTemps;
    final result = await graphqlService.client.mutate$DeleteCard(
      Options$Mutation$DeleteCard(
        variables: Variables$Mutation$DeleteCard(
          idCard: idCard,
          idList: idList,
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(message: 'không thành công');
      fetchListFragmentByIdBoard();
      return;
    }
    if (result.parsedData?.deleteCard == null ||
        result.parsedData!.deleteCard == false) {
      toastService.showText(message: 'không thành công');
      fetchListFragmentByIdBoard();
      return;
    }
  }
}
