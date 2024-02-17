import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';

class AddBoardScreen extends ConsumerWidget {
  const AddBoardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.addBoard);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ObsBuilder(
      streams: [bloc.isLoadingSubject],
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
                          style: TextStyle(color: ColorConstants.primary),
                        ),
                        SizedBox(
                          height: 30,
                          child: TextFormField(
                            autofocus: true,
                            onChanged: (value) {
                              bloc.nameBoardSubject.value = value;
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
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
                    style: TextStyle(color: Colors.blue),
                  ),
                  const Row(
                    children: [
                      Text(
                        'Không gian làm việc',
                      ),
                      Spacer(),
                      Icon(Icons.arrow_drop_down),
                    ],
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
                        style: TextStyle(color: Colors.blue),
                      ),
                      const Spacer(),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
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
                      decoration: const BoxDecoration(
                        color: ColorConstants.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Tạo Bảng',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
