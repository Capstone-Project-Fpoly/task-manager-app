import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';
//import 'package:task_manager/base/dependency/app_service.dart';

class ShowDialogBoardOption extends ConsumerWidget {
  const ShowDialogBoardOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.board);
    // final routerService = ref.watch(AppService.router);
    return ObsBuilder(
      streams: [
        bloc.selectedBoardSubject,
        bloc.isOwnerBroadSubject,
      ],
      builder: (context) {
        final isOwnerBroad = bloc.isOwnerBroadSubject.value;
        final titleDialog = bloc.selectedBoardSubject.value!.title;
        return AlertDialog(
          title: Text(
            titleDialog!,
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
                  onPressed: () {
                    bloc.onTapSettingBoard();
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
                    bloc.showDialogLeaveBoard(context: context);
                  }
                },
                child: Text(isOwnerBroad ? 'Đóng Bảng' : 'Rời Bảng'),
              ),
            ],
          ),
        );
      },
    );
  }
}
