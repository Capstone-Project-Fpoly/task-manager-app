import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'dart:math' as math;

class LabelWidget extends ConsumerWidget {
  const LabelWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final double width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      builder: (context) {
        return Container(
          width: width,
          color: ColorConstants.white,
          padding: EdgeInsetsConstants.all12,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    padding: EdgeInsetsConstants.top8,
                    alignment: Alignment.centerLeft,
                    child: const Icon(Icons.local_offer_outlined),
                  ),
                  SizedBoxConstants.w6,
                  Column(
                    children: [
                      for (var i = 0; i < 5; i++)
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: width - 95,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color((math.Random().nextDouble() *
                                                0xFFFFFF)
                                            .toInt(),)
                                        .withOpacity(1.0),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 35,
                                  child: const Icon(Icons.create),
                                ),
                              ],
                            ),
                            SizedBoxConstants.h10,
                          ],
                        ),
                    ],
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
