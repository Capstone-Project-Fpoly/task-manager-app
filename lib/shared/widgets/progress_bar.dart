import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final List<bool> checkList;

  const ProgressBar({required this.checkList});

  @override
  Widget build(BuildContext context) {
    final checkedCount = checkList.where((element) => element).length;
    final progress = checkList.isEmpty ? 0.0 : checkedCount / checkList.length;

    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.blue[50],
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
    );
  }
}
