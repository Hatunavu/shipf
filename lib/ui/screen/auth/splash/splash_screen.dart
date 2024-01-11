import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/services/account_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkFirtLoad(context);
    super.initState();
  }

  final mainRepository = getIt.get<MainRepository>();

  void checkFirtLoad(BuildContext context) async {
    // final bool isFirstLoad = await AccountServices().getIsFirstLoad();
    // if (isFirstLoad == true) {
    //   context.router.replace(const WelcomePage());
    //   AccountServices().saveIsFirstLoad(false);
    // } else {

    final String token = await AccountServices().getUserToken();
    // final String userId = await AccountServices().getUserId();
    if (token != '') {
      // context.read<SetUpCubit>().updateUser(token, userId);
      // final status = await handleGetAccountMe();
      // Future.delayed(Duration(seconds: 2));
      context.router.replace(MainPage());

      // if (status == true) {
      //   context.router.replace(const MainPage());
      // } else {
      //   print("da co loi xay ra");
      // }
    } else {
      context.router.replace(MainPage());
    }

    // }
  }

  Future<bool> handleGetAccountMe() async {
    try {
      final response = await mainRepository.getUserInfo();
      if (true) {
        // response.status == 200) {
        final userId = await AccountServices().getUserId();
        final userToken = await AccountServices().getUserToken();
        // final userInfo = response.data!.account;

        // final userSession = UserSession(
        //     token: userToken,
        //     userId: userId,
        //     // user: userInfo,
        //     // status: userInfo!.status
        //     );
        // context.read<AppCubit>().updateUserSession(userSession);
        return true;
      } else {
        AccountServices().saveUserToken("");
        AccountServices().saveUserId("");
        return false;
      }
    } on DioError catch (e) {
      final loginError = mainRepository.mapDioErrorToMessage(e);
      AccountServices().saveUserToken("");
      AccountServices().saveUserId("");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    text = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      // body: BlocProvider(
      //     create: (BuildContext context) => getIt.get<AppCubit>(),
      //     child: Container(
      //         margin: EdgeInsets.symmetric(horizontal: 50.w),
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           shape: BoxShape.circle,
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey,
      //               offset: Offset(0, 2),
      //               blurRadius: 4.0,
      //             ),
      //           ],
      //         ),
      //         alignment: Alignment.center,
      //         child: Center(
      //           child: SizedBox(
      //             width: 120.w,
      //           ),
      //         ))),
    );
  }
}
