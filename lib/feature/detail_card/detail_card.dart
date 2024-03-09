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
import 'package:flutter_localizations/flutter_localizations.dart';

class DetailCard extends ConsumerWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'), // Tiếng Việt
      ],
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: ObsBuilder(
              streams: [bloc.isShowFloatingSubject, bloc.isShowLabelSubject],
              builder: (context) {
                if (!bloc.isShowFloatingSubject.value) {
                  return const Text(
                    'Chỉnh sửa mô tả thẻ',
                    style: TextStyle(
                      color: ColorConstants.black,
                    ),
                  );
                } else if (bloc.isShowLabelSubject.value) {
                  return const Text(
                    'Chỉnh sửa nhãn',
                    style: TextStyle(
                      color: ColorConstants.black,
                    ),
                  );
                } else {
                  return Container();
                }
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
                child: const Icon(
                  Icons.more_vert,
                  color: ColorConstants.primary,
                ),
              ),
              SizedBoxConstants.w12,
            ],
          ),
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
                            child: const Text(
                              'Name Board',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
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
                              const PopupMenuItem(
                                child: Text('Hiện thông báo'),
                              ),
                            ],
                            onSelected: (value) {
                              bloc.chooseOption();
                            },
                            constraints: BoxConstraints(
                              minWidth: width - 350,
                            ),
                            child: const Icon(
                              Icons.more_vert,
                              color: ColorConstants.primary,
                            ),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ObsBuilder(
            streams: [bloc.isShowFloatingSubject],
            builder: (BuildContext context) {
              return bloc.isShowFloatingSubject.value
                  ? const CommentFieldWidget()
                  : Container();
            },
          ),
        ),
      ),
    );
  }
}
