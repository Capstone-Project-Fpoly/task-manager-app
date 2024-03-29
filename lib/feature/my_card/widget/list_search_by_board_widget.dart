import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/utilities/color.dart';
import 'package:task_manager/shared/widgets/card_item/card_item_widget.dart';
import 'package:task_manager/shared/widgets/icons/empty.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class ListSearchByBoard extends ConsumerWidget {
  const ListSearchByBoard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.myCard);
    return RefreshIndicator(
      onRefresh: () async {
        bloc.getMyCards();
      },
      child: ObsBuilder(
        streams: [bloc.listBoardSubject, bloc.listCardSubject],
        builder: (context) {
          final boards = bloc.listBoardSubject.value;
          if (boards.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bạn hiện chưa có bảng nào...',
                    style: AppTextStyle(fontSize: 15),
                  ),
                  EmptyIcon(
                    width: 100,
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: boards.length,
            itemBuilder: (BuildContext context, int index) {
              final board = boards[index];
              final cards = bloc.listCardSubject.value
                  .where(
                    (element) => element?.boardId == board?.id,
                  )
                  .toList();
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  padding: EdgeInsetsConstants.all8,
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: ColorUtils.getColorFromHex(
                            board?.color,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      SizedBoxConstants.w12,
                      Text(
                        board?.title ?? '',
                        style: const AppTextStyle.black(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsetsConstants.horizontal40 +
                      EdgeInsetsConstants.top16,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cards.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = cards[index];
                      return InkWell(
                        onTap: () {
                          bloc.onTapToCardDetail(
                            idCard: item?.id,
                            idBoard: board?.id,
                          );
                        },
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CardItemWidget(
                            card: item,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
