import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/login/login_screen.dart';
import 'package:shipf/ui/screen/main/bill/bill_screen.dart';
import 'package:shipf/ui/screen/main/feed/feed_screen.dart';
import 'package:shipf/ui/screen/main/home/home_screen.dart';
import 'package:shipf/ui/screen/main/route/route_screen.dart';
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

  final _screenListCustomer = [
    HomeScreen(),
    FeedScreen(),
    BillScreen(),
    RouteScreen()
  ];
  final _screenListShipper = [
    HomeScreen(),
    FeedScreen(),
    BillScreen(),
    RouteScreen()
  ];
  final _screenListBusiness = [
    HomeScreen(),
    FeedScreen(),
    BillScreen(),
    RouteScreen()
  ];

  final _screenListNotLogin = [FeedScreen(), LoginScreen()];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    RoleType? role = context.read<AppCubit>().state.role;

    getScreen() {
      if (role == RoleType.customer) {
        return _screenListCustomer[tabIndex];
      } else if (role == RoleType.shipper) {
        return _screenListShipper[tabIndex];
      } else if (role == RoleType.business) {
        return _screenListBusiness[tabIndex];
      } else {
        return _screenListNotLogin[tabIndex];
      }
    }

    final List<Widget> bottomBarNotLogin = [
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
                tabIndex == 0 ? Ionicons.home : Ionicons.home_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Trang Chủ',
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
                tabIndex == 1 ? Ionicons.newspaper : Ionicons.newspaper_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Bảng Tin',
                style: textBottomBar,
              )
            ],
          ),
        ),
      ),
    ];
    final List<Widget> bottomBarCustomer = [
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
                tabIndex == 0 ? Ionicons.home : Ionicons.home_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Trang Chủ',
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
                tabIndex == 1 ? Ionicons.newspaper : Ionicons.newspaper_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Bảng Tin',
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
                tabIndex == 2 ? Ionicons.list : Ionicons.list_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'DS Vận Đơn',
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
                tabIndex == 3 ? Ionicons.location : Ionicons.location_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Lộ Trình',
                style: textBottomBar,
              )
            ],
          ),
        ),
      ),
    ];
    final List<Widget> bottomBarShipper = [
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
                tabIndex == 0 ? Ionicons.home : Ionicons.home_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Trang Chủ',
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
                tabIndex == 1 ? Ionicons.newspaper : Ionicons.newspaper_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Bảng Tin',
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
              tabIndex = 2;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                tabIndex == 2 ? Ionicons.list : Ionicons.list_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'DS Vận Đơn',
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
                tabIndex == 3 ? Ionicons.location : Ionicons.location_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Lộ Trình',
                style: textBottomBar,
              )
            ],
          ),
        ),
      ),
    ];

    final List<Widget> bottomBarBusiness = [
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
                tabIndex == 0 ? Ionicons.home : Ionicons.home_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Trang Chủ',
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
                tabIndex == 1 ? Ionicons.newspaper : Ionicons.newspaper_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Bảng Tin',
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
                tabIndex == 2 ? Ionicons.list : Ionicons.list_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'DS Vận Đơn',
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
                tabIndex == 3 ? Ionicons.location : Ionicons.location_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Lộ Trình',
                style: textBottomBar,
              )
            ],
          ),
        ),
      ),
    ];
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
                  children: role == RoleType.customer
                      ? bottomBarCustomer
                      : role == RoleType.shipper
                          ? bottomBarShipper
                          : role == RoleType.business
                              ? bottomBarBusiness
                              : bottomBarNotLogin),
            ),
          )),
    );
  }
}
