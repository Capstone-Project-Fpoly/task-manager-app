import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/detail_card/detail_card_bloc.dart';
import 'package:task_manager/feature/detail_card/extension/detail_card_app_bar_enum_extension.dart';
import 'package:task_manager/shared/enum/option_detail_card_enum.dart';

class DetailCardAddAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final DetailCardBloc bloc;
  const DetailCardAddAppBar(this.bloc, {super.key});

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [bloc.appBarEnumSubject],
      builder: (context) {
        if (bloc.appBarEnumSubject.value == null) {
          return AppBar(
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
                onSelected: (value) => bloc.chooseOption(
                  idOption: value.id,
                  context: context,
                ),
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
          );
        }
        return bloc.appBarEnumSubject.value!.appBarBuilder(bloc);
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
