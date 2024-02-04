import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_input.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/graphql/Mutations/get_boards.graphql.dart';

class BoardBloc extends BlocBase {
  final Ref ref;
  final isDialOpenSubject = BehaviorSubject<bool>.seeded(false);
  final extendSubject = BehaviorSubject<bool>.seeded(false);
  final clickSubject = BehaviorSubject<bool>.seeded(false);
  final listBoardSubject =
      BehaviorSubject<List<Fragment$BoardFragment?>>.seeded([]);
  late final routerService = ref.watch(AppService.router);
  late final graphqlService = ref.read(AppService.graphQL);
  late final toastService = ref.read(AppService.toast);

  void init() {
    getBoard();
    // listBoardSubject.value.addAll(
    //   [
    //     Fragment$BoardFragment(
    //       id: '1',
    //       ownerUser: Fragment$UserFragment(
    //         uid: '1',
    //         avatar: '',
    //         createdAt: '2024-26-01',
    //         email: 'khangloong14@gmail.com',
    //         fullName: 'Dinh Viet Khang',
    //       ),
    //       color: '0xFFED8C8C',
    //       isPublic: true,
    //       title: 'Bảng 1',
    //       createdAt: '',
    //     ),
    //     Fragment$BoardFragment(
    //       id: '2',
    //       ownerUser: Fragment$UserFragment(
    //         uid: '1',
    //         avatar: '',
    //         createdAt: '2024-26-01',
    //         email: 'khangloong14@gmail.com',
    //         fullName: 'Dinh Viet Khang',
    //       ),
    //       color: '0xFFED8C8C',
    //       isPublic: true,
    //       title: 'Bảng 2',
    //       createdAt: '',
    //     ),
    //     Fragment$BoardFragment(
    //       id: '3',
    //       ownerUser: Fragment$UserFragment(
    //         uid: '1',
    //         avatar: '',
    //         createdAt: '2024-26-01',
    //         email: 'khangloong14@gmail.com',
    //         fullName: 'Dinh Viet Khang',
    //       ),
    //       color: '0xFFED8C8C',
    //       isPublic: true,
    //       title: 'Bảng 3',
    //       createdAt: '',
    //     ),
    //   ],
    // );
  }

  @override
  void dispose() {
    super.dispose();
    isDialOpenSubject.close();
    extendSubject.close();
    clickSubject.close();
    listBoardSubject.close();
  }

  void changeClick(bool change) {
    clickSubject.value = change;
  }

  void onTapToDragAndDrop(String id) {
    routerService.push(RouteInput.dragAndDrop(id));
  }

  void onTapToAddBoard() {
    routerService.push(RouteInput.addBoard());
  }

  void onTapToAddCard() {
    routerService.push(RouteInput.addCard());
  }

  void getBoard() async {
    final result = await graphqlService.client
        .mutate$getBoards(Options$Mutation$getBoards());
    if (result.hasException) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ?? 'Lỗi',
      );
      return;
    }
    if (result.parsedData == null) {
      toastService.showText(
        message: result.exception?.graphqlErrors[0].message ??
            'Không lấy được dữ liệu!',
      );
      return;
    }
    listBoardSubject.value = result.parsedData?.getBoards ?? [];
  }

  late final appBloc = ref.read(BlocProvider.app);
  BoardBloc(this.ref) {
    init();
  }
}
