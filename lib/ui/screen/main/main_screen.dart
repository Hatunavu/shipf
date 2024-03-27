import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/login/login_screen.dart';
import 'package:shipf/ui/screen/customer/home_customer/home_customer_screen.dart';
import 'package:shipf/ui/screen/main/feed/feed_screen.dart';
import 'package:shipf/ui/screen/main/route/route_screen.dart';
import 'package:shipf/ui/screen/shipper/bill_shipper/bill_shipper_screen.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/home_shipper_screen.dart';
import 'package:shipf/ui/screen/shipper/post/post_screen.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class MainScreen extends StatefulWidget {
  final int tabIndex;
  const MainScreen({Key? key, this.tabIndex = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int tabIndex;
  @override
  void initState() {
    tabIndex = widget.tabIndex;
    super.initState();
  }

  final _screenListCustomer = [
    const HomeCustomerScreen(),
    RouteScreen(),
    RouteScreen(),
    PostScreen(),
  ];
  final _screenListShipper = [
    HomeShipperScreen(),
    FeedScreen(),
    const BillShipperScreen(),
    PostScreen(),
  ];

  final _screenListlogout = [
    FeedScreen(),
    LoginScreen(),
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    RoleType? role = context.read<AppCubit>().state.role;

    getScreen() {
      if (role == RoleType.customer || role == RoleType.business) {
        return _screenListCustomer[tabIndex];
      } else if (role == RoleType.shipper) {
        return _screenListShipper[tabIndex];
      } else {
        return _screenListlogout[tabIndex];
      }
    }

    final List<Widget> bottomBarlogout = [
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
                tabIndex == 0 ? Ionicons.newspaper : Ionicons.newspaper_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Tin Tức',
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
                tabIndex == 1 ? Ionicons.log_in : Ionicons.log_in_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Đăng Nhập',
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
                'Quản Lý Đơn',
                style: textBottomBar,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
                'Quản Lý COD',
                style: textBottomBar,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
                tabIndex == 3 ? Ionicons.search : Ionicons.search_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Tìm hàng',
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
                'Tin Tức',
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
                'Vận Đơn',
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
                tabIndex == 3 ? Ionicons.search : Ionicons.search_outline,
                size: 20.sp,
                color: primaryColor,
              ),
              VerticalSpace(2.h),
              Text(
                'Tìm hàng',
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
          backgroundColor: Colors.white,
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
                  children:
                      role == RoleType.customer || role == RoleType.business
                          ? bottomBarCustomer
                          : role == RoleType.shipper
                              ? bottomBarShipper
                              : bottomBarlogout),
            ),
          )),
    );
  }
}
