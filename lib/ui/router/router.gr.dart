// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;

import '../../data/model/address/address.dart' as _i23;
import '../screen/auth/login/enter_pass/enter_pass_screen.dart' as _i7;
import '../screen/auth/login/login_screen.dart' as _i3;
import '../screen/auth/reset_pass/reset_pass_screen.dart' as _i8;
import '../screen/auth/signup/screen/verify_screen.dart' as _i6;
import '../screen/auth/signup/signup_screen.dart' as _i4;
import '../screen/auth/splash/splash_screen.dart' as _i2;
import '../screen/customer/home_customer/home_customer_screen.dart' as _i16;
import '../screen/main/add_address/add_address_screen.dart' as _i10;
import '../screen/main/address/address_screen.dart' as _i11;
import '../screen/main/main_screen.dart' as _i1;
import '../screen/main/notifications/notification_screen.dart' as _i13;
import '../screen/main/order/order_screen.dart' as _i9;
import '../screen/main/order/screens/order_success_screen.dart' as _i15;
import '../screen/main/setting/screen/update_info/update_info_screen.dart'
    as _i14;
import '../screen/main/setting/setting_screen.dart' as _i12;
import '../screen/main/welcome/welcome_screen.dart' as _i5;
import '../screen/shipper/home_shipper/home_shipper_screen.dart' as _i17;
import '../screen/shipper/home_shipper/screen/order_complete/order_complete_screen.dart'
    as _i20;
import '../screen/shipper/home_shipper/screen/order_list/order_list_screen.dart'
    as _i18;
import '../screen/shipper/home_shipper/screen/trips/trips_screen.dart' as _i19;

class AppRouter extends _i21.RootStackRouter {
  AppRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      final args =
          routeData.argsAs<MainPageArgs>(orElse: () => const MainPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.MainScreen(
          key: args.key,
          tabIndex: args.tabIndex,
        ),
      );
    },
    SplashPage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    SignupPage.name: (routeData) {
      final args = routeData.argsAs<SignupPageArgs>(
          orElse: () => const SignupPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SignupScreen(key: args.key),
      );
    },
    WelcomePage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WelcomeScreen(),
      );
    },
    VerifyPage.name: (routeData) {
      final args = routeData.argsAs<VerifyPageArgs>();
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.VerifyScreen(
          key: args.key,
          email: args.email,
          isSignup: args.isSignup,
          isForgotPass: args.isForgotPass,
        ),
      );
    },
    EnterPassPage.name: (routeData) {
      final args = routeData.argsAs<EnterPassPageArgs>();
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EnterPassScreen(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    ResetPassPage.name: (routeData) {
      final args = routeData.argsAs<ResetPassPageArgs>();
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ResetPassScreen(
          key: args.key,
          phone: args.phone,
          isSignup: args.isSignup,
        ),
      );
    },
    OrderPage.name: (routeData) {
      final args =
          routeData.argsAs<OrderPageArgs>(orElse: () => const OrderPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.OrderScreen(key: args.key),
      );
    },
    AddAddressPage.name: (routeData) {
      final args = routeData.argsAs<AddAddressPageArgs>(
          orElse: () => const AddAddressPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.AddAddressScreen(key: args.key),
      );
    },
    AddressPage.name: (routeData) {
      final args = routeData.argsAs<AddressPageArgs>();
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.AddressScreen(
          key: args.key,
          selectAddress: args.selectAddress,
          isDeliver: args.isDeliver,
        ),
      );
    },
    SettingPage.name: (routeData) {
      final args = routeData.argsAs<SettingPageArgs>(
          orElse: () => const SettingPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.SettingScreen(key: args.key),
      );
    },
    NotificationPage.name: (routeData) {
      final args = routeData.argsAs<NotificationPageArgs>(
          orElse: () => const NotificationPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.NotificationScreen(key: args.key),
      );
    },
    UpdateInfoPage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.UpdateInfoScreen(),
      );
    },
    OrderSuccessPage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.OrderSuccessScreen(),
      );
    },
    HomeCustomerPage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.HomeCustomerScreen(),
      );
    },
    HomeShipperPage.name: (routeData) {
      final args = routeData.argsAs<HomeShipperPageArgs>(
          orElse: () => const HomeShipperPageArgs());
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.HomeShipperScreen(key: args.key),
      );
    },
    OrderListPage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.OrderListScreen(),
      );
    },
    TripsPage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.TripsScreen(),
      );
    },
    OrderCompletePage.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.OrderCompleteScreen(),
      );
    },
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i21.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i21.RouteConfig(
          LoginPage.name,
          path: '/login',
        ),
        _i21.RouteConfig(
          SignupPage.name,
          path: '/signup',
        ),
        _i21.RouteConfig(
          WelcomePage.name,
          path: '/welcome',
        ),
        _i21.RouteConfig(
          VerifyPage.name,
          path: '/verify',
        ),
        _i21.RouteConfig(
          EnterPassPage.name,
          path: '/enter_pass',
        ),
        _i21.RouteConfig(
          ResetPassPage.name,
          path: '/reset_pass',
        ),
        _i21.RouteConfig(
          OrderPage.name,
          path: '/order',
        ),
        _i21.RouteConfig(
          AddAddressPage.name,
          path: '/add_address',
        ),
        _i21.RouteConfig(
          AddressPage.name,
          path: '/address',
        ),
        _i21.RouteConfig(
          SettingPage.name,
          path: '/setting',
        ),
        _i21.RouteConfig(
          NotificationPage.name,
          path: '/notification',
        ),
        _i21.RouteConfig(
          UpdateInfoPage.name,
          path: '/update_info',
        ),
        _i21.RouteConfig(
          OrderSuccessPage.name,
          path: '/order_success',
        ),
        _i21.RouteConfig(
          HomeCustomerPage.name,
          path: '/home_customer',
        ),
        _i21.RouteConfig(
          HomeShipperPage.name,
          path: '/home_shipper',
        ),
        _i21.RouteConfig(
          OrderListPage.name,
          path: '/order_list',
        ),
        _i21.RouteConfig(
          TripsPage.name,
          path: '/trips',
        ),
        _i21.RouteConfig(
          OrderCompletePage.name,
          path: '/order_complete',
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainPage extends _i21.PageRouteInfo<MainPageArgs> {
  MainPage({
    _i22.Key? key,
    int tabIndex = 0,
  }) : super(
          MainPage.name,
          path: '/main',
          args: MainPageArgs(
            key: key,
            tabIndex: tabIndex,
          ),
        );

  static const String name = 'MainPage';
}

class MainPageArgs {
  const MainPageArgs({
    this.key,
    this.tabIndex = 0,
  });

  final _i22.Key? key;

  final int tabIndex;

  @override
  String toString() {
    return 'MainPageArgs{key: $key, tabIndex: $tabIndex}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashPage extends _i21.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginPage extends _i21.PageRouteInfo<LoginPageArgs> {
  LoginPage({_i22.Key? key})
      : super(
          LoginPage.name,
          path: '/login',
          args: LoginPageArgs(key: key),
        );

  static const String name = 'LoginPage';
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignupScreen]
class SignupPage extends _i21.PageRouteInfo<SignupPageArgs> {
  SignupPage({_i22.Key? key})
      : super(
          SignupPage.name,
          path: '/signup',
          args: SignupPageArgs(key: key),
        );

  static const String name = 'SignupPage';
}

class SignupPageArgs {
  const SignupPageArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'SignupPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomePage extends _i21.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcome',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i6.VerifyScreen]
class VerifyPage extends _i21.PageRouteInfo<VerifyPageArgs> {
  VerifyPage({
    _i22.Key? key,
    required String email,
    bool isSignup = false,
    bool isForgotPass = false,
  }) : super(
          VerifyPage.name,
          path: '/verify',
          args: VerifyPageArgs(
            key: key,
            email: email,
            isSignup: isSignup,
            isForgotPass: isForgotPass,
          ),
        );

  static const String name = 'VerifyPage';
}

class VerifyPageArgs {
  const VerifyPageArgs({
    this.key,
    required this.email,
    this.isSignup = false,
    this.isForgotPass = false,
  });

  final _i22.Key? key;

  final String email;

  final bool isSignup;

  final bool isForgotPass;

  @override
  String toString() {
    return 'VerifyPageArgs{key: $key, email: $email, isSignup: $isSignup, isForgotPass: $isForgotPass}';
  }
}

/// generated route for
/// [_i7.EnterPassScreen]
class EnterPassPage extends _i21.PageRouteInfo<EnterPassPageArgs> {
  EnterPassPage({
    _i22.Key? key,
    required String phone,
  }) : super(
          EnterPassPage.name,
          path: '/enter_pass',
          args: EnterPassPageArgs(
            key: key,
            phone: phone,
          ),
        );

  static const String name = 'EnterPassPage';
}

class EnterPassPageArgs {
  const EnterPassPageArgs({
    this.key,
    required this.phone,
  });

  final _i22.Key? key;

  final String phone;

  @override
  String toString() {
    return 'EnterPassPageArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i8.ResetPassScreen]
class ResetPassPage extends _i21.PageRouteInfo<ResetPassPageArgs> {
  ResetPassPage({
    _i22.Key? key,
    required String phone,
    bool isSignup = false,
  }) : super(
          ResetPassPage.name,
          path: '/reset_pass',
          args: ResetPassPageArgs(
            key: key,
            phone: phone,
            isSignup: isSignup,
          ),
        );

  static const String name = 'ResetPassPage';
}

class ResetPassPageArgs {
  const ResetPassPageArgs({
    this.key,
    required this.phone,
    this.isSignup = false,
  });

  final _i22.Key? key;

  final String phone;

  final bool isSignup;

  @override
  String toString() {
    return 'ResetPassPageArgs{key: $key, phone: $phone, isSignup: $isSignup}';
  }
}

/// generated route for
/// [_i9.OrderScreen]
class OrderPage extends _i21.PageRouteInfo<OrderPageArgs> {
  OrderPage({_i22.Key? key})
      : super(
          OrderPage.name,
          path: '/order',
          args: OrderPageArgs(key: key),
        );

  static const String name = 'OrderPage';
}

class OrderPageArgs {
  const OrderPageArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'OrderPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.AddAddressScreen]
class AddAddressPage extends _i21.PageRouteInfo<AddAddressPageArgs> {
  AddAddressPage({_i22.Key? key})
      : super(
          AddAddressPage.name,
          path: '/add_address',
          args: AddAddressPageArgs(key: key),
        );

  static const String name = 'AddAddressPage';
}

class AddAddressPageArgs {
  const AddAddressPageArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'AddAddressPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.AddressScreen]
class AddressPage extends _i21.PageRouteInfo<AddressPageArgs> {
  AddressPage({
    _i22.Key? key,
    required dynamic Function(_i23.AddressSavedData) selectAddress,
    bool isDeliver = false,
  }) : super(
          AddressPage.name,
          path: '/address',
          args: AddressPageArgs(
            key: key,
            selectAddress: selectAddress,
            isDeliver: isDeliver,
          ),
        );

  static const String name = 'AddressPage';
}

class AddressPageArgs {
  const AddressPageArgs({
    this.key,
    required this.selectAddress,
    this.isDeliver = false,
  });

  final _i22.Key? key;

  final dynamic Function(_i23.AddressSavedData) selectAddress;

  final bool isDeliver;

  @override
  String toString() {
    return 'AddressPageArgs{key: $key, selectAddress: $selectAddress, isDeliver: $isDeliver}';
  }
}

/// generated route for
/// [_i12.SettingScreen]
class SettingPage extends _i21.PageRouteInfo<SettingPageArgs> {
  SettingPage({_i22.Key? key})
      : super(
          SettingPage.name,
          path: '/setting',
          args: SettingPageArgs(key: key),
        );

  static const String name = 'SettingPage';
}

class SettingPageArgs {
  const SettingPageArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'SettingPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.NotificationScreen]
class NotificationPage extends _i21.PageRouteInfo<NotificationPageArgs> {
  NotificationPage({_i22.Key? key})
      : super(
          NotificationPage.name,
          path: '/notification',
          args: NotificationPageArgs(key: key),
        );

  static const String name = 'NotificationPage';
}

class NotificationPageArgs {
  const NotificationPageArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'NotificationPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.UpdateInfoScreen]
class UpdateInfoPage extends _i21.PageRouteInfo<void> {
  const UpdateInfoPage()
      : super(
          UpdateInfoPage.name,
          path: '/update_info',
        );

  static const String name = 'UpdateInfoPage';
}

/// generated route for
/// [_i15.OrderSuccessScreen]
class OrderSuccessPage extends _i21.PageRouteInfo<void> {
  const OrderSuccessPage()
      : super(
          OrderSuccessPage.name,
          path: '/order_success',
        );

  static const String name = 'OrderSuccessPage';
}

/// generated route for
/// [_i16.HomeCustomerScreen]
class HomeCustomerPage extends _i21.PageRouteInfo<void> {
  const HomeCustomerPage()
      : super(
          HomeCustomerPage.name,
          path: '/home_customer',
        );

  static const String name = 'HomeCustomerPage';
}

/// generated route for
/// [_i17.HomeShipperScreen]
class HomeShipperPage extends _i21.PageRouteInfo<HomeShipperPageArgs> {
  HomeShipperPage({_i22.Key? key})
      : super(
          HomeShipperPage.name,
          path: '/home_shipper',
          args: HomeShipperPageArgs(key: key),
        );

  static const String name = 'HomeShipperPage';
}

class HomeShipperPageArgs {
  const HomeShipperPageArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'HomeShipperPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.OrderListScreen]
class OrderListPage extends _i21.PageRouteInfo<void> {
  const OrderListPage()
      : super(
          OrderListPage.name,
          path: '/order_list',
        );

  static const String name = 'OrderListPage';
}

/// generated route for
/// [_i19.TripsScreen]
class TripsPage extends _i21.PageRouteInfo<void> {
  const TripsPage()
      : super(
          TripsPage.name,
          path: '/trips',
        );

  static const String name = 'TripsPage';
}

/// generated route for
/// [_i20.OrderCompleteScreen]
class OrderCompletePage extends _i21.PageRouteInfo<void> {
  const OrderCompletePage()
      : super(
          OrderCompletePage.name,
          path: '/order_complete',
        );

  static const String name = 'OrderCompletePage';
}
