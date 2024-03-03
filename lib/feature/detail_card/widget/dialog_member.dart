import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';

class DialogMemberWidget extends ConsumerWidget {
  const DialogMemberWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final double width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      builder: (context) {
        return Dialog(
          child: Container(
            width: width - 60,
            height: 180,
            color: ColorConstants.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsetsConstants.all16,
                  child: Text(
                    'Thành viên của thẻ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {},
                    child: Ink(
                      padding: EdgeInsetsConstants.vertical12,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsConstants.left12 +
                                EdgeInsetsConstants.right12,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                color: Colors.amber,
                                child: Text(
                                  'Khang'.toUpperCase().substring(0, 1),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Khang',
                            style: TextStyle(
                              color: ColorConstants.primaryBlack,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBoxConstants.h20,
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        bloc.onBack();
                      },
                      child: Ink(
                        child: const Text(
                          'Hoàn tất',
                          style: TextStyle(
                            color: ColorConstants.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBoxConstants.w12,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
