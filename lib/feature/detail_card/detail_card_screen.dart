import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_checklist_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_comment_field_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_datetime_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_member.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_header_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_label_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_list_comment_widget.dart';
import 'package:task_manager/shared/enum/option_detail_card_enum.dart';

class DetailCardScreen extends ConsumerWidget {
  const DetailCardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final width = MediaQuery.of(context).size.width;
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: ObsBuilder(
              streams: [
                bloc.isShowFloatingSubject,
                bloc.isShowLabelSubject,
                bloc.isShowTitleCommentSubject,
                bloc.isShowTitleChecklistSubject,
                bloc.isShowTitleDescriptionSubject,
              ],
              builder: (context) {
                if (bloc.isShowTitleDescriptionSubject.value) {
                  return const Text(
                    'Chỉnh sửa mô tả thẻ',
                    style: TextStyle(
                      color: ColorConstants.black,
                    ),
                  );
                }
                if (bloc.isShowLabelSubject.value) {
                  return const Text(
                    'Chỉnh sửa nhãn',
                    style: TextStyle(
                      color: ColorConstants.black,
                    ),
                  );
                }
                if (bloc.isShowTitleCommentSubject.value) {
                  return const Text(
                    'Bình luận mới',
                    style: TextStyle(
                      color: ColorConstants.black,
                    ),
                  );
                }
                if (bloc.isShowTitleChecklistSubject.value) {
                  return const Text(
                    'Mục mới',
                    style: TextStyle(
                      color: ColorConstants.black,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            backgroundColor: ColorConstants.transparent,
            leading: InkWell(
              onTap: () {
                bloc.onBackToBoardScreen();
              },
              child: const Icon(
                Icons.clear,
                color: ColorConstants.primary,
              ),
            ),
            actions: [
              (bloc.isShowTitleChecklistSubject.value ||
                      bloc.isShowTitleDescriptionSubject.value)
                  ? InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.check,
                        color: ColorConstants.primary,
                      ),
                    )
                  : PopupMenuButton(
                      itemBuilder: (context) => OptionDetailCardEnum.values
                          .map(
                            (e) => PopupMenuItem(
                              value: e,
                              child: Text(e.title),
                            ),
                          )
                          .toList(),
                      onSelected: (value) => bloc.chooseOption(
                        idOption: value.id,
                        context: context,
                      ),
                      constraints: BoxConstraints(
                        minWidth: width - 200,
                      ),
                      child: const Icon(
                        Icons.more_vert,
                        color: ColorConstants.primary,
                      ),
                    ),
              SizedBoxConstants.w12,
            ],
          ),
          backgroundColor: ColorConstants.backgroundDetailCard,
          body: ObsBuilder(
            streams: [
              bloc.isShowQuickActionsSubject,
              bloc.isShowLabelSubject,
              bloc.isShowOptionAllSubject,
              bloc.isShowChecklistSubject,
            ],
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBoxConstants.h40,
                    const DetailCardHeaderWidget(),
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
                            child: const Icon(
                              Icons.subject,
                              color: ColorConstants.primary,
                            ),
                          ),
                          SizedBox(
                            width: width - 60,
                            child: TextField(
                              focusNode: bloc.focusNode,
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
                              onTap: () {
                                bloc.onTapDescription();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBoxConstants.h10,
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      child: bloc.isShowLabelSubject.value
                          ? const DetailCardLabelWidget()
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
                                      child: const Icon(
                                        Icons.local_offer_outlined,
                                        color: ColorConstants.primary,
                                      ),
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
                            return const DetailCardDialogMemberWidget();
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
                              child: const Icon(
                                Icons.person_outline,
                                color: ColorConstants.primary,
                              ),
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
                    const DetailCardDateTimeWidget(),
                    SizedBoxConstants.h10,
                    bloc.isShowChecklistSubject.value
                        ? const DetailCardChecklistWidget()
                        : const SizedBox.shrink(),
                    SizedBoxConstants.h10,
                    const Divider(
                      height: 0,
                      color: ColorConstants.divider,
                    ),
                    SizedBoxConstants.h8,
                    const DetailCardListCommentWidget(),
                    SizedBoxConstants.h80,
                  ],
                ),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ObsBuilder(
            streams: [bloc.isShowFloatingSubject],
            builder: (BuildContext context) {
              return bloc.isShowFloatingSubject.value
                  ? const DetailCardCommentFieldWidget()
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
