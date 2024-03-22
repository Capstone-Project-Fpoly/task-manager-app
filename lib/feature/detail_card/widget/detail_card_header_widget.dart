import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_quick_actions_widget.dart';

class DetailCardHeaderWidget extends ConsumerWidget {
  const DetailCardHeaderWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [bloc.isShowQuickActionsSubject],
      builder: (context) {
        return Container(
          padding: EdgeInsetsConstants.top20,
          width: width,
          color: ColorConstants.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ObsBuilder(
                streams: [bloc.cardSubject],
                builder: (context) {
                  return Padding(
                    padding: EdgeInsetsConstants.horizontal12,
                    child: TextField(
                      focusNode: bloc.focusNodeTitle,
                      controller: bloc.titleController,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onTap: () {
                        bloc.onTapTitle();
                      },
                    ),
                  );
                },
              ),
              // Padding(
              //   padding: EdgeInsetsConstants.horizontal12 +
              //       EdgeInsetsConstants.bottom16,
              //   child: const Text(
              //     'Name Board',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              const Divider(
                height: 0,
                color: ColorConstants.divider,
              ),
              Material(
                color: ColorConstants.white,
                child: InkWell(
                  onTap: () {
                    bloc.showQuickAction();
                  },
                  child: Padding(
                    padding: EdgeInsetsConstants.all12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Các thao tác nhanh',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        bloc.isShowQuickActionsSubject.value
                            ? const Icon(
                                Icons.keyboard_arrow_up,
                                color: ColorConstants.primary,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_down,
                                color: ColorConstants.primary,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              if (bloc.isShowQuickActionsSubject.value)
                const DetailCardQuickActionsWidget(),
            ],
          ),
        );
      },
    );
  }
}
