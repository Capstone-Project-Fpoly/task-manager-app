import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/size_box.dart';

class OptionBottomSheet extends ConsumerWidget {
  const OptionBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.notificationBloc);
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 3, // you can change this to your desired height
      child: ObsBuilder(
        streams: [bloc.selectedOptionSubject],
        builder: (context) {
          final int selectedOption = bloc.selectedOptionSubject.value;
          return Column(
            children: <Widget>[
              ListTile(
                leading: selectedOption == 0
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Tất cả'),
                onTap: () {
                  bloc.onTapOptionAll();
                },
              ),
              ListTile(
                leading: selectedOption == 1
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Tôi'),
                onTap: () {
                  bloc.onTapOptionAll();
                },
              ),

              ListTile(
                leading: selectedOption == 2
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Bình luận'),
                onTap: () {
                  bloc.onTapOptionAll();
                },
              ),
              ListTile(
                leading: selectedOption == 3
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Yêu cầu tham gia'),
                onTap: () {
                  bloc.onTapOptionAll();
                },
              ),
              // Add more ListTiles for more options
            ],
          );
        },
      ),
    );
  }
}
