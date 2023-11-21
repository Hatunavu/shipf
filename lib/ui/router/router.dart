import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:shipf/ui/router/app_router.dart';
import 'package:shipf/ui/screen/auth/login/enter_pass/enter_pass_screen.dart';
import 'package:shipf/ui/screen/auth/login/login_screen.dart';
import 'package:shipf/ui/screen/auth/reset_pass/reset_pass_screen.dart';
import 'package:shipf/ui/screen/auth/signup/screen/verify_screen.dart';
import 'package:shipf/ui/screen/auth/signup/siginup_screen.dart';
import 'package:shipf/ui/screen/auth/splash/splash_screen.dart';
import 'package:shipf/ui/screen/main/home/home_screen.dart';
import 'package:shipf/ui/screen/main/main_screen.dart';
import 'package:shipf/ui/screen/main/welcome/welcome_screen.dart';

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
      page: HomeScreen,
      name: "HomePage",
      path: AppRoutes.homeScreen,
    ),
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
