import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/icons/base/png_images.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class CustomToastNotification extends StatelessWidget {
  final String title;
  final String body;

  const CustomToastNotification({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimeOfDay sTime = TimeOfDay.now();
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 90,
      padding:
          EdgeInsetsConstants.vertical10 + EdgeInsetsConstants.horizontal20,
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const PngImages(
                  assetName: 'trello',
                  width: 35,
                  height: 35,
                  color: ColorConstants.backgroundColorApp,
                ),
                SizedBoxConstants.w12,
                Flexible(
                  child: Text(
                    body,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const AppTextStyle.black(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBoxConstants.w12,
          Text(
            '${sTime.hour}:${sTime.minute}',
            style: const AppTextStyle.black(
              fontSize: 14.0,
              color: ColorConstants.grayText,
            ),
          ),
        ],
      ),
    );
  }
}
