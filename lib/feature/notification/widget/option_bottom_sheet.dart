import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/notification/enum/notification_options.dart';

class OptionBottomSheet extends ConsumerWidget {
  const OptionBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.notificationBloc);
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 3,
      child: ObsBuilder(
        streams: [bloc.selectedOptionSubject],
        builder: (context) {
          final selectedOption = bloc.selectedOptionSubject.value;
          return Column(
            children: <Widget>[
              SizedBoxConstants.h12,
              ListTile(
                leading: selectedOption == NotificationOptionsEnum.all
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Tất cả'),
                onTap: () {
                  bloc.onTapOption(option: NotificationOptionsEnum.all);
                },
              ),
              ListTile(
                leading: selectedOption == NotificationOptionsEnum.me
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Tôi'),
                onTap: () {
                  bloc.onTapOption(option: NotificationOptionsEnum.me);
                },
              ),

              ListTile(
                leading: selectedOption == NotificationOptionsEnum.comment
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Bình luận'),
                onTap: () {
                  bloc.onTapOption(option: NotificationOptionsEnum.comment);
                },
              ),
              ListTile(
                leading: selectedOption == NotificationOptionsEnum.invite
                    ? const Icon(Icons.check)
                    : SizedBoxConstants.w10,
                title: const Text('Yêu cầu tham gia'),
                onTap: () {
                  bloc.onTapOption(option: NotificationOptionsEnum.invite);
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
