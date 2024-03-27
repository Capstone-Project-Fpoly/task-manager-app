import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/feature/my_card/widget/list_search_by_board_widget.dart';
import 'package:task_manager/feature/my_card/widget/list_search_by_date_widget.dart';
import 'package:task_manager/shared/widgets/drawer/app_drawer.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class MyCardScreen extends ConsumerWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(BlocProvider.myCard);
    return ObsBuilder(
      streams: [bloc.isFindCardByBoardSubject],
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.25),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              color: ColorConstants.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
                bloc.openSearch(false);
              },
            ),
            title: const Text(
              'Thẻ Của Tôi',
              style: AppTextStyle.white(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () => bloc.boardBloc.onTapToAddBoard(),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tạo bảng'),
                        SizedBoxConstants.w12,
                        TrelloIcon(
                          width: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tạo một thẻ'),
                        SizedBoxConstants.w12,
                        TrelloIcon(
                          width: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Duyệt các mẫu'),
                        SizedBoxConstants.w12,
                        TrelloIcon(
                          width: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    CupertinoIcons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBoxConstants.w20,
            ],
          ),
          drawer: const AppDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBoxConstants.h8,
              Padding(
                padding:
                    EdgeInsetsConstants.left12 + EdgeInsetsConstants.right8,
                child: Row(
                  children: [
                    PopupMenuButton(
                      itemBuilder: (context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          onTap: () => bloc.onSelectFilter(false),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: !bloc.isFindCardByBoardSubject.value
                                    ? const Icon(Icons.check)
                                    : null,
                              ),
                              const Text('Ngày hết hạn'),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          onTap: () => bloc.onSelectFilter(true),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: bloc.isFindCardByBoardSubject.value
                                    ? const Icon(Icons.check)
                                    : null,
                              ),
                              const Text('Bảng'),
                            ],
                          ),
                        ),
                      ],
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Icon(
                          Icons.sort,
                          size: 25,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    SizedBoxConstants.w8,
                    bloc.isFindCardByBoardSubject.value
                        ? const Expanded(
                            child: Text(
                              'Thẻ của tôi được sắp xếp theo bảng',
                              style: AppTextStyle.black(fontSize: 18),
                            ),
                          )
                        : const Expanded(
                            child: Text(
                              'Thẻ của tôi được sắp xếp theo ngày hết hạn',
                              style: AppTextStyle.black(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                  ],
                ),
              ),
              SizedBoxConstants.h8,
              ObsBuilder(
                streams: [bloc.isFocusSubject],
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        width: !bloc.isFocusSubject.value
                            ? MediaQuery.of(context).size.width * 0.95
                            : MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          controller: bloc.searchController,
                          decoration: InputDecoration(
                            hintText: 'Thẻ...',
                            border: InputBorder.none,
                            hintStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              CupertinoIcons.search,
                              size: 20,
                            ),
                            suffixIcon: bloc.isFocusSubject.value
                                ? IconButton(
                                    icon: const Icon(
                                      CupertinoIcons.clear_circled_solid,
                                      size: 15,
                                    ),
                                    onPressed: () => bloc.clearText(),
                                  )
                                : null,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            bloc.searchCard(value);
                          },
                          focusNode: bloc.focusNode,
                        ),
                      ),
                      bloc.isFocusSubject.value
                          ? GestureDetector(
                              onTap: () => bloc.unFocusNode(),
                              child: const Row(
                                children: [
                                  SizedBoxConstants.w8,
                                  Text(
                                    'Hủy',
                                    style: AppTextStyle.black(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  );
                },
              ),
              SizedBoxConstants.h8,
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: bloc.isFindCardByBoardSubject.value
                      ? const ListSearchByBoard()
                      : const ListSearchByDate(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
