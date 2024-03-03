import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/widget/comment_field_widget.dart';
import 'package:task_manager/feature/detail_card/widget/datetime_widget.dart';
import 'package:task_manager/feature/detail_card/widget/dialog_member.dart';
import 'package:task_manager/feature/detail_card/widget/label_widget.dart';
import 'package:task_manager/feature/detail_card/widget/quick_actions_widget.dart';
import 'package:task_manager/shared/enum/option_detail_card_enum.dart';

class DetailCard extends ConsumerWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        body: ObsBuilder(
          streams: [
            bloc.isShowQuickActionsSubject,
            bloc.isShowLabelSubject,
            bloc.isShowAllSubject,
          ],
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBoxConstants.h12,
                  Row(
                    children: [
                      SizedBoxConstants.w12,
                      InkWell(
                        onTap: () {
                          bloc.onBackToBoardScreen();
                        },
                        child: const Icon(Icons.clear),
                      ),
                      const Spacer(),
                      PopupMenuButton(
                        itemBuilder: (context) => OptionDetailCardEnum.values
                            .map(
                              (e) => PopupMenuItem(
                                value: e,
                                child: Text(e.title),
                              ),
                            )
                            .toList(),
                        onSelected: (value) => bloc.chooseOption(),
                        constraints: BoxConstraints(
                          minWidth: width - 200,
                        ),
                        child: const Icon(Icons.more_vert),
                      ),
                      SizedBoxConstants.w12,
                    ],
                  ),
                  SizedBoxConstants.h40,
                  Container(
                    padding: EdgeInsetsConstants.top20,
                    width: width,
                    color: ColorConstants.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsConstants.horizontal12 +
                              EdgeInsetsConstants.bottom16,
                          child: const Text(
                            'Name Card',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsConstants.horizontal12 +
                              EdgeInsetsConstants.bottom16,
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: ColorConstants.primaryBlack,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Name Board ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'in list ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'Name List',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Các thao tác nhanh',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  bloc.isShowQuickActionsSubject.value
                                      ? const Icon(Icons.keyboard_arrow_up)
                                      : const Icon(
                                          Icons.keyboard_arrow_down,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        bloc.isShowQuickActionsSubject.value
                            ? const QuickActionsWidget()
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBoxConstants.h10,
                  Container(
                    color: ColorConstants.white,
                    padding: EdgeInsetsConstants.horizontal12 +
                        EdgeInsetsConstants.bottom12,
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsetsConstants.top12,
                          alignment: Alignment.centerLeft,
                          width: 30,
                          child: const Icon(Icons.subject),
                        ),
                        SizedBox(
                          width: width - 60,
                          child: TextFormField(
                            controller: bloc.descriptionController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: 'Thêm mô tả thẻ...',
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            maxLines: 10,
                            minLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBoxConstants.h10,
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: bloc.isShowLabelSubject.value
                        ? const LabelWidget()
                        : InkWell(
                            onTap: () {
                              bloc.showLabel();
                            },
                            child: Ink(
                              color: ColorConstants.white,
                              padding: EdgeInsetsConstants.all12,
                              width: width,
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    alignment: Alignment.centerLeft,
                                    child:
                                        const Icon(Icons.local_offer_outlined),
                                  ),
                                  SizedBoxConstants.w6,
                                  const Text(
                                    'Nhãn...',
                                    style: TextStyle(
                                      color: ColorConstants.primaryBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  SizedBoxConstants.h10,
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const DialogMemberWidget();
                        },
                      );
                    },
                    child: Ink(
                      color: ColorConstants.white,
                      padding: EdgeInsetsConstants.all12,
                      width: width,
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            alignment: Alignment.centerLeft,
                            child: const Icon(Icons.person_outline),
                          ),
                          SizedBoxConstants.w6,
                          const Text(
                            'Thành viên...',
                            style: TextStyle(
                              color: ColorConstants.primaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBoxConstants.h10,
                  const DateTimeWidget(),
                  SizedBoxConstants.h10,
                  const Divider(
                    height: 0,
                    color: ColorConstants.divider,
                  ),
                  SizedBoxConstants.h8,
                  SizedBox(
                    width: width,
                    child: Row(
                      children: [
                        SizedBoxConstants.w12,
                        const Text(
                          'Hoạt động',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  const Text('Hiện chi tiết'),
                                  SizedBoxConstants.w20,
                                  ObsBuilder(
                                    streams: [bloc.isShowAllSubject],
                                    builder: (context) {
                                      return SizedBox(
                                        width: 20,
                                        child: Checkbox(
                                          value: bloc.isShowAllSubject.value,
                                          onChanged: (value) {
                                            bloc.changeCheckBoxAll();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            bloc.chooseOption();
                          },
                          constraints: BoxConstraints(
                            minWidth: width - 350,
                          ),
                          child: const Icon(Icons.more_vert),
                        ),
                        SizedBoxConstants.w12,
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const CommentFieldWidget(),
      ),
    );
  }
}
