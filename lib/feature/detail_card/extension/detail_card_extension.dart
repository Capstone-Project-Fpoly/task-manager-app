import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_on_back_extension.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/get_card.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/update_card.graphql.dart';
import 'package:task_manager/graphql/Mutations/label/get_labels_of_board.graphql.dart';
import 'package:task_manager/graphql/queries/board/get_user_of_board.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

extension DetailCardExtension on DetailCardBloc {
  Future<Fragment$CardFragment?> updateCard({
    String? title,
    String? description,
    String? endDate,
    String? startedDate,
    List<Input$CheckListInput>? checkLists,
    List<String>? users,
    List<String>? labels,
  }) async {
    final result = await graphqlService.client.mutate$UpdateCard(
      Options$Mutation$UpdateCard(
        variables: Variables$Mutation$UpdateCard(
          input: Input$InputUpdateCard(
            idCard: idCard,
            description: description,
            title: title,
            endDate: endDate,
            startedDate: startedDate,
            reminder: Enum$Reminder.Unknown,
            checkLists: checkLists,
            users: users,
            labels: labels,
          ),
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(message: 'Có lỗi xảy ra, vui lòng thử lại sau!');
    }
    return result.parsedData?.updateCard;
  }

  Future<List<Fragment$UserFragment?>> getUserOfBoard() async {
    final result = await graphqlService.client.query$GetUserOfBoard(
      Options$Query$GetUserOfBoard(
        variables: Variables$Query$GetUserOfBoard(
          idBoard: idBoard,
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(message: 'Lỗi khi lấy thông tin thành viên!');
      return [];
    }
    final users = result.parsedData?.getUsersOfBoard ?? [];
    return users;
  }

  Future<void> onTapUpdateTitle() async {
    if (titleController.text == cardSubject.value?.title) {
      onTapBackTitle();
      return;
    }
    isLoadingUpdateSubject.value = true;
    final card = await updateCard(title: titleController.text);
    isLoadingUpdateSubject.value = false;
    appBarEnumSubject.value = null;
    focusNodeTitle.unfocus();
    if (card == null) {
      return;
    }
    cardSubject.value = card;
  }

  Future<void> onTapUpdateDescription() async {
    if (descriptionController.text == cardSubject.value?.description) {
      onTapBackDescription();
      return;
    }
    isLoadingUpdateSubject.value = true;
    final card = await updateCard(description: descriptionController.text);
    isLoadingUpdateSubject.value = false;
    appBarEnumSubject.value = null;
    focusNodeDescription.unfocus();
    if (card == null) {
      return;
    }
    cardSubject.value = card;
  }

  Future<void> fetchCard() async {
    isLoadingSubject.value = true;
    final (resultGetCard, resultGetUser, resultLabelOfBoard) = await (
      graphqlService.client.mutate$GetCard(
        Options$Mutation$GetCard(
          variables: Variables$Mutation$GetCard(
            idCard: idCard,
          ),
        ),
      ),
      graphqlService.client.query$GetUserOfBoard(
        Options$Query$GetUserOfBoard(
          variables: Variables$Query$GetUserOfBoard(
            idBoard: idBoard,
          ),
        ),
      ),
      graphqlService.client.mutate$GetLabelsOfBoard(
        Options$Mutation$GetLabelsOfBoard(
          variables: Variables$Mutation$GetLabelsOfBoard(
            idBoard: idBoard,
          ),
        ),
      ),
    ).wait;
    isLoadingSubject.value = false;
    if (resultGetCard.hasException) {
      final message = resultGetCard.exception?.graphqlErrors.first.message;
      toastService.showText(message: message);
      routerService.pop();
      return;
    }
    // get user of board
    if (!resultGetUser.hasException) {
      usersOfBoard.value = resultGetUser.parsedData?.getUsersOfBoard ?? [];
    }

    if (!resultLabelOfBoard.hasException) {
      final labels = resultLabelOfBoard.parsedData?.getLabelsOfBoard ?? [];
      listLabelOfBoardSubject.value = labels;
    }
    cardSubject.value = resultGetCard.parsedData?.getCard;
    init();
  }
}
