import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/enum/board_status_enum.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class AddBoardScreen extends ConsumerWidget {
  const AddBoardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.addBoard);
    final double width = MediaQuery.of(context).size.width;
    return ObsBuilder(
      streams: [
        bloc.isLoadingSubject,
        bloc.colorButtonSubject,
        bloc.backgroundColorSubject,
      ],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tạo bảng'),
              leading: InkWell(
                onTap: () => bloc.onBackToBoardScreen(),
                child: const Icon(Icons.clear),
              ),
            ),
            body: Padding(
              padding: EdgeInsetsConstants.all12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBoxConstants.h5,
                  Container(
                    padding: EdgeInsetsConstants.vertical4 +
                        EdgeInsetsConstants.horizontal16,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Tên bảng',
                          style: AppTextStyle(color: ColorConstants.primary),
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            focusNode: bloc.focusNode,
                            onChanged: (value) {
                              bloc.nameBoardSubject.value = value;
                              bloc.onChanged();
                            },
                            style: const AppTextStyle(color: Colors.black),
                            textAlign: TextAlign.start,
                            decoration:const InputDecoration(
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: 1.5,
                    color: Colors.blue,
                  ),
                  SizedBoxConstants.h20,
                  const Text(
                    'Quyền xem',
                    style: AppTextStyle(color: Colors.blue),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) => BoardStatusEnum.values
                        .map(
                          (e) => PopupMenuItem(
                            value: e,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: const AppTextStyle(
                                    color: ColorConstants.black,
                                  ),
                                ),
                                SizedBoxConstants.h4,
                                Text(
                                  e.description,
                                  style: AppTextStyle(
                                    color:
                                        ColorConstants.black.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBoxConstants.h12,
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onSelected: (value) => bloc.chooseRight(value),
                    constraints: BoxConstraints(
                      minWidth: width - 50,
                    ),
                    child: ListTile(
                      title: Text(bloc.selectedStatusSubject.value.title),
                      trailing: const SizedBox(
                        width: 5,
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                    color: Colors.grey,
                  ),
                  SizedBoxConstants.h20,
                  Row(
                    children: [
                      const Text(
                        'Phông nền bảng',
                        style: AppTextStyle(color: Colors.blue),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          bloc.onNextToBackgroundBoardWidget();
                        },
                        child: Ink(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: bloc.backgroundColorSubject.value,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      bloc.onTapAddBoard();
                    },
                    child: Container(
                      width: width,
                      height: 45,
                      decoration: BoxDecoration(
                        color: bloc.colorButtonSubject.value,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Tạo Bảng',
                        style: AppTextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
