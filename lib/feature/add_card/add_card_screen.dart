import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/add_card/widget/add_card_text_form_field.dart';
import 'package:task_manager/feature/add_card/widget/add_crad_date_time_picker.dart';
import 'package:task_manager/graphql/Fragment/board_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';
import 'package:task_manager/graphql/Fragment/user_fragment.graphql.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class AddCardScreen extends ConsumerWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final double width = MediaQuery.of(context).size.width;
    final bloc = ref.watch(BlocProvider.addCard);
    return ObsBuilder(
      streams: [
        bloc.listBoardSubject,
        bloc.isLoadingSubject,
        bloc.selectedBoardSubject,
        bloc.selectedListSubject,
        bloc.selectedTextListSubject,
        bloc.isSubmitSubject,
        bloc.isSubmitListSubject,
        bloc.listSelectedMemberSubject,
        bloc.selectedMemberSubject,
      ],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    bloc.onBackToBoardScreen();
                  },
                  child: const Icon(Icons.clear),
                ),
                title: const Text('Thêm thẻ'),
                actions: [
                  InkWell(
                    enableFeedback: bloc.isSubmitSubject.value &&
                        bloc.isSubmitListSubject.value,
                    onTap: () {
                      bloc.onTapAddCard();
                    },
                    child: Icon(
                      Icons.check,
                      color: bloc.isSubmitSubject.value &&
                              bloc.isSubmitListSubject.value
                          ? ColorConstants.white
                          : ColorConstants.backgroundColorApp,
                    ),
                  ),
                  SizedBoxConstants.w12,
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsetsConstants.all20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Bảng',
                            style: AppTextStyle.black(
                              fontSize: 14,
                              color: ColorConstants.grayText,
                            ),
                          ),
                          PopupMenuButton<Fragment$BoardFragment?>(
                            onSelected: (Fragment$BoardFragment? result) {
                              bloc.selectedBoardSubject.value = result;
                              bloc.getListByIdBoard();
                              bloc.memberBoard();
                            },
                            itemBuilder: (BuildContext context) => bloc
                                .listBoardSubject.value
                                .map((Fragment$BoardFragment? item) {
                              return PopupMenuItem<Fragment$BoardFragment?>(
                                value: item,
                                child: ListTile(
                                  leading: Container(
                                    width: 60,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: ColorUtils.getColorFromHex(
                                        item?.color,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  title: Text(
                                    item?.title ?? '',
                                    style: const AppTextStyle.black(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            constraints: BoxConstraints(
                              minWidth: width - 50,
                            ),
                            child: Container(
                              padding: EdgeInsetsConstants.right20 +
                                  EdgeInsetsConstants.left8 +
                                  EdgeInsetsConstants.vertical8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    bloc.selectedBoardSubject.value?.title ??
                                        'Bạn chưa tạo bảng nào',
                                    style: const AppTextStyle.black(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorConstants.darkColor,
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
                          SizedBoxConstants.h20,
                          const Text(
                            'Danh sách',
                            style: AppTextStyle.black(
                              fontSize: 14,
                              color: ColorConstants.grayText,
                            ),
                          ),
                          PopupMenuButton<Fragment$ListFragment?>(
                            onSelected: (Fragment$ListFragment? result) {
                              bloc.selectedListSubject.value = result;
                              bloc.isSubmitListSubject.value = true;
                              bloc.selectedTextListSubject.value =
                                  result?.label ?? '';
                            },
                            itemBuilder: (BuildContext context) => bloc
                                .listListSubject.value
                                .map((Fragment$ListFragment? item) {
                              return PopupMenuItem<Fragment$ListFragment?>(
                                value: item,
                                child: Text(item?.label ?? ''),
                              );
                            }).toList(),
                            constraints: BoxConstraints(
                              minWidth: width - 50,
                            ),
                            child: Container(
                              padding: EdgeInsetsConstants.right20 +
                                  EdgeInsetsConstants.left8 +
                                  EdgeInsetsConstants.vertical8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    bloc.selectedTextListSubject.value ??
                                        'Đang tải...',
                                  ),
                                  const SizedBox(
                                    width: 5,
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorConstants.darkColor,
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
                          SizedBoxConstants.h4,
                        ],
                      ),
                    ),
                    Container(
                      color: ColorConstants.backgroundColorApp,
                      padding: EdgeInsetsConstants.all16,
                      child: Container(
                        padding: EdgeInsetsConstants.all20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorConstants.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AddCardTextFormField(),
                            SizedBoxConstants.h12,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.person_outline,
                                  color: ColorConstants.secondaryText,
                                  size: 30,
                                ),
                                SizedBoxConstants.w12,
                                PopupMenuButton<Fragment$UserFragment?>(
                                  onSelected: (Fragment$UserFragment? result) {
                                    bloc.listSelectedMemberSubject.value
                                        .add(result);
                                  },
                                  itemBuilder: (BuildContext context) => bloc
                                      .listMemberSubject.value
                                      .map((Fragment$UserFragment? item) {
                                    return PopupMenuItem<
                                        Fragment$UserFragment?>(
                                      value: item,
                                      child: ListTile(
                                        title: Text(
                                          item?.fullName ?? '',
                                          style: const TextStyle(
                                            color: ColorConstants.primaryBlack,
                                          ),
                                        ),
                                        leading: AppCircleAvatar(
                                          url: item?.avatar ?? '',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  constraints: BoxConstraints(
                                    minWidth: width - 50,
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: ColorConstants.success,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: ColorConstants.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                SizedBoxConstants.w12,
                                SizedBox(
                                  width: width / 2,
                                  height: 40,
                                  child: ListView.builder(
                                    scrollDirection:
                                        Axis.horizontal, // Lướt ngang
                                    itemCount: bloc
                                        .listSelectedMemberSubject.value.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      bloc.selectedMemberSubject.value = bloc
                                          .listSelectedMemberSubject
                                          .value[index];
                                      return AppCircleAvatar(
                                        url: bloc.selectedMemberSubject.value
                                                ?.avatar ??
                                            '',
                                        width: 40,
                                        height: 40,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBoxConstants.h12,
                            const AddCardDateTimePicker(),
                            SizedBoxConstants.h24,
                            Row(
                              children: [
                                const Icon(
                                  Icons.attach_file_outlined,
                                  color: ColorConstants.secondaryText,
                                  size: 28,
                                ),
                                SizedBoxConstants.w12,
                                InkWell(
                                  onTap: () {
                                    //
                                  },
                                  child: const Text(
                                    'Tệp đính kèm...',
                                    style: AppTextStyle.black(
                                      fontSize: 14,
                                      color: ColorConstants.primaryBlack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
