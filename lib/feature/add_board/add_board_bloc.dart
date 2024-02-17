import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/Mutations/board/create_board.graphql.dart';

class AddBoardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final appBloc = ref.read(BlocProvider.app);

  final nameBoardSubject = BehaviorSubject<String>.seeded('');
  final isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    nameBoardSubject.close();
    isLoadingSubject.close();
    super.dispose();
  }

  void onBackToBoardScreen() {
    routerService.pop();
  }

  AddBoardBloc(this.ref);

  Future<void> onTapAddBoard() async {
    if (nameBoardSubject.value.trim().isEmpty) return;
    isLoadingSubject.value = true;
    final result = await graphqlService.client.mutate$CreateBoard(
      Options$Mutation$CreateBoard(
        variables: Variables$Mutation$CreateBoard(
          title: nameBoardSubject.value.trim(),
          isPublic: true,
        ),
      ),
    );
    isLoadingSubject.value = false;
    if (result.hasException) {
      toastService.showText(
          message: result.exception?.graphqlErrors[0].message,);
      routerService.pop(result: false);
      return;
    }
    routerService.pop(result: true);
  }
}
