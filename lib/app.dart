import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/l10n/l10n.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/app_state.dart';
import 'package:shipf/ui/router/router.gr.dart';

final _appRouter = getIt<AppRouter>();
final _botToastBuilder = BotToastInit();

class MyApp extends StatelessWidget {
  final String lang;
  MyApp({Key? key, required this.lang}) : super(key: key);

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) => BlocProvider(
        create: (context) => appCubit..getInitRole(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp.router(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              locale: state.languageCode.isNotEmpty
                  ? Locale(state.languageCode)
                  : lang.isNotEmpty
                      ? Locale(lang)
                      : null,
              title: 'ShipF',
              debugShowCheckedModeBanner: false,
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: AutoRouterDelegate(
                _appRouter,
                navigatorObservers: () => [
                  AutoRouteObserver(),
                ],
              ),
              builder: EasyLoading.init(
                builder: (context, widget) => _botToastBuilder(context, widget),
              ),
            );
          },
        ),
      ),
    );
  }
}
