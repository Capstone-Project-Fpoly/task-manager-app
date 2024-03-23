import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class AddCardDateTimePicker extends ConsumerWidget {
  const AddCardDateTimePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.addCard);
    return ObsBuilder(
      streams: [
        bloc.timeFinishSubject,
        bloc.timeStartSubject,
      ],
      builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.access_time,
              color: ColorConstants.secondaryText,
              size: 28,
            ),
            SizedBoxConstants.w12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBoxConstants.h4,
                InkWell(
                  onTap: () {
                    bloc.showDateTimePickerStart(context);
                  },
                  child: Text(
                    bloc.timeStartSubject.value == null
                        ? 'Ngày Bắt Đầu...'
                        : 'Ngày Bắt Đầu: ${bloc.timeStartSubject.value}',
                    // style: const AppTextStyle.black(
                    //   fontSize: 14,
                    //   color: ColorConstants.grayText,
                    // ),
                  ),
                ),
                SizedBoxConstants.h16,
                InkWell(
                  onTap: () {
                    bloc.showDateTimePickerFisnish(context);
                  },
                  child: Text(
                    bloc.timeFinishSubject.value == null
                        ? 'Ngày hết hạn...'
                        : 'Ngày hết hạn: ${bloc.timeFinishSubject.value}',
                    style: const AppTextStyle.black(
                      fontSize: 14,
                      color: ColorConstants.primaryBlack,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
