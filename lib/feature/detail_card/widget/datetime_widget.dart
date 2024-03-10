import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/utilities/datetime.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final double width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: const [],
      builder: (context) {
        return Container(
          color: ColorConstants.white,
          padding: EdgeInsetsConstants.all12,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 30,
                child: const Icon(
                  Icons.access_time,
                  color: ColorConstants.primary,
                ),
              ),
              SizedBoxConstants.w6,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (_) => Container(
                          alignment: Alignment.center,
                          child: Container(
                            // alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            width: 300,
                            height: 150,
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
                                              locale: const Locale('vi', 'VN'),
                                            ).then((value) {
                                              bloc.startDateController.text =
                                                  formatDateTimeDetailCard(
                                                value.toString(),
                                              );
                                            });
                                          },
                                          child: TextField(
                                            style: const TextStyle(
                                              color:
                                                  ColorConstants.primaryBlack,
                                              fontSize: 14,
                                            ),
                                            enabled: false,
                                            controller:
                                                bloc.startDateController,
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsetsConstants.bottom4,
                                              hintText: 'Chọn ngày',
                                              hintStyle: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstants.primaryBlack,
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
                                            showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial,
                                            ).then((value) {
                                              if (value != null) {
                                                bloc.startTimeController.text =
                                                    '${value.hour}:${value.minute}';
                                              }
                                            });
                                          },
                                          child: TextField(
                                            style: const TextStyle(
                                              color:
                                                  ColorConstants.primaryBlack,
                                              fontSize: 14,
                                            ),
                                            enabled: false,
                                            controller:
                                                bloc.startTimeController,
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsetsConstants.bottom4,
                                              hintText: 'Chọn giờ',
                                              hintStyle: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstants.primaryBlack,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBoxConstants.h20,
                                Material(
                                  color: ColorConstants.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          bloc.cancelSelectStartDate();
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
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: width - 60,
                      child: TextField(
                        style: const TextStyle(
                          color: ColorConstants.primaryBlack,
                          fontSize: 14,
                        ),
                        enabled: false,
                        controller: bloc.startDateTimeController,
                        decoration: const InputDecoration(
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsetsConstants.bottom4,
                          hintText: 'Ngày bắt đầu...',
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: ColorConstants.primaryBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBoxConstants.h12,
                  Container(
                    width: width - 60,
                    height: 0.5,
                    color: ColorConstants.divider,
                  ),
                  // SizedBoxConstants.h12,
                  InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (_) => Container(
                          alignment: Alignment.center,
                          child: Container(
                            // alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            width: 300,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ngày kết thúc',
                                  style: TextStyle(
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBoxConstants.h10,
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
                                              locale: const Locale('vi', 'VN'),
                                            ).then((value) {
                                              bloc.endDateController.text =
                                                  formatDateTimeDetailCard(
                                                value.toString(),
                                              );
                                            });
                                          },
                                          child: TextField(
                                            style: const TextStyle(
                                              color:
                                                  ColorConstants.primaryBlack,
                                              fontSize: 14,
                                            ),
                                            enabled: false,
                                            controller: bloc.endDateController,
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsetsConstants.bottom4,
                                              hintText: 'Chọn ngày',
                                              hintStyle: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstants.primaryBlack,
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
                                            showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial,
                                            ).then((value) {
                                              if (value != null) {
                                                bloc.endTimeController.text =
                                                    '${value.hour} : ${value.minute}';
                                              }
                                            });
                                          },
                                          child: TextField(
                                            style: const TextStyle(
                                              color:
                                                  ColorConstants.primaryBlack,
                                              fontSize: 14,
                                            ),
                                            enabled: false,
                                            controller: bloc.endTimeController,
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsetsConstants.bottom4,
                                              hintText: 'Chọn giờ',
                                              hintStyle: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstants.primaryBlack,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBoxConstants.h20,
                                Material(
                                  color: ColorConstants.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          bloc.cancelSelectEndDate();
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
                                          bloc.completeSelectEndDate();
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
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: width - 60,
                      child: TextField(
                        enabled: false,
                        style: const TextStyle(
                          color: ColorConstants.primaryBlack,
                          fontSize: 14,
                        ),
                        controller: bloc.endDateTimeController,
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsetsConstants.vertical4 +
                              EdgeInsetsConstants.top4,
                          hintText: 'Ngày kết thúc...',
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: ColorConstants.primaryBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
