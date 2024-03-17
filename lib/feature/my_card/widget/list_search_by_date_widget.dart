import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';

class ListSearchByDate extends ConsumerWidget {
  const ListSearchByDate({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final bloc = ref.watch(BlocProvider.myCard);
    return Container(
      margin: EdgeInsetsConstants.top8,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.red,
    );
  }
}