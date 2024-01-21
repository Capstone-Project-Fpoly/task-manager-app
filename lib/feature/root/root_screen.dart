import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/feature/my_card/my_card_screen.dart';
import 'package:task_manager/feature/root/broad_screen.dart';
import 'package:task_manager/feature/root/page/broad_page.dart';
import 'package:task_manager/feature/root/page/my_broad_page.dart';
import 'package:task_manager/feature/setting/setting_screen.dart';
import 'package:task_manager/shared/app_bar/custom_app_bar.dart';
import 'package:task_manager/shared/widgets/text/app_text_style.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const HomePage();
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.broadScreen;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    String titleAppBar='';
    if (currentPage == DrawerSections.myBroadPage) {
      container = MyBroadPage();
      titleAppBar = 'Không gian làm việc của tôi';
    }else if (currentPage == DrawerSections.broadScreen) {
      container = BroadScreen();
      titleAppBar = 'Bảng';
    }
    else if (currentPage == DrawerSections.broadPage) {
      container = BroadPage();
      titleAppBar = 'Không gian làm việc';
    }
    return Scaffold(
      appBar:  CustomAppBar(title: titleAppBar, color: ColorConstants.primary),
      body: container,
      drawer: Drawer(
        surfaceTintColor: ColorConstants.white,
        backgroundColor: ColorConstants.white,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                otherAccountsPictures: [
                  IconButton(
                    color: Colors.white,
                    icon:const Icon(Icons.logout),
                    onPressed: () {
                      //Logout
                    },
                  ),
                ],
                decoration: const BoxDecoration(
                    color: ColorConstants.primary,
                   ),
                currentAccountPictureSize: const Size(65, 65),
                accountName: const Text(
                  'Pinkesh Darji',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: const Text(
                  'pinkesh@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),

                  child: Text(
                    'P',
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ),
              ),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, 'Bảng',Icons.group_outlined ,
            currentPage == DrawerSections.broadScreen ? true : false, false,),
          const Divider(color: Colors.black12,),
           Container(
             alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all( 8),
            child: const Text(
              'Các Không gian làm việc',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,),
            ),
          ),
          menuItem(2, 'Không gian làm việc của tôi', Icons.group_outlined,
              currentPage == DrawerSections.myBroadPage ? true : false, true,),
          menuItem(3, 'Không gian làm việc ', Icons.group_outlined,
              currentPage == DrawerSections.broadPage ? true : false, true,),
          const Divider(color: Colors.black12,),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 19),
            leading: const Icon(
              Icons.credit_card,
              size: 21,
            ),
            title: const Text(
              'Các thẻ của tôi',
              textAlign: TextAlign.start,
              style: AppTextStyle(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyCradScreen(),
                ),
              );
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 19),
            leading: const Icon(
              Icons.settings,
              size: 21,
            ),
            title: const Text(
              'Cài Đặt',
              textAlign: TextAlign.start,
              style: AppTextStyle(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
              //Navigator.pop(context);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 19),
            leading: const Icon(
              Icons.info_outline_rounded,
              size: 21,
            ),
            title: const Text(
              'Trợ giúp!',
              textAlign: TextAlign.start,
              style: AppTextStyle(),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected , bool detail) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.broadScreen;
            } else if (id == 2) {
              currentPage = DrawerSections.myBroadPage;
            } else if (id == 3) {
              currentPage = DrawerSections.broadPage;
            }
          });
        },
        child: Padding(
          padding: id==1 ? const EdgeInsets.fromLTRB(0,13,0,13) :const EdgeInsets.fromLTRB(6,13,6,13),
          child: Row(
            children: [
              Expanded(
                child: id!=1 ?Icon(
                  icon,
                  size: 20,
                  color:selected ? Colors.blue : Colors.black,
                ) : selected ?Image.asset(
                  width: 20,
                  height: 20,
                  'assets/images/icon_broad_color.png' ,
                ) : Image.asset(
                  width: 16,
                  height: 16,
                  'assets/images/icon_broad.png',
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  title,
                  style:  TextStyle(
                    color: selected ? Colors.blue : Colors.black,
                    fontSize: 14,
                    fontFamily: 'AvertaStdCY',
                  ),
                ),
              ),
              detail ? Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Image.asset(
                    width: 23,
                    height: 23,
                    'assets/images/icon_threedost.png',
                  ),
                ),
              ): const Text(''),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  broadScreen,
  myBroadPage,
  broadPage,
}
