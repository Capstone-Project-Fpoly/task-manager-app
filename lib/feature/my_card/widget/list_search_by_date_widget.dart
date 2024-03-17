import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/card_item/card_item_widget.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class ListSearchByDate extends ConsumerWidget {
  const ListSearchByDate({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final bloc = ref.watch(BlocProvider.myCard);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsetsConstants.all12,
                height: 60,
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.time),
                    SizedBoxConstants.w12,
                    Text(
                      // board!.title.toString(),
                      'Quá hạn',
                      style: AppTextStyle.black(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding:
                    EdgeInsetsConstants.left16 + EdgeInsetsConstants.right16,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return const Column(
                      children: [
                        CardItemWidget(),
                        SizedBoxConstants.h2,
                        Row(
                          children: [
                            Text(
                              'Tên Bảng',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBoxConstants.w4,
                            Text('trong danh sách'),
                            SizedBoxConstants.w4,
                            Text(
                              'Tên Danh Sách',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBoxConstants.h16,
                      ],
                    );
                  },
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsetsConstants.all12,
                height: 60,
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.time),
                    SizedBoxConstants.w12,
                    Text(
                      // board!.title.toString(),
                      'Hết hạn sau',
                      style: AppTextStyle.black(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding:
                    EdgeInsetsConstants.left16 + EdgeInsetsConstants.right16,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const Column(
                      children: [
                        CardItemWidget(),
                        SizedBoxConstants.h2,
                        Row(
                          children: [
                            Text(
                              'Tên Bảng',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBoxConstants.w4,
                            Text('trong danh sách'),
                            SizedBoxConstants.w4,
                            Text(
                              'Tên Danh Sách',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsetsConstants.all12,
                height: 60,
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.time),
                    SizedBoxConstants.w12,
                    Text(
                      // board!.title.toString(),
                      'Không có ngày hết hạn',
                      style: AppTextStyle.black(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding:
                    EdgeInsetsConstants.left16 + EdgeInsetsConstants.right16,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const Column(
                      children: [
                        CardItemWidget(),
                        SizedBoxConstants.h2,
                        Row(
                          children: [
                            Text(
                              'Tên Bảng',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBoxConstants.w4,
                            Text('trong danh sách'),
                            SizedBoxConstants.w4,
                            Text(
                              'Tên Danh Sách',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBoxConstants.h16,
          ],
        ),
      ),
    );
  }
}
