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
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;

import '../../data/model/address/address.dart' as _i24;
import '../../enums/enum_loading_type.dart' as _i26;
import '../../enums/enum_shipment_status.dart' as _i25;
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
    as _i19;
import '../screen/shipper/home_shipper/screen/shipment/shipments_screen.dart'
    as _i18;
import '../screen/shipper/home_shipper/screen/transit/screen/transit_detail/transit_detail_screen.dart'
    as _i21;
import '../screen/shipper/home_shipper/screen/transit/transits_screen.dart'
    as _i20;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      final args =
          routeData.argsAs<MainPageArgs>(orElse: () => const MainPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.MainScreen(
          key: args.key,
          tabIndex: args.tabIndex,
        ),
      );
    },
    SplashPage.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    SignupPage.name: (routeData) {
      final args = routeData.argsAs<SignupPageArgs>(
          orElse: () => const SignupPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SignupScreen(key: args.key),
      );
    },
    WelcomePage.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WelcomeScreen(),
      );
    },
    VerifyPage.name: (routeData) {
      final args = routeData.argsAs<VerifyPageArgs>();
      return _i22.MaterialPageX<dynamic>(
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
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EnterPassScreen(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    ResetPassPage.name: (routeData) {
      final args = routeData.argsAs<ResetPassPageArgs>();
      return _i22.MaterialPageX<dynamic>(
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
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.OrderScreen(
          key: args.key,
          shipmentId: args.shipmentId,
        ),
      );
    },
    AddAddressPage.name: (routeData) {
      final args = routeData.argsAs<AddAddressPageArgs>(
          orElse: () => const AddAddressPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.AddAddressScreen(key: args.key),
      );
    },
    AddressPage.name: (routeData) {
      final args = routeData.argsAs<AddressPageArgs>();
      return _i22.MaterialPageX<dynamic>(
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
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.SettingScreen(key: args.key),
      );
    },
    NotificationPage.name: (routeData) {
      final args = routeData.argsAs<NotificationPageArgs>(
          orElse: () => const NotificationPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.NotificationScreen(key: args.key),
      );
    },
    UpdateInfoPage.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.UpdateInfoScreen(),
      );
    },
    OrderSuccessPage.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.OrderSuccessScreen(),
      );
    },
    HomeCustomerPage.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.HomeCustomerScreen(),
      );
    },
    HomeShipperPage.name: (routeData) {
      final args = routeData.argsAs<HomeShipperPageArgs>(
          orElse: () => const HomeShipperPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.HomeShipperScreen(key: args.key),
      );
    },
    ShipmentsPage.name: (routeData) {
      final args = routeData.argsAs<ShipmentsPageArgs>(
          orElse: () => const ShipmentsPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.ShipmentsScreen(
          key: args.key,
          shipmentStatus: args.shipmentStatus,
        ),
      );
    },
    OrderCompletePage.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.OrderCompleteScreen(),
      );
    },
    TransitsPage.name: (routeData) {
      final args = routeData.argsAs<TransitsPageArgs>(
          orElse: () => const TransitsPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.TransitsScreen(
          key: args.key,
          type: args.type,
        ),
      );
    },
    TransitDetailPage.name: (routeData) {
      final args = routeData.argsAs<TransitDetailPageArgs>(
          orElse: () => const TransitDetailPageArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.TransitDetailScreen(
          key: args.key,
          transitId: args.transitId,
        ),
      );
    },
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i22.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i22.RouteConfig(
          LoginPage.name,
          path: '/login',
        ),
        _i22.RouteConfig(
          SignupPage.name,
          path: '/signup',
        ),
        _i22.RouteConfig(
          WelcomePage.name,
          path: '/welcome',
        ),
        _i22.RouteConfig(
          VerifyPage.name,
          path: '/verify',
        ),
        _i22.RouteConfig(
          EnterPassPage.name,
          path: '/enter_pass',
        ),
        _i22.RouteConfig(
          ResetPassPage.name,
          path: '/reset_pass',
        ),
        _i22.RouteConfig(
          OrderPage.name,
          path: '/order',
        ),
        _i22.RouteConfig(
          AddAddressPage.name,
          path: '/add_address',
        ),
        _i22.RouteConfig(
          AddressPage.name,
          path: '/address',
        ),
        _i22.RouteConfig(
          SettingPage.name,
          path: '/setting',
        ),
        _i22.RouteConfig(
          NotificationPage.name,
          path: '/notification',
        ),
        _i22.RouteConfig(
          UpdateInfoPage.name,
          path: '/update_info',
        ),
        _i22.RouteConfig(
          OrderSuccessPage.name,
          path: '/order_success',
        ),
        _i22.RouteConfig(
          HomeCustomerPage.name,
          path: '/home_customer',
        ),
        _i22.RouteConfig(
          HomeShipperPage.name,
          path: '/home_shipper',
        ),
        _i22.RouteConfig(
          ShipmentsPage.name,
          path: '/shipments',
        ),
        _i22.RouteConfig(
          OrderCompletePage.name,
          path: '/order_complete',
        ),
        _i22.RouteConfig(
          TransitsPage.name,
          path: '/transits',
        ),
        _i22.RouteConfig(
          TransitDetailPage.name,
          path: '/transit_detail',
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainPage extends _i22.PageRouteInfo<MainPageArgs> {
  MainPage({
    _i23.Key? key,
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

  final _i23.Key? key;

  final int tabIndex;

  @override
  String toString() {
    return 'MainPageArgs{key: $key, tabIndex: $tabIndex}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashPage extends _i22.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginPage extends _i22.PageRouteInfo<LoginPageArgs> {
  LoginPage({_i23.Key? key})
      : super(
          LoginPage.name,
          path: '/login',
          args: LoginPageArgs(key: key),
        );

  static const String name = 'LoginPage';
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignupScreen]
class SignupPage extends _i22.PageRouteInfo<SignupPageArgs> {
  SignupPage({_i23.Key? key})
      : super(
          SignupPage.name,
          path: '/signup',
          args: SignupPageArgs(key: key),
        );

  static const String name = 'SignupPage';
}

class SignupPageArgs {
  const SignupPageArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'SignupPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomePage extends _i22.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcome',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i6.VerifyScreen]
class VerifyPage extends _i22.PageRouteInfo<VerifyPageArgs> {
  VerifyPage({
    _i23.Key? key,
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

  final _i23.Key? key;

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
class EnterPassPage extends _i22.PageRouteInfo<EnterPassPageArgs> {
  EnterPassPage({
    _i23.Key? key,
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

  final _i23.Key? key;

  final String phone;

  @override
  String toString() {
    return 'EnterPassPageArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i8.ResetPassScreen]
class ResetPassPage extends _i22.PageRouteInfo<ResetPassPageArgs> {
  ResetPassPage({
    _i23.Key? key,
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

  final _i23.Key? key;

  final String phone;

  final bool isSignup;

  @override
  String toString() {
    return 'ResetPassPageArgs{key: $key, phone: $phone, isSignup: $isSignup}';
  }
}

/// generated route for
/// [_i9.OrderScreen]
class OrderPage extends _i22.PageRouteInfo<OrderPageArgs> {
  OrderPage({
    _i23.Key? key,
    int shipmentId = 0,
  }) : super(
          OrderPage.name,
          path: '/order',
          args: OrderPageArgs(
            key: key,
            shipmentId: shipmentId,
          ),
        );

  static const String name = 'OrderPage';
}

class OrderPageArgs {
  const OrderPageArgs({
    this.key,
    this.shipmentId = 0,
  });

  final _i23.Key? key;

  final int shipmentId;

  @override
  String toString() {
    return 'OrderPageArgs{key: $key, shipmentId: $shipmentId}';
  }
}

/// generated route for
/// [_i10.AddAddressScreen]
class AddAddressPage extends _i22.PageRouteInfo<AddAddressPageArgs> {
  AddAddressPage({_i23.Key? key})
      : super(
          AddAddressPage.name,
          path: '/add_address',
          args: AddAddressPageArgs(key: key),
        );

  static const String name = 'AddAddressPage';
}

class AddAddressPageArgs {
  const AddAddressPageArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'AddAddressPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.AddressScreen]
class AddressPage extends _i22.PageRouteInfo<AddressPageArgs> {
  AddressPage({
    _i23.Key? key,
    required dynamic Function(_i24.AddressSavedData) selectAddress,
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

  final _i23.Key? key;

  final dynamic Function(_i24.AddressSavedData) selectAddress;

  final bool isDeliver;

  @override
  String toString() {
    return 'AddressPageArgs{key: $key, selectAddress: $selectAddress, isDeliver: $isDeliver}';
  }
}

/// generated route for
/// [_i12.SettingScreen]
class SettingPage extends _i22.PageRouteInfo<SettingPageArgs> {
  SettingPage({_i23.Key? key})
      : super(
          SettingPage.name,
          path: '/setting',
          args: SettingPageArgs(key: key),
        );

  static const String name = 'SettingPage';
}

class SettingPageArgs {
  const SettingPageArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'SettingPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.NotificationScreen]
class NotificationPage extends _i22.PageRouteInfo<NotificationPageArgs> {
  NotificationPage({_i23.Key? key})
      : super(
          NotificationPage.name,
          path: '/notification',
          args: NotificationPageArgs(key: key),
        );

  static const String name = 'NotificationPage';
}

class NotificationPageArgs {
  const NotificationPageArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'NotificationPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.UpdateInfoScreen]
class UpdateInfoPage extends _i22.PageRouteInfo<void> {
  const UpdateInfoPage()
      : super(
          UpdateInfoPage.name,
          path: '/update_info',
        );

  static const String name = 'UpdateInfoPage';
}

/// generated route for
/// [_i15.OrderSuccessScreen]
class OrderSuccessPage extends _i22.PageRouteInfo<void> {
  const OrderSuccessPage()
      : super(
          OrderSuccessPage.name,
          path: '/order_success',
        );

  static const String name = 'OrderSuccessPage';
}

/// generated route for
/// [_i16.HomeCustomerScreen]
class HomeCustomerPage extends _i22.PageRouteInfo<void> {
  const HomeCustomerPage()
      : super(
          HomeCustomerPage.name,
          path: '/home_customer',
        );

  static const String name = 'HomeCustomerPage';
}

/// generated route for
/// [_i17.HomeShipperScreen]
class HomeShipperPage extends _i22.PageRouteInfo<HomeShipperPageArgs> {
  HomeShipperPage({_i23.Key? key})
      : super(
          HomeShipperPage.name,
          path: '/home_shipper',
          args: HomeShipperPageArgs(key: key),
        );

  static const String name = 'HomeShipperPage';
}

class HomeShipperPageArgs {
  const HomeShipperPageArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'HomeShipperPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.ShipmentsScreen]
class ShipmentsPage extends _i22.PageRouteInfo<ShipmentsPageArgs> {
  ShipmentsPage({
    _i23.Key? key,
    _i25.ShipmentStatus shipmentStatus = _i25.ShipmentStatus.pickingUp,
  }) : super(
          ShipmentsPage.name,
          path: '/shipments',
          args: ShipmentsPageArgs(
            key: key,
            shipmentStatus: shipmentStatus,
          ),
        );

  static const String name = 'ShipmentsPage';
}

class ShipmentsPageArgs {
  const ShipmentsPageArgs({
    this.key,
    this.shipmentStatus = _i25.ShipmentStatus.pickingUp,
  });

  final _i23.Key? key;

  final _i25.ShipmentStatus shipmentStatus;

  @override
  String toString() {
    return 'ShipmentsPageArgs{key: $key, shipmentStatus: $shipmentStatus}';
  }
}

/// generated route for
/// [_i19.OrderCompleteScreen]
class OrderCompletePage extends _i22.PageRouteInfo<void> {
  const OrderCompletePage()
      : super(
          OrderCompletePage.name,
          path: '/order_complete',
        );

  static const String name = 'OrderCompletePage';
}

/// generated route for
/// [_i20.TransitsScreen]
class TransitsPage extends _i22.PageRouteInfo<TransitsPageArgs> {
  TransitsPage({
    _i23.Key? key,
    _i26.LoadingType type = _i26.LoadingType.pickup,
  }) : super(
          TransitsPage.name,
          path: '/transits',
          args: TransitsPageArgs(
            key: key,
            type: type,
          ),
        );

  static const String name = 'TransitsPage';
}

class TransitsPageArgs {
  const TransitsPageArgs({
    this.key,
    this.type = _i26.LoadingType.pickup,
  });

  final _i23.Key? key;

  final _i26.LoadingType type;

  @override
  String toString() {
    return 'TransitsPageArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i21.TransitDetailScreen]
class TransitDetailPage extends _i22.PageRouteInfo<TransitDetailPageArgs> {
  TransitDetailPage({
    _i23.Key? key,
    int transitId = 0,
  }) : super(
          TransitDetailPage.name,
          path: '/transit_detail',
          args: TransitDetailPageArgs(
            key: key,
            transitId: transitId,
          ),
        );

  static const String name = 'TransitDetailPage';
}

class TransitDetailPageArgs {
  const TransitDetailPageArgs({
    this.key,
    this.transitId = 0,
  });

  final _i23.Key? key;

  final int transitId;

  @override
  String toString() {
    return 'TransitDetailPageArgs{key: $key, transitId: $transitId}';
  }
}
