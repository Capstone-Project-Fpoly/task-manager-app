
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(BlocProvider.notificationBloc);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: ColorConstants.white,
          onPressed: () {
            bloc.onBackToBoardScreen();
          },
        ),
        title: const Text('Thông Báo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: ColorConstants.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsetsConstants.all12,
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    bloc.showOptionBottomSheet(context: context);
                  },
                  child: Container(
                    padding: EdgeInsetsConstants.vertical8 +
                        EdgeInsetsConstants.horizontal12,
                    alignment: Alignment.centerLeft,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 0.5,
                        color: ColorConstants.grayText,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    child: ObsBuilder(
                      streams: [bloc.selectedOptionSubject],
                      builder: (context) {
                        return Row(
                          children: [
                            Text(bloc.selectedOptionSubject.value == 0
                                ? 'Tất cả'
                                : bloc.selectedOptionSubject.value == 1
                                    ? 'Tôi'
                                    : bloc.selectedOptionSubject.value == 2
                                        ? 'Bình luận'
                                        : bloc.selectedOptionSubject.value == 3
                                            ? 'Yêu cầu tham gia'
                                            : 'Tất cả',),
                            SizedBoxConstants.h4,
                            const Icon(
                              Icons.arrow_drop_down,
                              color: ColorConstants.primaryBlack,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBoxConstants.w10,
                InkWell(
                  onTap: () {
                    //
                  },
                  child: Container(
                    padding: EdgeInsetsConstants.vertical8 +
                        EdgeInsetsConstants.horizontal12,
                    alignment: Alignment.centerLeft,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 0.5,
                        color: ColorConstants.grayText,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    child: Text('Đã đọc'),
                  ),
                ),
              ],
            ),
            SizedBoxConstants.h12,
            const Divider(
              height: 0,
              color: ColorConstants.divider,
            ),
            SizedBoxConstants.h12,
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Tuần này'),
            ),
            SizedBoxConstants.h12,
            ListView(
              shrinkWrap: true,
              children: [
                //Thêm user vào thẻ
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      AppCircleAvatar(
                        url: '',
                        width: width / 6.5,
                      ),
                      Container(
                        padding: EdgeInsetsConstants.left8,
                        width: width / 1.29,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.left,
                              softWrap: true,
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Lành ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'đã thêm bạn vào thẻ ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'sao chép danh sách ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'ở bảng ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Test',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBoxConstants.h8,
                            const Text(
                              '18:00, 22 thg 2',
                              style: AppTextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  color: ColorConstants.divider,
                ),
                //di chuyển thẻ
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      AppCircleAvatar(
                        url: '',
                        width: width / 6.5,
                      ),
                      Container(
                        padding: EdgeInsetsConstants.left8,
                        width: width / 1.29,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.left,
                              softWrap: true,
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Lành ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'đã di chuyển thẻ ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Màn hình Thông báo ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'tới danh sách ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Doing ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'ở bảng ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Test',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBoxConstants.h8,
                            const Text(
                              '18:00, 22 thg 2',
                              style: AppTextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  color: ColorConstants.divider,
                ),

                //Yêu cầu tham gia bảng
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      AppCircleAvatar(
                        url: '',
                        width: width / 6.5,
                      ),
                      Container(
                        padding: EdgeInsetsConstants.left8,
                        width: width / 1.29,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.left,
                              softWrap: true,
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Lành ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'đã mời bạn tham gia bảng ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Test ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBoxConstants.h8,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '18:00, 22 thg 2',
                                  style: AppTextStyle(fontSize: 12),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        // key: const ValueKey('1'),
                                        alignment: Alignment.center,
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: ColorConstants.accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: ColorConstants.white,
                                        ),
                                      ),
                                    ),
                                    SizedBoxConstants.w12,
                                    InkWell(
                                      child: Container(
                                        // key: const ValueKey('1'),
                                        alignment: Alignment.center,
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: ColorConstants.chipRed,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: ColorConstants.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  color: ColorConstants.divider,
                ),

                //Bình luận
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      AppCircleAvatar(
                        url: '',
                        width: width / 6.5,
                      ),
                      Container(
                        padding: EdgeInsetsConstants.left8,
                        width: width / 1.29,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.left,
                              softWrap: true,
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Lành ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'đã Bình Luận ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: '"abczzzzzzzzzzzzzz" ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'trong thẻ ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Card ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'ở trong danh sách ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'List ',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                  TextSpan(
                                    text: 'ở trong bảng ',
                                    style: AppTextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Test',
                                    style: AppTextStyle(
                                        fontWeight: FontWeight.w600,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBoxConstants.h8,
                            const Text(
                              '18:00, 22 thg 2',
                              style: AppTextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  color: ColorConstants.divider,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
