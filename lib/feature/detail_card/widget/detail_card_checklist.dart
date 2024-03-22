import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/enum/detail_card_app_bar_enum.dart';

class DetailCardChecklist extends ConsumerWidget {
  const DetailCardChecklist({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: ColorConstants.white,
          padding: EdgeInsetsConstants.all12,
          width: width,
          child: Row(
            children: [
              SizedBoxConstants.w6,
              const Text(
                'Danh sách công việc',
                style: TextStyle(
                  color: ColorConstants.primaryBlack,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.keyboard_arrow_up,
                  color: ColorConstants.primary,
                ),
              ),
              SizedBoxConstants.w12,
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'done',
                    child: Text('Đã hoàn thành'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      'Xóa',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                  ),
                ],
                onSelected: (value) {},
                constraints: BoxConstraints(
                  minWidth: width - 350,
                ),
                child: const Icon(
                  Icons.more_vert,
                  color: ColorConstants.primary,
                ),
              ),
            ],
          ),
        ),
        ObsBuilder(
          streams: [bloc.appBarEnumSubject],
          builder: (context) {
            if (bloc.appBarEnumSubject.value !=
                DetailCardAppBarEnum.checklist) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              width: width - 60,
              child: TextField(
                focusNode: bloc.focusNodeChecklist,
                controller: bloc.checklistController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Thêm mục...',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                maxLines: 5,
                minLines: 1,
                onTap: () {
                  bloc.onTapChecklistField();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
