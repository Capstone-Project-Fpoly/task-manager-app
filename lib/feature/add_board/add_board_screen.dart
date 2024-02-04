import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';

class AddBoardScreen extends ConsumerWidget {
  const AddBoardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.addBoard);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo bảng'),
        leading: InkWell(
          onTap: () => bloc.onBackToBoardScreen(),
          child: const Icon(Icons.clear),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsConstants.all12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxConstants.h5,
              Container(
                padding: EdgeInsetsConstants.vertical4 +
                    EdgeInsetsConstants.horizontal16,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
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
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                      child: TextFormField(
                        autofocus: true,
                        style: const TextStyle(color: Colors.white),
                        controller: bloc.nameBoardSubject.value,
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
            ],
          ),
        ),
      ),
    );
  }
}
