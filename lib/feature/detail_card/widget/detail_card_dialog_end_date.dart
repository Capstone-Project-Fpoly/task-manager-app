import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/utilities/datetime.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class DetailCardDialogEndDate extends ConsumerWidget {
  const DetailCardDialogEndDate({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    return Container(
      alignment: Alignment.center,
      child: ObsBuilder(
        streams: [bloc.isShowErrorEndDateSubject],
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ngày kết thúc',
                  style: AppTextStyle(
                    color: ColorConstants.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 175,
                      child: Material(
                        color: ColorConstants.white,
                        child: InkWell(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            ).then((value) {
                              bloc.endDateController.text =
                                  formatDateTimeDetailCard(
                                value.toString(),
                              );
                              bloc.endDateSubject.value = value;
                            });
                          },
                          child: TextField(
                            style: const AppTextStyle(
                              color: ColorConstants.primaryBlack,
                              fontSize: 14,
                            ),
                            enabled: false,
                            controller: bloc.endDateController,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsetsConstants.bottom4,
                              hintText: 'Chọn ngày',
                              hintStyle: AppTextStyle(
                                fontSize: 13,
                                color: ColorConstants.primaryBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBoxConstants.w10,
                    SizedBox(
                      width: 75,
                      child: Material(
                        color: ColorConstants.white,
                        child: InkWell(
                          onTap: () {
                            final initTime =
                                bloc.endTimeController.text.trim().isNotEmpty
                                    ? TimeOfDay.fromDateTime(
                                        DateFormat('HH:mm').parse(
                                          bloc.endTimeController.text,
                                        ),
                                      )
                                    : TimeOfDay.now();
                            showTimePicker(
                              context: context,
                              initialTime: initTime,
                              initialEntryMode: TimePickerEntryMode.dial,
                              builder: (context, child) {
                                if (child == null) return const SizedBox();
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child,
                                );
                              },
                            ).then((value) {
                              if (value != null) {
                                bloc.endTimeController.text =
                                    '${value.hour}:${value.minute < 10 ? '0${value.minute}' : value.minute}';
                              }
                              bloc.endTimeSubject.value = value;
                            });
                          },
                          child: TextField(
                            style: const AppTextStyle(
                              color: ColorConstants.primaryBlack,
                              fontSize: 14,
                            ),
                            enabled: false,
                            controller: bloc.endTimeController,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsetsConstants.bottom4,
                              hintText: 'Chọn giờ',
                              hintStyle: AppTextStyle(
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
                          style: AppTextStyle(
                            color: ColorConstants.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBoxConstants.w15,
                      InkWell(
                        onTap: () {
                          bloc.completeSelectEndDate();
                        },
                        child: const Text(
                          'Hoàn tất',
                          style: AppTextStyle(
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
