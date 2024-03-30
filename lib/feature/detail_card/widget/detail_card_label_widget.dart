import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_label_extension.dart';
import 'package:task_manager/graphql/Fragment/label_fragment.graphql.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class DetailCardLabelWidget extends ConsumerWidget {
  const DetailCardLabelWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [bloc.listLabelOfCardSubject],
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
                    child: ObsBuilder(
                      streams: [
                        bloc.listLabelOfBoardSubject,
                        bloc.listLabelOfCardSubject,
                      ],
                      builder: (context) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: bloc.listLabelOfBoardSubject.value.length,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, i) =>
                              SizedBoxConstants.h10,
                          itemBuilder: (context, i) {
                            final label = bloc.listLabelOfBoardSubject.value[i];
                            return itemLabel(
                              context: context,
                              width: width,
                              label: label,
                              bloc: bloc,
                            );
                          },
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
                        bloc.onTapOpenAddLabelBottomSheet(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 40,
                        child: const Text(
                          'Tạo nhãn mới',
                          style: AppTextStyle(
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

  Widget itemLabel({
    required BuildContext context,
    required double width,
    required Fragment$LabelFragment? label,
    required DetailCardBloc bloc,
  }) {
    final isSelected = bloc.listLabelOfCardSubject.value.contains(label);
    final backgroundColor = Color(
      int.parse(
        '0XFF${label?.color ?? '0000FF'}',
      ),
    );
    final textColor =
        backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  bloc.onTapToSelect(label);
                },
                child: Ink(
                  width: width - 95,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: backgroundColor,
                  ),
                  padding: EdgeInsetsConstants.left8,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      label?.title ?? '',
                      style: AppTextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: textColor,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            bloc.onTapOpenEditLabelBottomSheet(context, label: label);
          },
          child: Container(
            alignment: Alignment.centerRight,
            width: 35,
            child: const Icon(Icons.create),
          ),
        ),
      ],
    );
  }
}
