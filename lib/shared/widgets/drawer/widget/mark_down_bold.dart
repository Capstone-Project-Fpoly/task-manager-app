import 'package:flutter/material.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class MarkDownBold extends StatelessWidget {
  final String text;

  const MarkDownBold({required this.text});

  @override
  Widget build(BuildContext context) {
    final parts = text.split('**');
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: const AppTextStyle(
          fontSize: 14,
        ),
        children: parts.map((part) {
          final bool isBold = parts.indexOf(part) % 2 != 0;
          return TextSpan(
            text: part,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          );
        }).toList(),
      ),
    );
  }
}
