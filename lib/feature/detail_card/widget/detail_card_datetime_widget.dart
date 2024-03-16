import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';

class DetailCardDateTimeWidget extends ConsumerWidget {
  const DetailCardDateTimeWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
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
                      bloc.showDialogStartDate(context: context);
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
                      bloc.showDialogEndDate(context: context);
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
