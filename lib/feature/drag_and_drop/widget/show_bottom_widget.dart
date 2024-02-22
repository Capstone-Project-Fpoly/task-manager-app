import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/drag_and_drop/drag_and_drop_bloc.dart';


class DragAndDropShowBottomSheet extends  ConsumerWidget{
  DragAndDropShowBottomSheet({Key? key, required this.nameList,required this.idList})
      : super(key: key);
  final String nameList;
  final String idList;

  Container itemSelect(
      BuildContext context,
      TextStyle style,
      String itemName,
      VoidCallback onTap,
      ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemName,
              style: style,
            ),
            itemName == 'Xem'
                ? Container()
                : Icon(
              Icons.navigate_next,
              color: Colors.black.withOpacity(0.5),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
  void dialogShow(BuildContext context, String title, String content,
      VoidCallback onTap, DragAndDropBloc bloc,) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title,style:const TextStyle(color: Colors.red,),),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                bloc.popSC();
              },
              child: const Text('hủy'),
            ),
            TextButton(
              onPressed: () {
                // Xử lý khi nhấn vào nút
                onTap();
              },
              child: const Text('đồng ý'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(context,ref) {
    final bloc = ref.watch(BlocProvider.dragAndDrop);
    const TextStyle style = TextStyle(fontSize: 15, color: Colors.black);
    const TextStyle styledele = TextStyle(fontSize: 15, color: Colors.red);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsetsConstants.left20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: GestureDetector(
                      child: const Text(
                        'Hủy',
                        style: TextStyle(
                          color: Colors.blueAccent, fontSize: 15,),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        bloc.popSC();
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    alignment: Alignment.center,
                    child: Text(
                      nameList,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              ),
            ),
            SizedBoxConstants.h20,
            itemSelect(
              context,
              style,
              'Sao chép danh sách',
                  () {},
            ),
            itemSelect(
              context,
              style,
              'Di chuyển danh sách',
                  () {},
            ),
            itemSelect(
              context,
              style,
              'Sắp xếp danh sách',
                  () {},
            ),
            itemSelect(
              context,
              style,
              'Xem',
                  () {},
            ),
            SizedBoxConstants.h20,
            itemSelect(
              context,
              style,
              'Di chuyển tất cả các thẻ trong danh sách này',
                  () {},
            ),
            itemSelect(
              context,
              style,
              'Xóa tất cả các thẻ trong danh sách này',
                  () {},
            ),
            SizedBoxConstants.h20,
            itemSelect(
              context,
              styledele,
              'Xóa danh sách',
                  () => dialogShow(context, 'Xóa danh sách', 'Bạn có muốn xóa danh sách ${nameList} không', () {
                bloc.onTapDeleteList(idList);
              }, bloc,),
            ),
          ],
        ),
      ),
    );;
  }
}
