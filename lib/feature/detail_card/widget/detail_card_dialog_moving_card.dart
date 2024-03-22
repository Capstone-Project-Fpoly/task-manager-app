import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';

class DetailCardDialogMovingCardWidget extends ConsumerWidget {
  const DetailCardDialogMovingCardWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    // final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: 300,
                height: 50,
                decoration: const BoxDecoration(
                  color: ColorConstants.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBoxConstants.w10,
                    InkWell(
                      onTap: bloc.onBack,
                      child: const Icon(
                        Icons.clear,
                        color: ColorConstants.white,
                      ),
                    ),
                    SizedBoxConstants.w20,
                    const Text(
                      'Di chuyển thẻ',
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.check,
                      color: ColorConstants.white,
                    ),
                    SizedBoxConstants.w10,
                  ],
                ),
              ),
              SizedBoxConstants.h20,
              Padding(
                padding: EdgeInsetsConstants.horizontal10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bảng',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                alignment: Alignment.center,
                                child: Material(
                                  color: ColorConstants.transparent,
                                  child: Container(
                                    height: 350,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBoxConstants.h10,
                                        const Text(
                                          'Không gian làm việc',
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsetsConstants.vertical10,
                                          height: 310,
                                          width: 280,
                                          color: ColorConstants.white,
                                          child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding: EdgeInsetsConstants
                                                      .horizontal12,
                                                  width: 250,
                                                  height: 60,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 60,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorConstants
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Bảng $index',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(),
                                            itemCount: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const ListTile(
                          title: Text(
                            'Bảng',
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: SizedBox(
                            width: 5,
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.grey,
                    ),
                    SizedBoxConstants.h10,
                    const Text(
                      'Danh sách',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                alignment: Alignment.center,
                                child: Material(
                                  color: ColorConstants.transparent,
                                  child: Container(
                                    height: 350,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBoxConstants.h10,
                                        const Text(
                                          'Danh sách',
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsetsConstants.vertical10,
                                          height: 310,
                                          width: 280,
                                          color: ColorConstants.white,
                                          child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding: EdgeInsetsConstants
                                                      .horizontal12,
                                                  width: 250,
                                                  height: 60,
                                                  child: Text(
                                                    'Danh sách $index',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(),
                                            itemCount: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const ListTile(
                          title: Text(
                            'Danh sách',
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: SizedBox(
                            width: 5,
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.grey,
                    ),
                    SizedBoxConstants.h10,
                    const Text(
                      'Vị trí',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                alignment: Alignment.center,
                                child: Material(
                                  color: ColorConstants.transparent,
                                  child: Container(
                                    height: 350,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBoxConstants.h10,
                                        const Text(
                                          'Vị trí',
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsetsConstants.vertical10,
                                          height: 310,
                                          width: 280,
                                          color: ColorConstants.white,
                                          child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding: EdgeInsetsConstants
                                                      .horizontal12,
                                                  width: 250,
                                                  height: 60,
                                                  child: Text(
                                                    '$index',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(),
                                            itemCount: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const ListTile(
                          title: Text(
                            'Vị trí',
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: SizedBox(
                            width: 5,
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
