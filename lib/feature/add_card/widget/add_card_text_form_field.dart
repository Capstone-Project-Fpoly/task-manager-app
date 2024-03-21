import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';


class AddCardTextFormField extends ConsumerWidget {
  const AddCardTextFormField({Key? key,}) : super(key: key);

  @override
  Widget build(context, ref) {
    final double width = MediaQuery.of(context).size.width;
    final bloc = ref.watch(BlocProvider.addCard);
    return  ObsBuilder(
        streams: [
          bloc.nameCardSubject,
          bloc.descriptionCardSubject,
        ],
        builder: (context)
    {
      return Column(
        children: [
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
                  'Tên Thẻ',
                  style: TextStyle(color: ColorConstants.grayText),
                ),
                SizedBox(
                  height: 30,
                  child: TextFormField(
                    focusNode: bloc.focusNodeName,
                    onChanged: (value) {
                      bloc.nameCardSubject.value = value;
                      bloc.checkNameCard();
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
          SizedBoxConstants.h12,
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
                  'Mô tả',
                  style: TextStyle(color: ColorConstants.grayText),
                ),
                SizedBox(
                  height: 30,
                  child: TextFormField(
                    focusNode: bloc.focusNodeDescription,
                    onChanged: (value) {
                      bloc.descriptionCardSubject.value = value;
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
        ],
      );
    },
    );
  }


}
