import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class ListSearchByBoard extends ConsumerWidget {
  const ListSearchByBoard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final bloc = ref.watch(BlocProvider.myCard);
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1),
                bottom: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            padding: EdgeInsetsConstants.all8,
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                SizedBoxConstants.w12,
                Text(
                  // board!.title.toString(),
                  'Tên Bảng ${index + 1}',
                  style: const AppTextStyle.black(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsetsConstants.left16 + EdgeInsetsConstants.right16,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return const Column(
                  children: [
                    // CardItemWidget(),
                    SizedBoxConstants.h2,
                    Row(
                      children: [
                        Text(
                          'Tên Bảng',
                          style: AppTextStyle(
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
                          style: AppTextStyle(
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
        );
      },
    );
  }
}
