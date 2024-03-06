import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
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
      streams: [bloc.dialogTitleSubject],
      builder: (context) {
        final titleDialog = bloc.dialogTitleSubject.value;
        return AlertDialog(
          title: Text(
            titleDialog,
            style: const TextStyle(
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
                onPressed: () {},
                child: const Text('Đóng Bảng'),
              ),
            ],
          ),
        );
      },
    );
  }
}
