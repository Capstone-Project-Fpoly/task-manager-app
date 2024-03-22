import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/utilities/datetime.dart';

class DetailCardDialogStartDate extends ConsumerWidget {
  const DetailCardDialogStartDate({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    return Container(
      alignment: Alignment.center,
      child: ObsBuilder(
        streams: [bloc.isShowErrorStartDateSubject],
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            height: 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ngày bắt đầu',
                  style: TextStyle(
                    color: ColorConstants.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBoxConstants.h10,
                Row(
                  children: [
                    ObsBuilder(
                      streams: [bloc.startDateSubject, bloc.startTimeSubject],
                      builder: (context) {
                        final startDateTime = bloc.startDateSubject.value;
                        return SizedBox(
                          width: 175,
                          child: Material(
                            color: ColorConstants.white,
                            child: InkWell(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: startDateTime,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                ).then((value) {
                                  if (value == null) return;
                                  bloc.startDateSubject.value = value;
                                  bloc.startDateController.text =
                                      formatDateTimeDetailCard(
                                    value.toString(),
                                  );
                                });
                              },
                              child: TextField(
                                style: const TextStyle(
                                  color: ColorConstants.primaryBlack,
                                  fontSize: 14,
                                ),
                                enabled: false,
                                controller: bloc.startDateController,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsetsConstants.bottom4,
                                  hintText: 'Chọn ngày',
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: ColorConstants.primaryBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBoxConstants.w10,
                    SizedBox(
                      width: 75,
                      child: Material(
                        color: ColorConstants.white,
                        child: InkWell(
                          onTap: () {
                            if (bloc.startDateSubject.value != null) {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.dial,
                              ).then((value) {
                                if (value != null) {
                                  bloc.startTimeController.text =
                                      '${value.hour}:${value.minute}';
                                  bloc.startTimeSubject.value = value;
                                }
                              });
                            }
                          },
                          child: TextField(
                            style: const TextStyle(
                              color: ColorConstants.primaryBlack,
                              fontSize: 14,
                            ),
                            enabled: false,
                            controller: bloc.startTimeController,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsetsConstants.bottom4,
                              hintText: 'Chọn giờ',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                color: ColorConstants.primaryBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBoxConstants.h10,
                !bloc.isShowErrorStartDateSubject.value
                    ? const SizedBox.shrink()
                    : const Text(
                        'Ngày bắt đầu không được muộn hơn ngày kết thúc',
                        style: TextStyle(
                          color: ColorConstants.red,
                          fontSize: 11,
                        ),
                      ),
                SizedBoxConstants.h10,
                Material(
                  color: ColorConstants.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          bloc.cancelSelectDateTime();
                        },
                        child: const Text(
                          'Hủy',
                          style: TextStyle(
                            color: ColorConstants.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBoxConstants.w15,
                      InkWell(
                        onTap: () {
                          bloc.completeSelectStartDate();
                        },
                        child: const Text(
                          'Hoàn tất',
                          style: TextStyle(
                            color: ColorConstants.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
