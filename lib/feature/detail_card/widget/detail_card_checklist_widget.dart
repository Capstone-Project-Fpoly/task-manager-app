import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_checklist_extension.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_checklist_item_widget.dart';
import 'package:task_manager/shared/widgets/progress_bar.dart';

class DetailCardChecklistWidget extends ConsumerWidget {
  const DetailCardChecklistWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: ColorConstants.white,
          padding: EdgeInsetsConstants.top12,
          width: width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsConstants.horizontal12,
                child: Row(
                  children: [
                    SizedBoxConstants.w6,
                    const Text(
                      'Danh sách công việc',
                      style: TextStyle(
                        color: ColorConstants.primaryBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        bloc.onChangeShowCheckList();
                      },
                      child: ObsBuilder(
                        streams: [bloc.isShowChecklistSubject],
                        builder: (context) {
                          final isShowChecklist =
                              bloc.isShowChecklistSubject.value;
                          return Icon(
                            !isShowChecklist
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: ColorConstants.primary,
                          );
                        },
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
              SizedBoxConstants.h12,
              ObsBuilder(
                streams: [bloc.listCheckListSubject],
                builder: (context) {
                  final listCheckList = bloc.listCheckListSubject.value;
                  final checkList =
                      listCheckList.map((e) => e.isChecked).toList();
                  return ProgressBar(checkList: checkList);
                },
              ),
              ObsBuilder(
                streams: [bloc.isShowChecklistSubject],
                builder: (context) {
                  final isShowChecklist = bloc.isShowChecklistSubject.value;
                  if (!isShowChecklist) {
                    return Container();
                  }
                  return Padding(
                    padding: EdgeInsetsConstants.horizontal12,
                    child: ObsBuilder(
                      streams: [bloc.listCheckListSubject],
                      builder: (context) {
                        final listCheckList = bloc.listCheckListSubject.value;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listCheckList.length,
                          itemBuilder: (context, index) {
                            final checkList = listCheckList[index];
                            return DetailCardChecklistItemWidget(
                              checkList: checkList,
                              onCheckListChanged: (item, text) {
                                bloc.onCheckListChanged(item, text);
                              },
                              onCheckListCheckBox: (item) {
                                bloc.onCheckListCheckBox(item);
                              },
                              onCheckListDeleted: (item) {
                                bloc.onCheckListDeleted(item);
                              },
                              onTapFocus: () {
                                bloc.onTapCheckListItem();
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
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
        ),
      ],
    );
  }
}
