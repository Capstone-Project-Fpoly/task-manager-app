import 'package:graphql/client.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/graphql/Subscriptions/check_close_board.graphql.dart';
import 'package:task_manager/graphql/Subscriptions/detail_board.graphql.dart';

extension DetailBoardSubscriptionExtension on BoardDetailBloc {
  Stream<QueryResult<Subscription$DetailBoard>> subscriptionDetailBoard() {
    return graphqlService.client.subscribe$DetailBoard(
      Options$Subscription$DetailBoard(
        variables: Variables$Subscription$DetailBoard(
          idBoard: currentBoardSubject.value.id,
        ),
      ),
    );
  }

  Stream<QueryResult<Subscription$CheckCloseBoard>>
      subscription$CheckCloseBoard() {
    return graphqlService.client.subscribe$CheckCloseBoard(
      Options$Subscription$CheckCloseBoard(
        variables: Variables$Subscription$CheckCloseBoard(
          idBoard: currentBoardSubject.value.id,
        ),
      ),
    );
  }
}
