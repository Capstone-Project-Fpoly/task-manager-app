import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/shared/app_bar/custom_app_bar.dart';
import 'package:task_manager/constants/colors.dart';

class MyCradScreen extends ConsumerWidget {
  const MyCradScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  const Scaffold(
        appBar: CustomAppBar(leading:BackButton(color: Colors.white),title: 'Thẻ của tôi ', color: ColorConstants.primary),
        body: Text('Crad Screen'),
    );
  }
}