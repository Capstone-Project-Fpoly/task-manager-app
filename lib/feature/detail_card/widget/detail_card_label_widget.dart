import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_add_label_widget.dart';

class DetailCardLabelWidget extends ConsumerWidget {
  const DetailCardLabelWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
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
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: bloc.listColorSubject.value.length,
                      itemBuilder: (context, i) {
                        return Column(
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
                                          : const SizedBox.shrink(),
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
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        bloc.isShowFloatingSubject.value = false;
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const DetailCardAddLabelWidget();
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 40,
                        child: const Text(
                          'Tạo nhãn mới',
                          style: TextStyle(
                            color: ColorConstants.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBoxConstants.w10,
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
