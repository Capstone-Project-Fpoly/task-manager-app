import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/feature/background_board/background_board_bloc.dart';

class BackgroundBoardWidget extends ConsumerWidget {
  const BackgroundBoardWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.backgroundBoardBloc);
    return ObsBuilder(
      streams: [bloc.listColorSubject, bloc.isCheckSelected],
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Phông nền bảng'),
            leading: InkWell(
              onTap: () => bloc.onBackToAddBoardScreen(),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          body: Padding(
            padding: EdgeInsetsConstants.all12,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              children: bloc.listColorSubject.value
                  .map(
                    (data) => _item(data, bloc),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _item(ColorBackground color, BackgroundBoardBloc bloc) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        color.isSelected = true;
        bloc.onBackToAddBoardWithValue(color.color!);
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Color(int.tryParse('0XFF${color.color}') ?? 0XFFFFFFFF),
          borderRadius: BorderRadius.circular(5),
        ),
        child: color.isSelected == false
            ? Container()
            : const Icon(
                Icons.check,
                size: 30,
                color: ColorConstants.primaryBlack,
              ),
      ),
    );
  }
}
