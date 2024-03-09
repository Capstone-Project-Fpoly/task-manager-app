import 'dart:ffi';

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
      streams: [bloc.listColorSubject],
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
                      for (var i = 0;
                          i < bloc.listColorSubject.value.length;
                          i++)
                        Column(
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Material(
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(5),
                                        onTap: () {
                                          bloc.onTapToSelect(
                                            bloc.listColorSubject.value[i],
                                          );
                                        },
                                        child: Ink(
                                          width: width - 95,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color(
                                              int.parse(
                                                '0XFF${bloc.listColorSubject.value[i].color}',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      child: bloc.listColorSubject.value[i]
                                              .isSelected
                                          ? const Icon(Icons.check)
                                          : Container(),
                                    ),
                                  ],
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
