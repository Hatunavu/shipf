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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../screen/auth/login/enter_pass/enter_pass_screen.dart' as _i8;
import '../screen/auth/login/login_screen.dart' as _i4;
import '../screen/auth/reset_pass/reset_pass_screen.dart' as _i9;
import '../screen/auth/signup/screen/verify_screen.dart' as _i7;
import '../screen/auth/signup/siginup_screen.dart' as _i5;
import '../screen/auth/splash/splash_screen.dart' as _i2;
import '../screen/main/home/home_screen.dart' as _i3;
import '../screen/main/main_screen.dart' as _i1;
import '../screen/main/welcome/welcome_screen.dart' as _i6;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainScreen(),
      );
    },
    SplashPage.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.LoginScreen(key: args.key),
      );
    },
    SignupPage.name: (routeData) {
      final args = routeData.argsAs<SignupPageArgs>(
          orElse: () => const SignupPageArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SignupScreen(key: args.key),
      );
    },
    WelcomePage.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.WelcomeScreen(),
      );
    },
    VerifyPage.name: (routeData) {
      final args = routeData.argsAs<VerifyPageArgs>();
      return _i10.MaterialPageX<dynamic>(
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
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EnterPassScreen(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    ResetPassPage.name: (routeData) {
      final args = routeData.argsAs<ResetPassPageArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ResetPassScreen(
          key: args.key,
          phone: args.phone,
          isSignup: args.isSignup,
        ),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i10.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i10.RouteConfig(
          HomePage.name,
          path: '/home',
        ),
        _i10.RouteConfig(
          LoginPage.name,
          path: '/login',
        ),
        _i10.RouteConfig(
          SignupPage.name,
          path: '/signup',
        ),
        _i10.RouteConfig(
          WelcomePage.name,
          path: '/welcome',
        ),
        _i10.RouteConfig(
          VerifyPage.name,
          path: '/verify',
        ),
        _i10.RouteConfig(
          EnterPassPage.name,
          path: '/enter_pass',
        ),
        _i10.RouteConfig(
          ResetPassPage.name,
          path: '/reset_pass',
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainPage extends _i10.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/main',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashPage extends _i10.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i3.HomeScreen]
class HomePage extends _i10.PageRouteInfo<HomePageArgs> {
  HomePage({_i11.Key? key})
      : super(
          HomePage.name,
          path: '/home',
          args: HomePageArgs(key: key),
        );

  static const String name = 'HomePage';
}

class HomePageArgs {
  const HomePageArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'HomePageArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.LoginScreen]
class LoginPage extends _i10.PageRouteInfo<LoginPageArgs> {
  LoginPage({_i11.Key? key})
      : super(
          LoginPage.name,
          path: '/login',
          args: LoginPageArgs(key: key),
        );

  static const String name = 'LoginPage';
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SignupScreen]
class SignupPage extends _i10.PageRouteInfo<SignupPageArgs> {
  SignupPage({_i11.Key? key})
      : super(
          SignupPage.name,
          path: '/signup',
          args: SignupPageArgs(key: key),
        );

  static const String name = 'SignupPage';
}

class SignupPageArgs {
  const SignupPageArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'SignupPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.WelcomeScreen]
class WelcomePage extends _i10.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcome',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i7.VerifyScreen]
class VerifyPage extends _i10.PageRouteInfo<VerifyPageArgs> {
  VerifyPage({
    _i11.Key? key,
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

  final _i11.Key? key;

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
class EnterPassPage extends _i10.PageRouteInfo<EnterPassPageArgs> {
  EnterPassPage({
    _i11.Key? key,
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

  final _i11.Key? key;

  final String phone;

  @override
  String toString() {
    return 'EnterPassPageArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i9.ResetPassScreen]
class ResetPassPage extends _i10.PageRouteInfo<ResetPassPageArgs> {
  ResetPassPage({
    _i11.Key? key,
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

  final _i11.Key? key;

  final String phone;

  final bool isSignup;

  @override
  String toString() {
    return 'ResetPassPageArgs{key: $key, phone: $phone, isSignup: $isSignup}';
  }
}
