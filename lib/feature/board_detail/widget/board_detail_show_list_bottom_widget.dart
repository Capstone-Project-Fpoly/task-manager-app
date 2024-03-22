import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/board_detail/board_detail_bloc.dart';
import 'package:task_manager/graphql/Fragment/list_fragment.graphql.dart';

class BoardDetailShowListDetailBottomSheet extends ConsumerWidget {
  const BoardDetailShowListDetailBottomSheet({
    Key? key,
    required this.listFragment,
  }) : super(key: key);

  final Fragment$ListFragment listFragment;

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.boardDetail);
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
                          color: Colors.blueAccent,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        bloc.onTapBack();
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    alignment: Alignment.center,
                    child: Text(
                      listFragment.label,
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
              itemName: 'Sao chép danh sách',
              onTap: () {},
            ),
            itemSelect(
              itemName: 'Di chuyển danh sách',
              onTap: () {},
            ),
            itemSelect(
              itemName: 'Sắp xếp danh sách',
              onTap: () {},
            ),
            itemSelect(
              itemName: 'Xem',
              onTap: () {},
            ),
            SizedBoxConstants.h20,
            itemSelect(
              itemName: 'Di chuyển tất cả các thẻ trong danh sách này',
              onTap: () {},
            ),
            itemSelect(
              itemName: 'Xóa tất cả các thẻ trong danh sách này',
              onTap: () {},
            ),
            SizedBoxConstants.h20,
            itemSelect(
              isDelete: true,
              itemName: 'Xóa danh sách',
              onTap: () => bloc.onTapDeleteList(
                context: context,
                listFragment: listFragment,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container itemSelect({
    required String itemName,
    required VoidCallback onTap,
    bool? isDelete,
  }) {
    return Container(
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
              style: TextStyle(
                fontSize: 15,
                color: isDelete == null ? Colors.black : Colors.red,
              ),
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

  void dialogShow(
    BuildContext context,
    String title,
    String content,
    VoidCallback onTap,
    BoardDetailBloc bloc,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                bloc.onTapBack();
              },
              child: const Text('hủy'),
            ),
            TextButton(
              onPressed: () {
                onTap();
              },
              child: const Text('đồng ý'),
            ),
          ],
        );
      },
    );
  }
}
