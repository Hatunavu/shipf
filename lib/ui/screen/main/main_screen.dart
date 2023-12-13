import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/feed/feed_screen.dart';
import 'package:shipf/ui/screen/main/home/home_screen.dart';
import 'package:shipf/ui/screen/main/notifications/notification_screen.dart';
import 'package:shipf/ui/screen/main/profile/profile_screen.dart';
import 'package:shipf/ui/screen/main/system/system_screen.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

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
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 0.5))),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          tabIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tabIndex == 0
                                ? Ionicons.home
                                : Ionicons.home_outline,
                            size: 20.sp,
                            color: primaryColor,
                          ),
                          VerticalSpace(2.h),
                          Text(
                            'Trang chủ',
                            style: textBottomBar,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          tabIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tabIndex == 1
                                ? Ionicons.newspaper
                                : Ionicons.newspaper_outline,
                            size: 20.sp,
                            color: primaryColor,
                          ),
                          VerticalSpace(2.h),
                          Text(
                            'Bản tin',
                            style: textBottomBar,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context.router.push(OrderPage());
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 35.w,
                            width: 35.w,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(13)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          tabIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tabIndex == 2
                                ? Ionicons.list
                                : Ionicons.list_outline,
                            size: 20.sp,
                            color: primaryColor,
                          ),
                          VerticalSpace(2.h),
                          Text(
                            'Hóa đơn',
                            style: textBottomBar,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          tabIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tabIndex == 3
                                ? Ionicons.location
                                : Ionicons.location_outline,
                            size: 20.sp,
                            color: primaryColor,
                          ),
                          VerticalSpace(2.h),
                          Text(
                            'Lộ trình',
                            style: textBottomBar,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
