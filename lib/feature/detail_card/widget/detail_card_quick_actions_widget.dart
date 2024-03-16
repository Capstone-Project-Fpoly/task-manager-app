import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/feature/detail_card/widget/detail_card_dialog_member.dart';

class DetailCardQuickActionsWidget extends ConsumerWidget {
  const DetailCardQuickActionsWidget({super.key});

  @override
  Widget build(context, ref) {
    final bloc = ref.watch(BlocProvider.detailCardBloc);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 80,
      child: AnimatedSize(
        duration: const Duration(
          milliseconds: 500,
        ),
        child: SizedBox(
          width: width - 30,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                borderRadius: BorderRadius.circular(30),
                color: ColorConstants.primaryColorLight.withOpacity(0.3),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    bloc.onTapShowChecklist();
                  },
                  child: Ink(
                    width: (width - 30) / 2,
                    child: const ListTile(
                      leading: Icon(Icons.check_box_outlined),
                      title: Text(
                        'Thêm danh sách công việc',
                        style: TextStyle(
                          color: ColorConstants.primaryBlack,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(30),
                color: ColorConstants.primaryColorLight.withOpacity(0.3),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const DetailCardDialogMemberWidget();
                      },
                    );
                  },
                  child: Ink(
                    width: (width - 30) / 2,
                    child: const ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text(
                        'Thành viên',
                        style: TextStyle(
                          color: ColorConstants.primaryBlack,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
