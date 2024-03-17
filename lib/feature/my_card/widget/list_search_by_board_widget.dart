import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/card_item/card_Item_widget.dart';
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
            decoration: const BoxDecoration(
              // color: darkerColor,
              color: Colors.blue,
              border: Border(
                  top: BorderSide(color: Colors.grey, width: 1),
                  bottom: BorderSide(color: Colors.grey, width: 1)),
            ),
            padding: EdgeInsetsConstants.all8,
            child: Text(
              // board!.title.toString(),
              'Tên Bảng ${index + 1}',
              style: const AppTextStyle.white(
                fontSize: 20,
              ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsetsConstants.left16 + EdgeInsetsConstants.right16,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    CardItemWidget(
                      onTap: () {},
                    ),
                    SizedBoxConstants.h2,
                    const Row(
                      children: [
                        Text('Tên Bảng',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,),),
                        SizedBoxConstants.w4,
                        Text('trong danh sách'),
                        SizedBoxConstants.w4,
                        Text('Tên Danh Sách',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,),),
                      ],
                    ),
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
