import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
//import 'package:task_manager/base/dependency/app_service.dart';

class ShowDialogBoardOption extends ConsumerWidget {
  const ShowDialogBoardOption({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.board);
    // final routerService = ref.watch(AppService.router);
    return AlertDialog(
      title: Text(
        title,
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Chia sẻ liên kết bảng'),
          ),
          TextButton(
            onPressed: () {
              bloc.onTapSettingBoard();
            },
            child: const Text('Cài Đặt bảng'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Đánh dấu sao cho bảng'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Đóng Bảng'),
          ),
        ],
      ),
    );
  }
}
