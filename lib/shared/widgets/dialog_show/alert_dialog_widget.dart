import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/dependency/app_service.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class ShowAlertDialog extends ConsumerWidget {
  const ShowAlertDialog({
    Key? key,
    required this.onTap,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(context, ref) {
    final routerService = ref.watch(AppService.router);
    return AlertDialog(
      title: Text(
        title,
        style: const AppTextStyle(
          color: Colors.red,
        ),
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            routerService.pop(result: false);
          },
          child: const Text('hủy'),
        ),
        TextButton(
          onPressed: () {
            onTap();
          },
          child: const Text('đồng ý'),
        ),
      ],
    );
  }
}
