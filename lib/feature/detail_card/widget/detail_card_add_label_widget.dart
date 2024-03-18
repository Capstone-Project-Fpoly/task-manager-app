import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';

class DetailCardAddLabelWidget extends ConsumerWidget {
  const DetailCardAddLabelWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [bloc.listColorDefaultSubject],
      builder: (context) {
        return Container(
          height: 400,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nhãn mới'),
              SizedBox(
                width: width - 60,
                child: TextField(
                  focusNode: bloc.focusNodeChecklist,
                  controller: bloc.checklistController,
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
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                childAspectRatio: 1.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                children: bloc.listColorDefaultSubject.value
                    .map(
                      (data) => _item(color: data, bloc: bloc),
                    )
                    .toList(),
              ),
              const Spacer(),
              Material(
                color: ColorConstants.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                        bloc.onTapAddColorLabel();
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
    );
  }

  Widget _item({required ColorLabel color, required DetailCardBloc bloc}) {
    return InkWell(
      onTap: () {
        bloc.onTapSelectColorAddLabel(color);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(int.tryParse('0XFF${color.color}') ?? 0XFFFFFFFF),
          borderRadius: BorderRadius.circular(5),
        ),
        child: color.isSelected == false
            ? Container()
            : const Icon(
                Icons.check,
                size: 30,
                color: ColorConstants.primaryBlack,
              ),
      ),
    );
  }
}
