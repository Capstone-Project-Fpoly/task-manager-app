import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';
import 'package:task_manager/constants/size_box.dart';
import 'package:task_manager/shared/widgets/avatar/app_circle_avatar.dart';

class MenuBoardScreen extends ConsumerWidget {
  const MenuBoardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: const Text(
          'Menu Bảng',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              // Header
              Container(
                color: Colors.blueGrey[100],
                padding: EdgeInsetsConstants.all8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      padding:  EdgeInsetsConstants.all8,
                      child: IconButton(
                        icon: const Icon(Icons.star_outline),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      padding:  EdgeInsetsConstants.all8,
                      child: IconButton(
                        icon:const Icon(Icons.people_outline),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      padding:  EdgeInsetsConstants.all8,
                      child: IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      padding:  EdgeInsetsConstants.all8,
                      child: IconButton(
                        icon:const Icon(Icons.more_horiz),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
        
              // Chức năng
              Container(
                padding: EdgeInsetsConstants.all16,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                   const Row(
                      children: <Widget>[
                        Icon(Icons.person),
                        Text('Thành viên'),
                      ],
                    ),
                    SizedBoxConstants.h16,
                    // list danh sách thành viên tham gia vào bảng
                    GestureDetector(
                      onTap: (){},
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsetsConstants.left8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: const AppCircleAvatar(url:'https://i.pinimg.com/736x/00/37/50/0037502e2aee509d91c1da1cdf759156.jpg'  ?? ''),
                          );
                        },),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        fixedSize: Size(200, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text('Mời thành viên'),
                    ),
                  ],
                ),
              ),
              SizedBoxConstants.h8,
              Container(
                padding: EdgeInsets.all(16.0),
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
        
             SizedBoxConstants.h12,
              const Text('Hoạt động')
            ],
          ),
        ),
      ),
    );
  }
}
