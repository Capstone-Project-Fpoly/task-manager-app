import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/loading/loading_overlay.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';

class MenuBoardScreen extends ConsumerWidget {
  const MenuBoardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.menuBoardBloc);
    return ObsBuilder(
      streams: [bloc.isLoadingSubject],
      builder: (context) {
        return LoadingOverlay(
          isLoading: bloc.isLoadingSubject.value,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              elevation: 0.0,
              title: const Text(
                'Menu Bảng',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: bloc.onTapBack,
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.blueGrey[100],
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.blueGrey[100],
                      padding: EdgeInsetsConstants.all8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              margin: EdgeInsetsConstants.vertical4,
                              width: 70,
                              height: 50,
                              alignment: Alignment.center,
                              padding: EdgeInsetsConstants.all8,
                              child: const Icon(Icons.star_outline),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              margin: EdgeInsetsConstants.vertical4,
                              width: 70,
                              height: 50,
                              alignment: Alignment.center,
                              padding: EdgeInsetsConstants.all8,
                              child: const Icon(Icons.people_outline),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              margin: EdgeInsetsConstants.vertical4,
                              width: 70,
                              height: 50,
                              alignment: Alignment.center,
                              padding: EdgeInsetsConstants.all8,
                              child: const Icon(Icons.copy),
                            ),
                          ),
                          GestureDetector(
                            onTap: bloc.onTapSettingBoard,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              margin: EdgeInsetsConstants.vertical4,
                              width: 70,
                              height: 50,
                              alignment: Alignment.center,
                              padding: EdgeInsetsConstants.all8,
                              child: const Icon(Icons.more_horiz),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        margin: EdgeInsetsConstants.zero,
                        child: Container(
                          padding: EdgeInsetsConstants.all16,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.blue,
                                  ),
                                  SizedBoxConstants.w16,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Thành viên',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBoxConstants.h16,
                                        GestureDetector(
                                          onTap: () => bloc.onTapInviteMember(),
                                          child: SizedBox(
                                            height: 40,
                                            child: ObsBuilder(
                                              streams: [bloc.listMemberSubject],
                                              builder: (context) {
                                                final memberBoards = bloc.listMemberSubject.value;
                                                return ListView.builder(
                                                  itemCount: memberBoards.length,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    final memberBoard = memberBoards[index];
                                                    if (memberBoard == null) {
                                                      return const SizedBox();
                                                    }
                                                    return AppCircleAvatar(
                                                      url: memberBoard.avatar ?? '',
                                                      width: 45,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBoxConstants.h16,
                                        InkWell(
                                          onTap: bloc.onTapInviteMember,
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.blue[900],
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsetsConstants.vertical12,
                                            // Adjust padding as needed
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Mời thành viên',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBoxConstants.h8,
                    Card(
                      margin: EdgeInsetsConstants.zero,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        height: 60,
                        color: Colors.white,
                        child: const Row(
                          children: <Widget>[
                            Icon(Icons.info_outline_rounded),
                            SizedBox(width: 8),
                            Text('Thông tin về bảng'),
                          ],
                        ),
                      ),
                    ),
                    SizedBoxConstants.h12,
                    const Text('Hoạt động'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
