import 'package:flutter/material.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class BoardDetailAppBarSearch extends StatelessWidget
    implements PreferredSizeWidget {
  const BoardDetailAppBarSearch(this.bloc, {Key? key, required})
      : super(key: key);
  final BoardDetailBloc bloc;
  @override
  AppBar build(BuildContext context) {
    final currentBoard = bloc.currentBoardSubject.value;
    final color = ColorUtils.getColorFromHex(currentBoard.color);
    final hslColor = HSLColor.fromColor(color);

    final darkerColor =
        hslColor.withLightness(hslColor.lightness * 0.5).toColor();
    return AppBar(
      leading: InkWell(
        onTap: () {
          bloc.onTapBack();
        },
        child: const Icon(Icons.arrow_back),
      ),
      title: TextField(
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Tìm kiếm thẻ...',
          border: InputBorder.none,
          hintStyle: AppTextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w100,
          ),
        ),
        style: const AppTextStyle.white(
          fontSize: 20,
        ),
        onChanged: (value) {
          bloc.searchLocalCard(value);
        },
      ),
      backgroundColor: darkerColor,
      leadingWidth: 50,
      actions: [
        Row(
          children: [
            InkWell(
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onTap: () {
                bloc.onTapClose();
              },
            ),
            SizedBoxConstants.w15,
            InkWell(
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onTap: () {
                bloc.onTapNotification();
              },
            ),
            SizedBoxConstants.w15,
            GestureDetector(
              onTap: () => bloc.onTapOpenMenuBoardScreen(),
              child: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            SizedBoxConstants.w10,
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
