import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';

class BoardBloc extends BlocBase {
  final Ref ref;

  late final appBloc = ref.read(BlocProvider.app);
  BoardBloc(this.ref);
}
