import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/size_box.dart';

class AddCardScreen extends ConsumerWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.addCard);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              bloc.onBackToBoardScreen();
            },
            child: const Icon(Icons.clear),
          ),
          title: const Text('Thêm thẻ'),
          actions: const [
            Icon(Icons.check),
            SizedBoxConstants.w12,
          ],
        ),
        body: const Center(
          child: Text('Add Card'),
        ),
      ),
    );
  }
}
