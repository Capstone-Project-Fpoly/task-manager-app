import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/card_fragment.graphql.dart';
import 'package:task_manager/shared/utilities/datetime.dart';

class CardItemWidget extends ConsumerWidget {
  final Fragment$CardFragment? card;

  const CardItemWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context, ref) {
    final startDate =
        formatDateTimeNotification(card?.startedDate, format: 'dd MMM');
    final endDate = formatDateTimeNotification(card?.endDate, format: 'dd MMM');
    final countComment = card?.comments?.length ?? 0;
    final countCheckList = card?.checkLists?.length ?? 0;
    final countIsCheckedList =
        card?.checkLists?.where((e) => e.isChecked).toList().length;
    final isShow = endDate.isNotEmpty ||
        startDate.isNotEmpty ||
        countComment > 0 ||
        countCheckList > 0;
    final labels = card?.labels;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsetsConstants.bottom4 + EdgeInsetsConstants.top8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (false)
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
                borderRadius: const BorderRadius.only(
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
                EdgeInsetsConstants.bottom8 +
                EdgeInsetsConstants.right12,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            alignment: Alignment.centerLeft,
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
                    if (labels != null && labels.isNotEmpty)
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: labels
                            .map(
                              (e) => containerLabel(
                                e.color ?? '',
                              ),
                            )
                            .toList(),
                      ),
                    Text(
                      card?.title ?? '',
                      style: const TextStyle(color: Colors.black),
                    ),
                    if (isShow) SizedBoxConstants.h8,
                    Wrap(
                      children: [
                        if (startDate.isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsetsConstants.all2,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 14,
                                      color: Colors.black,
                                    ),
                                    SizedBoxConstants.w4,
                                    Text(
                                      'Bắt đầu: ${startDate}',
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBoxConstants.w8,
                            ],
                          ),
                        if (endDate.isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsetsConstants.all2,
                                decoration: BoxDecoration(
                                  color: Colors.yellow[100],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(3),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 14,
                                      color: Colors.black,
                                    ),
                                    SizedBoxConstants.w4,
                                    Text(
                                      endDate,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBoxConstants.w8,
                            ],
                          ),
                        if (countComment != null && countComment > 0)
                          Container(
                            margin: EdgeInsetsConstants.right8,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.chat_bubble_outline,
                                  size: 13,
                                  color: Colors.black,
                                ),
                                SizedBoxConstants.w2,
                                Text(
                                  '$countComment',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        if (countCheckList != null && countCheckList > 0)
                          Container(
                            padding: EdgeInsetsConstants.all2,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check_box_outlined,
                                  size: 14,
                                  color: Colors.black,
                                ),
                                SizedBoxConstants.w2,
                                Text(
                                  '$countIsCheckedList/$countCheckList',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
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
    );
  }

  Container containerLabel(String color) {
    final backgroundColor = Color(int.tryParse('0XFF${color}') ?? 0XFF0000FF);
    return Container(
      margin: EdgeInsetsConstants.top8 + EdgeInsetsConstants.bottom4,
      width: 30,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        color: backgroundColor,
      ),
    );
  }
}
