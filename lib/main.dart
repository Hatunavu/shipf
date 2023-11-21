import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shipf/app.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/services/ThemePreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await ThemePreferences.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // final String lang = await AccountServices().getAccountLanguage();

  runApp(MyApp(
    lang: 'vi',
  ));
}
