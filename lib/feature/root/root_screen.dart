import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/dependency/app_service.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeService = ref.watch(AppService.router);
    return TextButton(
      child: const Text('màn root'),
      onPressed: () => routeService.pop(),
    );
  }
}
