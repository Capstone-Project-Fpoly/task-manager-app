import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/icons/persion_add_icon.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';

class LoginWithEmailScreen extends ConsumerWidget {
  const LoginWithEmailScreen({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final bloc = ref.watch(BlocProvider.loginWithEmail);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBoxConstants.h36,
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            padding: EdgeInsetsConstants.top50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TrelloIcon(width: 50),
                SizedBoxConstants.w16,
                Text(
                  'Task Manager',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBoxConstants.h36,
          const Text(
            'Chọn hoặc thêm tài khoản khác',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBoxConstants.h8,
          SizedBox(
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.9,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                if (index < 7) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      padding: EdgeInsetsConstants.all4,
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TrelloIcon(
                            width: 30,
                          ),
                          SizedBoxConstants.w20,
                          Text('Tên người dùng'),
                        ],
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      bloc.onTapLoginOtherEmail();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsetsConstants.all4,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PersionAddIcon(
                            width: 30,
                          ),
                          SizedBoxConstants.w20,
                          Text('Người Dùng khác'),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const Text(
            'Task Manager hãy dùng theo cách của bạn',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
