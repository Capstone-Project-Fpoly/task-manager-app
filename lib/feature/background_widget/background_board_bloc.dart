import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';

class BackgroundBoardBloc extends BlocBase {
  final Ref ref;
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);
  late final appBloc = ref.read(BlocProvider.app);

  final listColorSubject = BehaviorSubject<List<ColorBackground>>.seeded([]);
  final isCheckSelected = BehaviorSubject<bool>.seeded(false);

  void init() {
    listColorSubject.add([
      ColorBackground(color: '2196F3'),
      ColorBackground(color: 'FBFADA'),
      ColorBackground(color: '436850'),
      ColorBackground(color: '6962AD'),
      ColorBackground(color: '1B1A55'),
      ColorBackground(color: 'FFA447'),
      ColorBackground(color: 'EE99C2'),
      ColorBackground(color: '08D9D6'),
      ColorBackground(color: '9DC08B'),
    ]);
  }

  @override
  void dispose() {
    isCheckSelected.close();
    listColorSubject.close();
    super.dispose();
  }

  void onBackToAddBoardScreen() {
    routerService.pop();
  }

  void onBackToAddBoardWithValue(String value) {
    routerService.pop(result: value);
  }

  BackgroundBoardBloc(this.ref) {
    init();
  }
}

class ColorBackground {
  String? color;
  bool isSelected;

  ColorBackground({this.color, this.isSelected = false});
}
