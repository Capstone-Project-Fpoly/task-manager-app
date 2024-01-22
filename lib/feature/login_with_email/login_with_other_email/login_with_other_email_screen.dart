import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/icons/trello_icon.dart';

class LoginWithOtherEmailScreen extends ConsumerWidget {

  LoginWithOtherEmailScreen({Key? key}) : super(key: key);
  bool checkValue = true;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
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
                  "Task Manager",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25),
                )
              ],
            ),
          ),
          SizedBoxConstants.h32,
          Text(checkValue ?"Đăng nhập để tiếp tục": "Đăng ký để tiếp tục "),
          SizedBoxConstants.h40,
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              // hintText: ,
              // hintStyle: ,
              // prefixIcon: ,
              // suffixIcon: ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color:Colors.white
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
