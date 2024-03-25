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

class DetailCardAddLabelWidget extends ConsumerWidget {
  const DetailCardAddLabelWidget({super.key, required this.isAddLabel});
  final bool isAddLabel;

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [bloc.listLabelOfBoardSubject],
      builder: (context) {
        return Container(
          width: width,
          padding: EdgeInsetsConstants.all12 +
              EdgeInsetsConstants.horizontal4 +
              EdgeInsetsConstants.bottom8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nhãn mới',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: width - 60,
                child: TextField(
                  controller: bloc.labelController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Tên nhãn...',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              SizedBoxConstants.h10,
              ObsBuilder(
                streams: [
                  bloc.listLabelDefaultSubject,
                  bloc.labelSelectedAddSubject,
                ],
                builder: (context) {
                  return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 5,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    children: bloc.listLabelDefaultSubject.value
                        .map(
                          (data) => _item(
                            label: data,
                            bloc: bloc,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              SizedBoxConstants.h20,
              Material(
                color: ColorConstants.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!isAddLabel)
                      InkWell(
                        onTap: () {
                          bloc.onTapConfirmDeleteLabel(context);
                        },
                        child: const Text(
                          'Xóa',
                          style: TextStyle(
                            color: ColorConstants.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        bloc.onBack();
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
                        isAddLabel
                            ? bloc.onTapAddLabel()
                            : bloc.onTapEditLabel();
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
              Container(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _item({
    required Fragment$LabelFragment label,
    required DetailCardBloc bloc,
  }) {
    final isSelected = bloc.labelSelectedAddSubject.value?.color == label.color;
    final backgroundColor =
        Color(int.tryParse('0XFF${label.color}') ?? 0XFFFFFFFF);

    final iconColor =
        backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return InkWell(
      onTap: () {
        bloc.onTapSelectColorAddLabel(label);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: !isSelected
            ? Container()
            : Icon(
                Icons.check,
                size: 30,
                color: iconColor,
              ),
      ),
    );
  }
}
