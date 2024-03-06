import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/base/rx/obs_builder.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/shared/widgets/icons/board_image.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class SettingBoardScreen extends ConsumerWidget {
  const SettingBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(BlocProvider.settingBoardBloc);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            bloc.onBackToBoardScreen();
          },
        ),
        title: const Text(
          'Cài đặt bảng',
          style: AppTextStyle.black(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        color: ColorConstants.backgroundSetting,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ObsBuilder(
              streams: [bloc.backgroundColorSubject],
              builder: (context) {
                return Container(
                  height: height / 3.5,
                  width: width,
                  color: bloc.backgroundColorSubject.value,
                  padding: EdgeInsetsConstants.horizontal28,
                  child: const BoardImages(),
                );
              },
            ),
            Expanded(
              child: Container(
                color: ColorConstants.backgroundItems,
                width: width,
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'Tên bảng',
                        style: AppTextStyle.black(fontSize: 14),
                      ),
                      trailing: Text(
                        bloc.boardDetailBloc.boardFragment.title ?? '',
                        style: const AppTextStyle.black(
                          fontSize: 14,
                          color: ColorConstants.grayText,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: ColorConstants.divider,
                    ),
                    ListTile(
                      title: const Text(
                        'Phông nền',
                        style: AppTextStyle.black(fontSize: 14),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          bloc.onNextToBackgroundBoardWidget();
                        },
                        child: ObsBuilder(
                          streams: [bloc.backgroundColorSubject],
                          builder: (context) {
                            return Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: bloc.backgroundColorSubject.value,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: ColorConstants.divider,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'Quyền xem',
                        style: AppTextStyle.black(fontSize: 14),
                      ),
                      trailing: Text(
                        bloc.boardDetailBloc.boardFragment.isPublic
                            ? 'Công Khai'
                            : 'Riêng Tư',
                        style: const AppTextStyle.black(
                          fontSize: 14,
                          color: ColorConstants.grayText,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: ColorConstants.divider,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'Chỉnh sửa nhãn',
                        style: AppTextStyle.black(fontSize: 14),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: ColorConstants.divider,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'Ai có thể bình luận',
                        style: AppTextStyle.black(fontSize: 14),
                      ),
                      trailing: const Text(
                        'Thành Viên',
                        style: AppTextStyle.black(
                          fontSize: 14,
                          color: ColorConstants.grayText,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: ColorConstants.divider,
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'Đóng bảng',
                        style: AppTextStyle.black(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
