import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:shipf/ui/router/app_router.dart';
import 'package:shipf/ui/screen/auth/login/enter_pass/enter_pass_screen.dart';
import 'package:shipf/ui/screen/auth/login/login_screen.dart';
import 'package:shipf/ui/screen/auth/reset_pass/reset_pass_screen.dart';
import 'package:shipf/ui/screen/auth/signup/screen/verify_screen.dart';
import 'package:shipf/ui/screen/auth/signup/signup_screen.dart';
import 'package:shipf/ui/screen/auth/splash/splash_screen.dart';
import 'package:shipf/ui/screen/customer/home_customer/home_customer_screen.dart';
import 'package:shipf/ui/screen/main/add_address/add_address_screen.dart';
import 'package:shipf/ui/screen/main/address/address_screen.dart';
import 'package:shipf/ui/screen/main/main_screen.dart';
import 'package:shipf/ui/screen/main/notifications/notification_screen.dart';
import 'package:shipf/ui/screen/main/order/order_screen.dart';
import 'package:shipf/ui/screen/main/order/screens/order_success_screen.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/update_info_screen.dart';
import 'package:shipf/ui/screen/main/setting/setting_screen.dart';
import 'package:shipf/ui/screen/main/welcome/welcome_screen.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/home_shipper_screen.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_list/order_list_screen.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/trips/trips_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainScreen, name: "MainPage", path: AppRoutes.mainScreen),
    AutoRoute(
        page: SplashScreen,
        name: "SplashPage",
        path: AppRoutes.splashScreen,
        initial: true),

    AutoRoute(
      page: LoginScreen,
      name: "LoginPage",
      path: AppRoutes.loginScreen,
    ),
    AutoRoute(
      page: SignupScreen,
      name: "SignupPage",
      path: AppRoutes.signupScreen,
    ),
    AutoRoute(
      page: WelcomeScreen,
      name: "WelcomePage",
      path: AppRoutes.welcomeScreen,
    ),
    AutoRoute(
      page: VerifyScreen,
      name: "VerifyPage",
      path: AppRoutes.verifyScreen,
    ),
    AutoRoute(
      page: EnterPassScreen,
      name: "EnterPassPage",
      path: AppRoutes.enterPassScreen,
    ),
    AutoRoute(
      page: ResetPassScreen,
      name: "ResetPassPage",
      path: AppRoutes.resetPassScreen,
    ),
    AutoRoute(
      page: OrderScreen,
      name: "OrderPage",
      path: AppRoutes.orderScreen,
    ),
    AutoRoute(
      page: AddAddressScreen,
      name: "AddAddressPage",
      path: AppRoutes.addAddressScreen,
    ),
    AutoRoute(
      page: AddressScreen,
      name: "AddressPage",
      path: AppRoutes.addressScreen,
    ),
    AutoRoute(
      page: SettingScreen,
      name: "SettingPage",
      path: AppRoutes.settingScreen,
    ),
    AutoRoute(
      page: NotificationScreen,
      name: "NotificationPage",
      path: AppRoutes.notificationScreen,
    ),
    AutoRoute(
      page: UpdateInfoScreen,
      name: "UpdateInfoPage",
      path: AppRoutes.updateInfoScreen,
    ),
    AutoRoute(
      page: OrderSuccessScreen,
      name: "OrderSuccessPage",
      path: AppRoutes.orderSuccessScreen,
    ),

    //customer
    AutoRoute(
      page: HomeCustomerScreen,
      name: "HomeCustomerPage",
      path: AppRoutes.homeCustomerScreen,
    ),
    //shipper
    AutoRoute(
      page: HomeShipperScreen,
      name: "HomeShipperPage",
      path: AppRoutes.homeShipperScreen,
    ),
    AutoRoute(
      page: OrderListScreen,
      name: "OrderListPage",
      path: AppRoutes.orderList,
    ),
    AutoRoute(
      page: TripsScreen,
      name: "TripsPage",
      path: AppRoutes.trips,
    ),
  ],
)
class $AppRouter {}

Widget slideBottomToTop(context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.fastLinearToSlowEaseIn;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
