import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/enum/detail_card_app_bar_enum.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_app_bar_enum_extension.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_app_bar.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_checklist_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_comment_field_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_datetime_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_member.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_header_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_label_widget.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_list_comment_widget.dart';
import 'package:task_manager/shared/enum/option_detail_card_enum.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';

class DetailCardScreen extends ConsumerWidget {
  const DetailCardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final width = MediaQuery.of(context).size.width;
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    return SafeArea(
      child: CupertinoPageScaffold(
        child: ObsBuilder(
          streams: [bloc.isLoadingSubject],
          builder: (context) {
            if (bloc.isLoadingSubject.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: DetailCardAddAppBar(bloc),
              backgroundColor: ColorConstants.backgroundDetailCard,
              body: ObsBuilder(
                streams: [bloc.appBarEnumSubject],
                builder: (context) {
                  final appBarEnum = bloc.appBarEnumSubject.value;
                  return SingleChildScrollView(
                    reverse: appBarEnum == DetailCardAppBarEnum.checklist,
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
                              ObsBuilder(
                                streams: [bloc.cardSubject],
                                builder: (context) {
                                  return SizedBox(
                                    width: width - 60,
                                    child: TextField(
                                      focusNode: bloc.focusNodeDescription,
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
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBoxConstants.h10,
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: appBarEnum == DetailCardAppBarEnum.label
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
                        const DetailCardChecklistWidget(),
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
              floatingActionButton: const DetailCardCommentFieldWidget(),
            );
          },
        ),
      ),
    );
  }
}
