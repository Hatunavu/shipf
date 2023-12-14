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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../../data/model/address/address_model.dart' as _i18;
import '../../enums/enum_role.dart' as _i17;
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
import '../screen/main/setting/setting_screen.dart' as _i13;
import '../screen/main/welcome/welcome_screen.dart' as _i6;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainScreen(),
      );
    },
    SplashPage.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.LoginScreen(key: args.key),
      );
    },
    SignupPage.name: (routeData) {
      final args = routeData.argsAs<SignupPageArgs>(
          orElse: () => const SignupPageArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SignupScreen(
          key: args.key,
          roleType: args.roleType,
        ),
      );
    },
    WelcomePage.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.WelcomeScreen(),
      );
    },
    VerifyPage.name: (routeData) {
      final args = routeData.argsAs<VerifyPageArgs>();
      return _i15.MaterialPageX<dynamic>(
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
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EnterPassScreen(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    ResetPassPage.name: (routeData) {
      final args = routeData.argsAs<ResetPassPageArgs>();
      return _i15.MaterialPageX<dynamic>(
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
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.OrderScreen(key: args.key),
      );
    },
    AddAddressPage.name: (routeData) {
      final args = routeData.argsAs<AddAddressPageArgs>(
          orElse: () => const AddAddressPageArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.AddAddressScreen(key: args.key),
      );
    },
    AddressPage.name: (routeData) {
      final args = routeData.argsAs<AddressPageArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.AddressScreen(
          key: args.key,
          selectAddress: args.selectAddress,
        ),
      );
    },
    SettingPage.name: (routeData) {
      final args = routeData.argsAs<SettingPageArgs>(
          orElse: () => const SettingPageArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.SettingScreen(key: args.key),
      );
    },
    NotificationPage.name: (routeData) {
      final args = routeData.argsAs<NotificationPageArgs>(
          orElse: () => const NotificationPageArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.NotificationScreen(key: args.key),
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i15.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i15.RouteConfig(
          HomePage.name,
          path: '/home',
        ),
        _i15.RouteConfig(
          LoginPage.name,
          path: '/login',
        ),
        _i15.RouteConfig(
          SignupPage.name,
          path: '/signup',
        ),
        _i15.RouteConfig(
          WelcomePage.name,
          path: '/welcome',
        ),
        _i15.RouteConfig(
          VerifyPage.name,
          path: '/verify',
        ),
        _i15.RouteConfig(
          EnterPassPage.name,
          path: '/enter_pass',
        ),
        _i15.RouteConfig(
          ResetPassPage.name,
          path: '/reset_pass',
        ),
        _i15.RouteConfig(
          OrderPage.name,
          path: '/order',
        ),
        _i15.RouteConfig(
          AddAddressPage.name,
          path: '/add_address',
        ),
        _i15.RouteConfig(
          AddressPage.name,
          path: '/address',
        ),
        _i15.RouteConfig(
          SettingPage.name,
          path: '/setting',
        ),
        _i15.RouteConfig(
          NotificationPage.name,
          path: '/notification',
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainPage extends _i15.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/main',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashPage extends _i15.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i3.HomeScreen]
class HomePage extends _i15.PageRouteInfo<HomePageArgs> {
  HomePage({_i16.Key? key})
      : super(
          HomePage.name,
          path: '/home',
          args: HomePageArgs(key: key),
        );

  static const String name = 'HomePage';
}

class HomePageArgs {
  const HomePageArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomePageArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.LoginScreen]
class LoginPage extends _i15.PageRouteInfo<LoginPageArgs> {
  LoginPage({_i16.Key? key})
      : super(
          LoginPage.name,
          path: '/login',
          args: LoginPageArgs(key: key),
        );

  static const String name = 'LoginPage';
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SignupScreen]
class SignupPage extends _i15.PageRouteInfo<SignupPageArgs> {
  SignupPage({
    _i16.Key? key,
    _i17.RoleType roleType = _i17.RoleType.customer,
  }) : super(
          SignupPage.name,
          path: '/signup',
          args: SignupPageArgs(
            key: key,
            roleType: roleType,
          ),
        );

  static const String name = 'SignupPage';
}

class SignupPageArgs {
  const SignupPageArgs({
    this.key,
    this.roleType = _i17.RoleType.customer,
  });

  final _i16.Key? key;

  final _i17.RoleType roleType;

  @override
  String toString() {
    return 'SignupPageArgs{key: $key, roleType: $roleType}';
  }
}

/// generated route for
/// [_i6.WelcomeScreen]
class WelcomePage extends _i15.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcome',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i7.VerifyScreen]
class VerifyPage extends _i15.PageRouteInfo<VerifyPageArgs> {
  VerifyPage({
    _i16.Key? key,
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

  final _i16.Key? key;

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
class EnterPassPage extends _i15.PageRouteInfo<EnterPassPageArgs> {
  EnterPassPage({
    _i16.Key? key,
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

  final _i16.Key? key;

  final String phone;

  @override
  String toString() {
    return 'EnterPassPageArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i9.ResetPassScreen]
class ResetPassPage extends _i15.PageRouteInfo<ResetPassPageArgs> {
  ResetPassPage({
    _i16.Key? key,
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

  final _i16.Key? key;

  final String phone;

  final bool isSignup;

  @override
  String toString() {
    return 'ResetPassPageArgs{key: $key, phone: $phone, isSignup: $isSignup}';
  }
}

/// generated route for
/// [_i10.OrderScreen]
class OrderPage extends _i15.PageRouteInfo<OrderPageArgs> {
  OrderPage({_i16.Key? key})
      : super(
          OrderPage.name,
          path: '/order',
          args: OrderPageArgs(key: key),
        );

  static const String name = 'OrderPage';
}

class OrderPageArgs {
  const OrderPageArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'OrderPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.AddAddressScreen]
class AddAddressPage extends _i15.PageRouteInfo<AddAddressPageArgs> {
  AddAddressPage({_i16.Key? key})
      : super(
          AddAddressPage.name,
          path: '/add_address',
          args: AddAddressPageArgs(key: key),
        );

  static const String name = 'AddAddressPage';
}

class AddAddressPageArgs {
  const AddAddressPageArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'AddAddressPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.AddressScreen]
class AddressPage extends _i15.PageRouteInfo<AddressPageArgs> {
  AddressPage({
    _i16.Key? key,
    required dynamic Function(_i18.AddressDataResponse) selectAddress,
  }) : super(
          AddressPage.name,
          path: '/address',
          args: AddressPageArgs(
            key: key,
            selectAddress: selectAddress,
          ),
        );

  static const String name = 'AddressPage';
}

class AddressPageArgs {
  const AddressPageArgs({
    this.key,
    required this.selectAddress,
  });

  final _i16.Key? key;

  final dynamic Function(_i18.AddressDataResponse) selectAddress;

  @override
  String toString() {
    return 'AddressPageArgs{key: $key, selectAddress: $selectAddress}';
  }
}

/// generated route for
/// [_i13.SettingScreen]
class SettingPage extends _i15.PageRouteInfo<SettingPageArgs> {
  SettingPage({_i16.Key? key})
      : super(
          SettingPage.name,
          path: '/setting',
          args: SettingPageArgs(key: key),
        );

  static const String name = 'SettingPage';
}

class SettingPageArgs {
  const SettingPageArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'SettingPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.NotificationScreen]
class NotificationPage extends _i15.PageRouteInfo<NotificationPageArgs> {
  NotificationPage({_i16.Key? key})
      : super(
          NotificationPage.name,
          path: '/notification',
          args: NotificationPageArgs(key: key),
        );

  static const String name = 'NotificationPage';
}

class NotificationPageArgs {
  const NotificationPageArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'NotificationPageArgs{key: $key}';
  }
}
