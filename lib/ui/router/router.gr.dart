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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../../data/model/address/address.dart' as _i18;
import '../screen/auth/login/enter_pass/enter_pass_screen.dart' as _i8;
import '../screen/auth/login/login_screen.dart' as _i4;
import '../screen/auth/reset_pass/reset_pass_screen.dart' as _i9;
import '../screen/auth/signup/screen/verify_screen.dart' as _i7;
import '../screen/auth/signup/signup_screen.dart' as _i5;
import '../screen/auth/splash/splash_screen.dart' as _i2;
import '../screen/main/add_address/add_address_screen.dart' as _i11;
import '../screen/main/address/address_screen.dart' as _i12;
import '../screen/main/home/home_screen.dart' as _i3;
import '../screen/main/main_screen.dart' as _i1;
import '../screen/main/notifications/notification_screen.dart' as _i14;
import '../screen/main/order/order_screen.dart' as _i10;
import '../screen/main/setting/screen/update_info/update_info_screen.dart'
    as _i15;
import '../screen/main/setting/setting_screen.dart' as _i13;
import '../screen/main/welcome/welcome_screen.dart' as _i6;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainScreen(),
      );
    },
    SplashPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.LoginScreen(key: args.key),
      );
    },
    SignupPage.name: (routeData) {
      final args = routeData.argsAs<SignupPageArgs>(
          orElse: () => const SignupPageArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SignupScreen(key: args.key),
      );
    },
    WelcomePage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.WelcomeScreen(),
      );
    },
    VerifyPage.name: (routeData) {
      final args = routeData.argsAs<VerifyPageArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.VerifyScreen(
          key: args.key,
          email: args.email,
          isSignup: args.isSignup,
          isForgotPass: args.isForgotPass,
        ),
      );
    },
    EnterPassPage.name: (routeData) {
      final args = routeData.argsAs<EnterPassPageArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EnterPassScreen(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    ResetPassPage.name: (routeData) {
      final args = routeData.argsAs<ResetPassPageArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ResetPassScreen(
          key: args.key,
          phone: args.phone,
          isSignup: args.isSignup,
        ),
      );
    },
    OrderPage.name: (routeData) {
      final args =
          routeData.argsAs<OrderPageArgs>(orElse: () => const OrderPageArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.OrderScreen(key: args.key),
      );
    },
    AddAddressPage.name: (routeData) {
      final args = routeData.argsAs<AddAddressPageArgs>(
          orElse: () => const AddAddressPageArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.AddAddressScreen(key: args.key),
      );
    },
    AddressPage.name: (routeData) {
      final args = routeData.argsAs<AddressPageArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.AddressScreen(
          key: args.key,
          selectAddress: args.selectAddress,
          isDeliver: args.isDeliver,
        ),
      );
    },
    SettingPage.name: (routeData) {
      final args = routeData.argsAs<SettingPageArgs>(
          orElse: () => const SettingPageArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.SettingScreen(key: args.key),
      );
    },
    NotificationPage.name: (routeData) {
      final args = routeData.argsAs<NotificationPageArgs>(
          orElse: () => const NotificationPageArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.NotificationScreen(key: args.key),
      );
    },
    UpdateInfoPage.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.UpdateInfoScreen(),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i16.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i16.RouteConfig(
          HomePage.name,
          path: '/home',
        ),
        _i16.RouteConfig(
          LoginPage.name,
          path: '/login',
        ),
        _i16.RouteConfig(
          SignupPage.name,
          path: '/signup',
        ),
        _i16.RouteConfig(
          WelcomePage.name,
          path: '/welcome',
        ),
        _i16.RouteConfig(
          VerifyPage.name,
          path: '/verify',
        ),
        _i16.RouteConfig(
          EnterPassPage.name,
          path: '/enter_pass',
        ),
        _i16.RouteConfig(
          ResetPassPage.name,
          path: '/reset_pass',
        ),
        _i16.RouteConfig(
          OrderPage.name,
          path: '/order',
        ),
        _i16.RouteConfig(
          AddAddressPage.name,
          path: '/add_address',
        ),
        _i16.RouteConfig(
          AddressPage.name,
          path: '/address',
        ),
        _i16.RouteConfig(
          SettingPage.name,
          path: '/setting',
        ),
        _i16.RouteConfig(
          NotificationPage.name,
          path: '/notification',
        ),
        _i16.RouteConfig(
          UpdateInfoPage.name,
          path: '/update_info',
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainPage extends _i16.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/main',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashPage extends _i16.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i3.HomeScreen]
class HomePage extends _i16.PageRouteInfo<HomePageArgs> {
  HomePage({_i17.Key? key})
      : super(
          HomePage.name,
          path: '/home',
          args: HomePageArgs(key: key),
        );

  static const String name = 'HomePage';
}

class HomePageArgs {
  const HomePageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'HomePageArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.LoginScreen]
class LoginPage extends _i16.PageRouteInfo<LoginPageArgs> {
  LoginPage({_i17.Key? key})
      : super(
          LoginPage.name,
          path: '/login',
          args: LoginPageArgs(key: key),
        );

  static const String name = 'LoginPage';
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SignupScreen]
class SignupPage extends _i16.PageRouteInfo<SignupPageArgs> {
  SignupPage({_i17.Key? key})
      : super(
          SignupPage.name,
          path: '/signup',
          args: SignupPageArgs(key: key),
        );

  static const String name = 'SignupPage';
}

class SignupPageArgs {
  const SignupPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'SignupPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.WelcomeScreen]
class WelcomePage extends _i16.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcome',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i7.VerifyScreen]
class VerifyPage extends _i16.PageRouteInfo<VerifyPageArgs> {
  VerifyPage({
    _i17.Key? key,
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

  final _i17.Key? key;

  final String email;

  final bool isSignup;

  final bool isForgotPass;

  @override
  String toString() {
    return 'VerifyPageArgs{key: $key, email: $email, isSignup: $isSignup, isForgotPass: $isForgotPass}';
  }
}

/// generated route for
/// [_i8.EnterPassScreen]
class EnterPassPage extends _i16.PageRouteInfo<EnterPassPageArgs> {
  EnterPassPage({
    _i17.Key? key,
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

  final _i17.Key? key;

  final String phone;

  @override
  String toString() {
    return 'EnterPassPageArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i9.ResetPassScreen]
class ResetPassPage extends _i16.PageRouteInfo<ResetPassPageArgs> {
  ResetPassPage({
    _i17.Key? key,
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

  final _i17.Key? key;

  final String phone;

  final bool isSignup;

  @override
  String toString() {
    return 'ResetPassPageArgs{key: $key, phone: $phone, isSignup: $isSignup}';
  }
}

/// generated route for
/// [_i10.OrderScreen]
class OrderPage extends _i16.PageRouteInfo<OrderPageArgs> {
  OrderPage({_i17.Key? key})
      : super(
          OrderPage.name,
          path: '/order',
          args: OrderPageArgs(key: key),
        );

  static const String name = 'OrderPage';
}

class OrderPageArgs {
  const OrderPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'OrderPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.AddAddressScreen]
class AddAddressPage extends _i16.PageRouteInfo<AddAddressPageArgs> {
  AddAddressPage({_i17.Key? key})
      : super(
          AddAddressPage.name,
          path: '/add_address',
          args: AddAddressPageArgs(key: key),
        );

  static const String name = 'AddAddressPage';
}

class AddAddressPageArgs {
  const AddAddressPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'AddAddressPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.AddressScreen]
class AddressPage extends _i16.PageRouteInfo<AddressPageArgs> {
  AddressPage({
    _i17.Key? key,
    required dynamic Function(_i18.AddressSavedData) selectAddress,
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

  final _i17.Key? key;

  final dynamic Function(_i18.AddressSavedData) selectAddress;

  final bool isDeliver;

  @override
  String toString() {
    return 'AddressPageArgs{key: $key, selectAddress: $selectAddress, isDeliver: $isDeliver}';
  }
}

/// generated route for
/// [_i13.SettingScreen]
class SettingPage extends _i16.PageRouteInfo<SettingPageArgs> {
  SettingPage({_i17.Key? key})
      : super(
          SettingPage.name,
          path: '/setting',
          args: SettingPageArgs(key: key),
        );

  static const String name = 'SettingPage';
}

class SettingPageArgs {
  const SettingPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'SettingPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.NotificationScreen]
class NotificationPage extends _i16.PageRouteInfo<NotificationPageArgs> {
  NotificationPage({_i17.Key? key})
      : super(
          NotificationPage.name,
          path: '/notification',
          args: NotificationPageArgs(key: key),
        );

  static const String name = 'NotificationPage';
}

class NotificationPageArgs {
  const NotificationPageArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'NotificationPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.UpdateInfoScreen]
class UpdateInfoPage extends _i16.PageRouteInfo<void> {
  const UpdateInfoPage()
      : super(
          UpdateInfoPage.name,
          path: '/update_info',
        );

  static const String name = 'UpdateInfoPage';
}
