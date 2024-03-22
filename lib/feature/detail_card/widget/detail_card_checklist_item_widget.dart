import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/graphql/Fragment/check_list_fragment.graphql.dart';

class DetailCardChecklistItemWidget extends ConsumerStatefulWidget {
  const DetailCardChecklistItemWidget({
    super.key,
    required this.checkList,
    required this.onCheckListCheckBox,
    required this.onCheckListDeleted,
    required this.onCheckListChanged,
    required this.onTapFocus,
  });

  final Fragment$CheckListFragment checkList;
  final Function(Fragment$CheckListFragment item) onCheckListCheckBox;
  final Function(Fragment$CheckListFragment item) onCheckListDeleted;
  final Function(Fragment$CheckListFragment item, String text)
      onCheckListChanged;
  final VoidCallback onTapFocus;

  @override
  ConsumerState<DetailCardChecklistItemWidget> createState() =>
      _DetailCardChecklistItemWidgetState();
}

class _DetailCardChecklistItemWidgetState
    extends ConsumerState<DetailCardChecklistItemWidget> {
  final _controller = TextEditingController();
  bool isShowDeleteIcon = false;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.checkList.content;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          isShowDeleteIcon = true;
        });
      } else {
        setState(() {
          isShowDeleteIcon = false;
        });
      }
    });
  }

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsetsConstants.horizontal12,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    widget.onCheckListCheckBox.call(widget.checkList);
                  },
                  child: widget.checkList.isChecked
                      ? const Icon(
                          Icons.check_box_outlined,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.black,
                        ),
                ),
                SizedBoxConstants.w8,
                Expanded(
                  child: TextField(
                    focusNode: _focusNode,
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Thêm mục công việc',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: ColorConstants.black,
                      fontSize: 14,
                      decoration: widget.checkList.isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontStyle: widget.checkList.isChecked
                          ? FontStyle.italic
                          : FontStyle.normal,
                    ),
                    onChanged: (text) {
                      widget.onCheckListChanged.call(widget.checkList, text);
                    },
                    onTap: () {
                      widget.onTapFocus.call();
                      _focusNode.requestFocus();
                    },
                  ),
                ),
              ],
            ),
          ),
          if (isShowDeleteIcon)
            InkWell(
              onTap: () {
                widget.onCheckListDeleted.call(widget.checkList);
              },
              child: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
