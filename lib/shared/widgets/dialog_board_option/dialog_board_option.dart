import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';
//import 'package:task_manager/base/dependency/app_service.dart';

class ShowDialogBoardOption extends ConsumerWidget {
  final VoidCallback? functionWhenCloseSettingBoard;
  const ShowDialogBoardOption({
    Key? key,
    this.functionWhenCloseSettingBoard,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.app);
    final routerService = ref.watch(AppService.router);
    // final routerService = ref.watch(AppService.router);
    return ObsBuilder(
      streams: [
        bloc.selectedBoardSubject,
      ],
      builder: (context) {
        final board = bloc.selectedBoardSubject.value;
        final user = bloc.userSubject.value;
        final isOwnerBroad = user?.uid == board?.ownerUser?.uid;
        final titleDialog = board?.title;
        return AlertDialog(
          title: Text(
            titleDialog ?? '',
            style: const AppTextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {},
                child: const Text('Chia sẻ liên kết bảng'),
              ),
              if (isOwnerBroad)
                TextButton(
                  onPressed: () async {
                    routerService.pop();
                    await routerService.push(RouteInput.settingBoard());
                    functionWhenCloseSettingBoard?.call();
                  },
                  child: const Text('Cài Đặt bảng'),
                ),
              TextButton(
                onPressed: () {},
                child: const Text('Đánh dấu sao cho bảng'),
              ),
              TextButton(
                onPressed: () {
                  if (isOwnerBroad) {
                    //Đóng Bảng
                  } else {
                    //Rời bảng
                    routerService.pop();
                    bloc.onTapLeaveBoard(
                      context: context,
                      boardId: board?.id ?? '',
                    );
                  }
                },
                child: Text(
                  isOwnerBroad ? 'Đóng Bảng' : 'Rời Bảng',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
