import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/constants/icons.dart';

class AppCircleAvatar extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final Widget? errorBuilder;

  const AppCircleAvatar({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    CachedNetworkImage;
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, error, stackTrace) {
          return errorBuilder ?? IconConstants.avatarDefault;
        },
      ),
    );
  }
}
