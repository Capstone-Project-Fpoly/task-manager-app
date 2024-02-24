import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';

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
    final bloc = ref.watch(BlocProvider.dragAndDrop);
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
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
