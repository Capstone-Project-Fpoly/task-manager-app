import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/card/update_card.graphql.dart';
import 'package:task_manager/schema.graphql.dart';

extension DetailCardExtension on DetailCardBloc {
  Future<Fragment$CardFragment?> updateCard({
    String? title,
    String? description,
    String? endDate,
    String? startedDate,
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
          ),
        ),
      ),
    );
    if (result.hasException) {
      toastService.showText(message: 'Có lỗi xảy ra, vui lòng thử lại sau!');
    }
    return result.parsedData?.updateCard;
  }
}
