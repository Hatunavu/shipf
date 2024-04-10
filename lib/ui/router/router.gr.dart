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
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;

import '../../data/model/account/account_model.dart' as _i31;
import '../../data/model/address/address.dart' as _i30;
import '../../data/model/post/post_response.dart' as _i34;
import '../../enums/enum_loading_type.dart' as _i33;
import '../../enums/enum_shipment_status.dart' as _i32;
import '../../enums/enum_tonnage.dart' as _i35;
import '../screen/auth/forget_pass/forget_pass_screen.dart' as _i9;
import '../screen/auth/login/enter_pass/enter_pass_screen.dart' as _i7;
import '../screen/auth/login/login_screen.dart' as _i3;
import '../screen/auth/reset_pass/reset_pass_screen.dart' as _i8;
import '../screen/auth/signup/screen/verify_screen.dart' as _i6;
import '../screen/auth/signup/signup_screen.dart' as _i4;
import '../screen/auth/splash/splash_screen.dart' as _i2;
import '../screen/customer/home_customer/home_customer_screen.dart' as _i17;
import '../screen/main/add_address/add_address_screen.dart' as _i11;
import '../screen/main/address/address_screen.dart' as _i12;
import '../screen/main/main_screen.dart' as _i1;
import '../screen/main/notifications/notification_screen.dart' as _i14;
import '../screen/main/order/order_screen.dart' as _i10;
import '../screen/main/order/screens/order_success_screen.dart' as _i16;
import '../screen/main/setting/screen/update_info/update_info_screen.dart'
    as _i15;
import '../screen/main/setting/screen/user_post/user_post_screen.dart' as _i25;
import '../screen/main/setting/setting_screen.dart' as _i13;
import '../screen/main/welcome/welcome_screen.dart' as _i5;
import '../screen/shipper/home_shipper/home_shipper_screen.dart' as _i18;
import '../screen/shipper/home_shipper/screen/order_complete/order_complete_screen.dart'
    as _i20;
import '../screen/shipper/home_shipper/screen/shipment/shipments_screen.dart'
    as _i19;
import '../screen/shipper/home_shipper/screen/transit/screen/transit_detail/transit_detail_screen.dart'
    as _i22;
import '../screen/shipper/home_shipper/screen/transit/transits_screen.dart'
    as _i21;
import '../screen/shipper/post/post_screen.dart' as _i23;
import '../screen/shipper/post/screen/create_post/create_post_screen.dart'
    as _i24;
import '../screen/shipper/post/screen/quote/quote_screen.dart' as _i27;
import '../screen/shipper/post/screen/search_post/search_post_screen.dart'
    as _i26;

class AppRouter extends _i28.RootStackRouter {
  AppRouter([_i29.GlobalKey<_i29.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      final args =
          routeData.argsAs<MainPageArgs>(orElse: () => const MainPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.MainScreen(
          key: args.key,
          tabIndex: args.tabIndex,
        ),
      );
    },
    SplashPage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginPage.name: (routeData) {
      final args =
          routeData.argsAs<LoginPageArgs>(orElse: () => const LoginPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    SignupPage.name: (routeData) {
      final args = routeData.argsAs<SignupPageArgs>(
          orElse: () => const SignupPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SignupScreen(key: args.key),
      );
    },
    WelcomePage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WelcomeScreen(),
      );
    },
    VerifyPage.name: (routeData) {
      final args = routeData.argsAs<VerifyPageArgs>();
      return _i28.MaterialPageX<dynamic>(
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
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EnterPassScreen(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    ResetPassPage.name: (routeData) {
      final args = routeData.argsAs<ResetPassPageArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ResetPassScreen(
          key: args.key,
          phone: args.phone,
          isSignup: args.isSignup,
        ),
      );
    },
    ForgetPassPage.name: (routeData) {
      final args = routeData.argsAs<ForgetPassPageArgs>(
          orElse: () => const ForgetPassPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ForgetPassScreen(key: args.key),
      );
    },
    OrderPage.name: (routeData) {
      final args =
          routeData.argsAs<OrderPageArgs>(orElse: () => const OrderPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.OrderScreen(
          key: args.key,
          shipmentId: args.shipmentId,
          onBack: args.onBack,
        ),
      );
    },
    AddAddressPage.name: (routeData) {
      final args = routeData.argsAs<AddAddressPageArgs>(
          orElse: () => const AddAddressPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.AddAddressScreen(key: args.key),
      );
    },
    AddressPage.name: (routeData) {
      final args = routeData.argsAs<AddressPageArgs>();
      return _i28.MaterialPageX<dynamic>(
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
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.SettingScreen(key: args.key),
      );
    },
    NotificationPage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.NotificationScreen(),
      );
    },
    UpdateInfoPage.name: (routeData) {
      final args = routeData.argsAs<UpdateInfoPageArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.UpdateInfoScreen(
          key: args.key,
          accountData: args.accountData,
        ),
      );
    },
    OrderSuccessPage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.OrderSuccessScreen(),
      );
    },
    HomeCustomerPage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.HomeCustomerScreen(),
      );
    },
    HomeShipperPage.name: (routeData) {
      final args = routeData.argsAs<HomeShipperPageArgs>(
          orElse: () => const HomeShipperPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.HomeShipperScreen(key: args.key),
      );
    },
    ShipmentsPage.name: (routeData) {
      final args = routeData.argsAs<ShipmentsPageArgs>(
          orElse: () => const ShipmentsPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.ShipmentsScreen(
          key: args.key,
          shipmentStatus: args.shipmentStatus,
          isShowHeader: args.isShowHeader,
        ),
      );
    },
    OrderCompletePage.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.OrderCompleteScreen(),
      );
    },
    TransitsPage.name: (routeData) {
      final args = routeData.argsAs<TransitsPageArgs>(
          orElse: () => const TransitsPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.TransitsScreen(
          key: args.key,
          type: args.type,
        ),
      );
    },
    TransitDetailPage.name: (routeData) {
      final args = routeData.argsAs<TransitDetailPageArgs>(
          orElse: () => const TransitDetailPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.TransitDetailScreen(
          key: args.key,
          transitId: args.transitId,
        ),
      );
    },
    PostPage.name: (routeData) {
      final args =
          routeData.argsAs<PostPageArgs>(orElse: () => const PostPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i23.PostScreen(key: args.key),
      );
    },
    CreatePostPage.name: (routeData) {
      final args = routeData.argsAs<CreatePostPageArgs>(
          orElse: () => const CreatePostPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.CreatePostScreen(
          key: args.key,
          postData: args.postData,
          callBack: args.callBack,
        ),
      );
    },
    UserPostPage.name: (routeData) {
      final args = routeData.argsAs<UserPostPageArgs>(
          orElse: () => const UserPostPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.UserPostScreen(key: args.key),
      );
    },
    SearchPostPage.name: (routeData) {
      final args = routeData.argsAs<SearchPostPageArgs>(
          orElse: () => const SearchPostPageArgs());
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.SearchPostScreen(
          key: args.key,
          callBack: args.callBack,
          tonnage: args.tonnage,
          provinces: args.provinces,
          provincesDelivery: args.provincesDelivery,
        ),
      );
    },
    QuotePage.name: (routeData) {
      final args = routeData.argsAs<QuotePageArgs>();
      return _i28.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.QuoteScreen(
          key: args.key,
          postData: args.postData,
        ),
      );
    },
  };

  @override
  List<_i28.RouteConfig> get routes => [
        _i28.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i28.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i28.RouteConfig(
          LoginPage.name,
          path: '/login',
        ),
        _i28.RouteConfig(
          SignupPage.name,
          path: '/signup',
        ),
        _i28.RouteConfig(
          WelcomePage.name,
          path: '/welcome',
        ),
        _i28.RouteConfig(
          VerifyPage.name,
          path: '/verify',
        ),
        _i28.RouteConfig(
          EnterPassPage.name,
          path: '/enter_pass',
        ),
        _i28.RouteConfig(
          ResetPassPage.name,
          path: '/reset_pass',
        ),
        _i28.RouteConfig(
          ForgetPassPage.name,
          path: '/forget_pass',
        ),
        _i28.RouteConfig(
          OrderPage.name,
          path: '/order',
        ),
        _i28.RouteConfig(
          AddAddressPage.name,
          path: '/add_address',
        ),
        _i28.RouteConfig(
          AddressPage.name,
          path: '/address',
        ),
        _i28.RouteConfig(
          SettingPage.name,
          path: '/setting',
        ),
        _i28.RouteConfig(
          NotificationPage.name,
          path: '/notification',
        ),
        _i28.RouteConfig(
          UpdateInfoPage.name,
          path: '/update_info',
        ),
        _i28.RouteConfig(
          OrderSuccessPage.name,
          path: '/order_success',
        ),
        _i28.RouteConfig(
          HomeCustomerPage.name,
          path: '/home_customer',
        ),
        _i28.RouteConfig(
          HomeShipperPage.name,
          path: '/home_shipper',
        ),
        _i28.RouteConfig(
          ShipmentsPage.name,
          path: '/shipments',
        ),
        _i28.RouteConfig(
          OrderCompletePage.name,
          path: '/order_complete',
        ),
        _i28.RouteConfig(
          TransitsPage.name,
          path: '/transits',
        ),
        _i28.RouteConfig(
          TransitDetailPage.name,
          path: '/transit_detail',
        ),
        _i28.RouteConfig(
          PostPage.name,
          path: '/post',
        ),
        _i28.RouteConfig(
          CreatePostPage.name,
          path: '/create_post',
        ),
        _i28.RouteConfig(
          UserPostPage.name,
          path: '/user_post',
        ),
        _i28.RouteConfig(
          SearchPostPage.name,
          path: '/search_post',
        ),
        _i28.RouteConfig(
          QuotePage.name,
          path: '/quote',
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainPage extends _i28.PageRouteInfo<MainPageArgs> {
  MainPage({
    _i29.Key? key,
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

  final _i29.Key? key;

  final int tabIndex;

  @override
  String toString() {
    return 'MainPageArgs{key: $key, tabIndex: $tabIndex}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashPage extends _i28.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginPage extends _i28.PageRouteInfo<LoginPageArgs> {
  LoginPage({_i29.Key? key})
      : super(
          LoginPage.name,
          path: '/login',
          args: LoginPageArgs(key: key),
        );

  static const String name = 'LoginPage';
}

class LoginPageArgs {
  const LoginPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignupScreen]
class SignupPage extends _i28.PageRouteInfo<SignupPageArgs> {
  SignupPage({_i29.Key? key})
      : super(
          SignupPage.name,
          path: '/signup',
          args: SignupPageArgs(key: key),
        );

  static const String name = 'SignupPage';
}

class SignupPageArgs {
  const SignupPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'SignupPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomePage extends _i28.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcome',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i6.VerifyScreen]
class VerifyPage extends _i28.PageRouteInfo<VerifyPageArgs> {
  VerifyPage({
    _i29.Key? key,
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

  final _i29.Key? key;

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
class EnterPassPage extends _i28.PageRouteInfo<EnterPassPageArgs> {
  EnterPassPage({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String phone;

  @override
  String toString() {
    return 'EnterPassPageArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i8.ResetPassScreen]
class ResetPassPage extends _i28.PageRouteInfo<ResetPassPageArgs> {
  ResetPassPage({
    _i29.Key? key,
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

  final _i29.Key? key;

  final String phone;

  final bool isSignup;

  @override
  String toString() {
    return 'ResetPassPageArgs{key: $key, phone: $phone, isSignup: $isSignup}';
  }
}

/// generated route for
/// [_i9.ForgetPassScreen]
class ForgetPassPage extends _i28.PageRouteInfo<ForgetPassPageArgs> {
  ForgetPassPage({_i29.Key? key})
      : super(
          ForgetPassPage.name,
          path: '/forget_pass',
          args: ForgetPassPageArgs(key: key),
        );

  static const String name = 'ForgetPassPage';
}

class ForgetPassPageArgs {
  const ForgetPassPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'ForgetPassPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.OrderScreen]
class OrderPage extends _i28.PageRouteInfo<OrderPageArgs> {
  OrderPage({
    _i29.Key? key,
    int? shipmentId,
    dynamic Function()? onBack,
  }) : super(
          OrderPage.name,
          path: '/order',
          args: OrderPageArgs(
            key: key,
            shipmentId: shipmentId,
            onBack: onBack,
          ),
        );

  static const String name = 'OrderPage';
}

class OrderPageArgs {
  const OrderPageArgs({
    this.key,
    this.shipmentId,
    this.onBack,
  });

  final _i29.Key? key;

  final int? shipmentId;

  final dynamic Function()? onBack;

  @override
  String toString() {
    return 'OrderPageArgs{key: $key, shipmentId: $shipmentId, onBack: $onBack}';
  }
}

/// generated route for
/// [_i11.AddAddressScreen]
class AddAddressPage extends _i28.PageRouteInfo<AddAddressPageArgs> {
  AddAddressPage({_i29.Key? key})
      : super(
          AddAddressPage.name,
          path: '/add_address',
          args: AddAddressPageArgs(key: key),
        );

  static const String name = 'AddAddressPage';
}

class AddAddressPageArgs {
  const AddAddressPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'AddAddressPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.AddressScreen]
class AddressPage extends _i28.PageRouteInfo<AddressPageArgs> {
  AddressPage({
    _i29.Key? key,
    required dynamic Function(_i30.AddressSavedData) selectAddress,
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

  final _i29.Key? key;

  final dynamic Function(_i30.AddressSavedData) selectAddress;

  final bool isDeliver;

  @override
  String toString() {
    return 'AddressPageArgs{key: $key, selectAddress: $selectAddress, isDeliver: $isDeliver}';
  }
}

/// generated route for
/// [_i13.SettingScreen]
class SettingPage extends _i28.PageRouteInfo<SettingPageArgs> {
  SettingPage({_i29.Key? key})
      : super(
          SettingPage.name,
          path: '/setting',
          args: SettingPageArgs(key: key),
        );

  static const String name = 'SettingPage';
}

class SettingPageArgs {
  const SettingPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'SettingPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.NotificationScreen]
class NotificationPage extends _i28.PageRouteInfo<void> {
  const NotificationPage()
      : super(
          NotificationPage.name,
          path: '/notification',
        );

  static const String name = 'NotificationPage';
}

/// generated route for
/// [_i15.UpdateInfoScreen]
class UpdateInfoPage extends _i28.PageRouteInfo<UpdateInfoPageArgs> {
  UpdateInfoPage({
    _i29.Key? key,
    required _i31.AccountData accountData,
  }) : super(
          UpdateInfoPage.name,
          path: '/update_info',
          args: UpdateInfoPageArgs(
            key: key,
            accountData: accountData,
          ),
        );

  static const String name = 'UpdateInfoPage';
}

class UpdateInfoPageArgs {
  const UpdateInfoPageArgs({
    this.key,
    required this.accountData,
  });

  final _i29.Key? key;

  final _i31.AccountData accountData;

  @override
  String toString() {
    return 'UpdateInfoPageArgs{key: $key, accountData: $accountData}';
  }
}

/// generated route for
/// [_i16.OrderSuccessScreen]
class OrderSuccessPage extends _i28.PageRouteInfo<void> {
  const OrderSuccessPage()
      : super(
          OrderSuccessPage.name,
          path: '/order_success',
        );

  static const String name = 'OrderSuccessPage';
}

/// generated route for
/// [_i17.HomeCustomerScreen]
class HomeCustomerPage extends _i28.PageRouteInfo<void> {
  const HomeCustomerPage()
      : super(
          HomeCustomerPage.name,
          path: '/home_customer',
        );

  static const String name = 'HomeCustomerPage';
}

/// generated route for
/// [_i18.HomeShipperScreen]
class HomeShipperPage extends _i28.PageRouteInfo<HomeShipperPageArgs> {
  HomeShipperPage({_i29.Key? key})
      : super(
          HomeShipperPage.name,
          path: '/home_shipper',
          args: HomeShipperPageArgs(key: key),
        );

  static const String name = 'HomeShipperPage';
}

class HomeShipperPageArgs {
  const HomeShipperPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'HomeShipperPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i19.ShipmentsScreen]
class ShipmentsPage extends _i28.PageRouteInfo<ShipmentsPageArgs> {
  ShipmentsPage({
    _i29.Key? key,
    _i32.ShipmentStatus? shipmentStatus,
    bool isShowHeader = true,
  }) : super(
          ShipmentsPage.name,
          path: '/shipments',
          args: ShipmentsPageArgs(
            key: key,
            shipmentStatus: shipmentStatus,
            isShowHeader: isShowHeader,
          ),
        );

  static const String name = 'ShipmentsPage';
}

class ShipmentsPageArgs {
  const ShipmentsPageArgs({
    this.key,
    this.shipmentStatus,
    this.isShowHeader = true,
  });

  final _i29.Key? key;

  final _i32.ShipmentStatus? shipmentStatus;

  final bool isShowHeader;

  @override
  String toString() {
    return 'ShipmentsPageArgs{key: $key, shipmentStatus: $shipmentStatus, isShowHeader: $isShowHeader}';
  }
}

/// generated route for
/// [_i20.OrderCompleteScreen]
class OrderCompletePage extends _i28.PageRouteInfo<void> {
  const OrderCompletePage()
      : super(
          OrderCompletePage.name,
          path: '/order_complete',
        );

  static const String name = 'OrderCompletePage';
}

/// generated route for
/// [_i21.TransitsScreen]
class TransitsPage extends _i28.PageRouteInfo<TransitsPageArgs> {
  TransitsPage({
    _i29.Key? key,
    _i33.LoadingType type = _i33.LoadingType.pickup,
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
    this.type = _i33.LoadingType.pickup,
  });

  final _i29.Key? key;

  final _i33.LoadingType type;

  @override
  String toString() {
    return 'TransitsPageArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i22.TransitDetailScreen]
class TransitDetailPage extends _i28.PageRouteInfo<TransitDetailPageArgs> {
  TransitDetailPage({
    _i29.Key? key,
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

  final _i29.Key? key;

  final int transitId;

  @override
  String toString() {
    return 'TransitDetailPageArgs{key: $key, transitId: $transitId}';
  }
}

/// generated route for
/// [_i23.PostScreen]
class PostPage extends _i28.PageRouteInfo<PostPageArgs> {
  PostPage({_i29.Key? key})
      : super(
          PostPage.name,
          path: '/post',
          args: PostPageArgs(key: key),
        );

  static const String name = 'PostPage';
}

class PostPageArgs {
  const PostPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'PostPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i24.CreatePostScreen]
class CreatePostPage extends _i28.PageRouteInfo<CreatePostPageArgs> {
  CreatePostPage({
    _i29.Key? key,
    _i34.PostData? postData,
    dynamic Function()? callBack,
  }) : super(
          CreatePostPage.name,
          path: '/create_post',
          args: CreatePostPageArgs(
            key: key,
            postData: postData,
            callBack: callBack,
          ),
        );

  static const String name = 'CreatePostPage';
}

class CreatePostPageArgs {
  const CreatePostPageArgs({
    this.key,
    this.postData,
    this.callBack,
  });

  final _i29.Key? key;

  final _i34.PostData? postData;

  final dynamic Function()? callBack;

  @override
  String toString() {
    return 'CreatePostPageArgs{key: $key, postData: $postData, callBack: $callBack}';
  }
}

/// generated route for
/// [_i25.UserPostScreen]
class UserPostPage extends _i28.PageRouteInfo<UserPostPageArgs> {
  UserPostPage({_i29.Key? key})
      : super(
          UserPostPage.name,
          path: '/user_post',
          args: UserPostPageArgs(key: key),
        );

  static const String name = 'UserPostPage';
}

class UserPostPageArgs {
  const UserPostPageArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'UserPostPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i26.SearchPostScreen]
class SearchPostPage extends _i28.PageRouteInfo<SearchPostPageArgs> {
  SearchPostPage({
    _i29.Key? key,
    dynamic Function({
      List<_i30.AddressDataModel>? provinces,
      List<_i30.AddressDataModel>? provincesDelivery,
      _i35.TonnageType? tonnage,
    })? callBack,
    _i35.TonnageType? tonnage,
    List<_i30.AddressDataModel> provinces = const [],
    List<_i30.AddressDataModel> provincesDelivery = const [],
  }) : super(
          SearchPostPage.name,
          path: '/search_post',
          args: SearchPostPageArgs(
            key: key,
            callBack: callBack,
            tonnage: tonnage,
            provinces: provinces,
            provincesDelivery: provincesDelivery,
          ),
        );

  static const String name = 'SearchPostPage';
}

class SearchPostPageArgs {
  const SearchPostPageArgs({
    this.key,
    this.callBack,
    this.tonnage,
    this.provinces = const [],
    this.provincesDelivery = const [],
  });

  final _i29.Key? key;

  final dynamic Function({
    List<_i30.AddressDataModel>? provinces,
    List<_i30.AddressDataModel>? provincesDelivery,
    _i35.TonnageType? tonnage,
  })? callBack;

  final _i35.TonnageType? tonnage;

  final List<_i30.AddressDataModel> provinces;

  final List<_i30.AddressDataModel> provincesDelivery;

  @override
  String toString() {
    return 'SearchPostPageArgs{key: $key, callBack: $callBack, tonnage: $tonnage, provinces: $provinces, provincesDelivery: $provincesDelivery}';
  }
}

/// generated route for
/// [_i27.QuoteScreen]
class QuotePage extends _i28.PageRouteInfo<QuotePageArgs> {
  QuotePage({
    _i29.Key? key,
    required _i34.PostData postData,
  }) : super(
          QuotePage.name,
          path: '/quote',
          args: QuotePageArgs(
            key: key,
            postData: postData,
          ),
        );

  static const String name = 'QuotePage';
}

class QuotePageArgs {
  const QuotePageArgs({
    this.key,
    required this.postData,
  });

  final _i29.Key? key;

  final _i34.PostData postData;

  @override
  String toString() {
    return 'QuotePageArgs{key: $key, postData: $postData}';
  }
}
