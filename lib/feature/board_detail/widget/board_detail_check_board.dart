import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/base/dependency/router/utils/route_name.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/feature/board_detail/extension/board_detail_board_extension.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class BoardDetailCheckBoard extends ConsumerWidget {
  const BoardDetailCheckBoard({
    super.key,
    required this.currentBoard,
  });

  final Fragment$BoardFragment currentBoard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBloc = ref.watch(BlocProvider.app);
    final bloc = ref.watch(BlocProvider.boardDetail);
    final routerService = ref.watch(AppService.router);
    final isCreator =
        appBloc.userSubject.value?.uid == currentBoard.ownerUser?.uid;
    if (isCreator) {
      return _buildContainerForCreator(context: context, bloc: bloc);
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      width: double.infinity,
      margin: EdgeInsetsConstants.horizontal16,
      padding: EdgeInsetsConstants.all16,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${currentBoard.title} giờ đã đóng',
            style: const AppTextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBoxConstants.h16,
          ElevatedButton(
            onPressed: () {
              routerService.popUntil(
                (route) => route.settings.name == RouteName.root,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text(
              'Quay lại',
              style: AppTextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainerForCreator({
    required BoardDetailBloc bloc,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsetsConstants.horizontal16,
      padding: EdgeInsetsConstants.all16 + EdgeInsetsConstants.top8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${currentBoard.title} giờ đã đóng',
            style: const AppTextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
          ),
          SizedBoxConstants.h16,
          ElevatedButton(
            onPressed: () {
              bloc.onTapOpenBoard();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text(
              'Mở lại',
              style: AppTextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBoxConstants.h4,
          OutlinedButton(
            onPressed: () {
              bloc.onTapConfirmDeleteBoard(context, idBoard: currentBoard.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text(
              'Xóa',
              style: AppTextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
