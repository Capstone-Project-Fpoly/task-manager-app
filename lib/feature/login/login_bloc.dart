import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/graphql/queries/getAllBooks.graphql.dart';

class LoginBloc extends BlocBase {
  final Ref ref;
  late final graphqlService = ref.read(AppService.graphQL);

  LoginBloc(this.ref) {
    init();
  }

  Future<void> init() async {
    final result = await graphqlService.client.query$getAllBooks(
      Options$Query$getAllBooks(),
    );
  }
}
