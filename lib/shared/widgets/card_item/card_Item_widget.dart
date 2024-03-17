// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/shared/widgets/icons/avatar_default_icon.dart';

class CardItemWidget extends ConsumerWidget {
  CardItemWidget({super.key, required this.onTap});

  Fragment$CardFragment? card;
  VoidCallback onTap;

  //chỉ hiển thị những giá trị mà giá trị không null của card
  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsetsConstants.bottom4 + EdgeInsetsConstants.top8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (true)
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    'https://phunugioi.com/wp-content/uploads/2020/10/hinh-anh-thien-nhien-buon.jpg',
                    fit: BoxFit.cover, // Đảm bảo ảnh được đầy đủ trong phần cắt
                  ),
                ),
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsetsConstants.left12 +
                  EdgeInsetsConstants.top8 +
                  EdgeInsetsConstants.bottom8 +
                  EdgeInsetsConstants.right12,
              decoration: const BoxDecoration(
                color: Colors.white,
                //bo khi không có ảnh và khi có ảnh cover card
                // borderRadius: true
                //     ? BorderRadius.only(
                //         bottomRight: Radius.circular(10),
                //         bottomLeft: Radius.circular(10),
                //       )
                //     : BorderRadius.all(
                //         Radius.circular(10),
                //       ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Wrap(
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.end,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.05,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.blue,
                        ),
                      ),
                      SizedBoxConstants.h4,
                      const Text('name card'),
                      SizedBoxConstants.h4,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            size: 15,
                          ),
                          SizedBoxConstants.w4,
                          Container(
                            padding: EdgeInsetsConstants.all4,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              //thay đổi theo trạng thái hoàn thành
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_alarm,
                                  size: 12,
                                ),
                                SizedBoxConstants.w4,
                                /*có 3 trường hợp hiển thị text
                                * có ngày bắt đầu không có ngày kết thúc
                                * có ngày kết thúc nhưng không có ngày bắt đầu
                                * có cả ngày bắt đầu với ngày kết thúc*/
                                Text(
                                  'thời gian',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          SizedBoxConstants.w4,
                          //mo ta
                          const Icon(
                            Icons.menu,
                            size: 15,
                            color: Colors.grey,
                          ),

                          const Row(
                            children: [
                              SizedBoxConstants.w4,
                              Icon(
                                Icons.message,
                                size: 12,
                                color: Colors.grey,
                              ),
                              SizedBoxConstants.w2,
                              Text(
                                '1',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              SizedBoxConstants.w4,
                              Icon(
                                Icons.attach_file,
                                size: 12,
                                color: Colors.grey,
                              ),
                              SizedBoxConstants.w2,
                              Text(
                                '1',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              SizedBoxConstants.w4,
                              Icon(
                                Icons.check_box_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              SizedBoxConstants.w2,
                              Text(
                                '1/2',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBoxConstants.h4,
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const AvatarDefaultIcon(
                          width: 40,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 2,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
