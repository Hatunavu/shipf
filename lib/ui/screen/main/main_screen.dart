import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/ui/screen/main/feed/feed_screen.dart';
import 'package:shipf/ui/screen/main/home/home_screen.dart';
import 'package:shipf/ui/screen/main/notifications/notification_screen.dart';
import 'package:shipf/ui/screen/main/profile/profile_screen.dart';
import 'package:shipf/ui/screen/main/system/system_screen.dart';
import 'package:shipf/ui/theme/constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var tabIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  final _screenList = [
    HomeScreen(),
    SystemScreen(),
    FeedScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  getScreen() => _screenList[tabIndex];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: getScreen(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            backgroundColor: Colors.white,
            // selectedLabelStyle: TextStyle(fontSize: ),
            onTap: changeTabIndex,
            currentIndex: tabIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            unselectedItemColor: const Color(0xFF102536),
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      width: 30.w,
                      height: 30.w,
                      child: Icon(
                        Ionicons.home_outline,
                        size: 20.sp,
                      )),
                  label: 'Trang chủ'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      width: 30.w,
                      height: 30.w,
                      child: Icon(
                        Ionicons.heart_outline,
                        size: 20.sp,
                      )),
                  label: 'Hệ thống'),
              BottomNavigationBarItem(
                  icon: Container(
                      width: 30.w,
                      height: 30.w,
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      child: Icon(
                        Ionicons.navigate_circle_outline,
                        size: 20.sp,
                      )),
                  label: 'Bản tin'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      width: 30.w,
                      height: 30.w,
                      child: Icon(
                        Ionicons.chatbox_outline,
                        size: 20.sp,
                      )),
                  label: 'Thông báo'),
              BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                    width: 30.w,
                    height: 30.w,
                    child: Icon(
                      Ionicons.person_circle_outline,
                      size: 20.sp,
                    ),
                  ),
                  label: 'Tài khoản')
            ],
          ),
        ),
      ),
    );
  }
}
