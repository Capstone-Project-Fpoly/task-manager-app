import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class ListSearchByBoard extends ConsumerWidget {
  const ListSearchByBoard({super.key});


  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.myCard);
    return ObsBuilder(
      streams: [bloc.listSearchBoardOfMyCardSubject],
      builder: (context) {
        return ListView.builder(
          itemCount: bloc.listSearchBoardOfMyCardSubject.value.length,
          itemBuilder: (BuildContext context, int index) {
            final board = bloc.listSearchBoardOfMyCardSubject.value[index];
            final color = ColorUtils.getColorFromHex(board?.color);
            final hslColor = HSLColor.fromColor(color);
            final darkerColor =
                hslColor.withLightness(hslColor.lightness * 0.5).toColor();
            return ListTile(
              title: Container(
                decoration: BoxDecoration(
                  color: darkerColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                padding: EdgeInsetsConstants.all8,
                child: Text(
                  board!.title.toString(),
                  style: const AppTextStyle.white(
                    fontSize: 20,
                  ),
                ),
              ),
              subtitle: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('ListTile bên trong $index'),
                    onTap: () {},
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
