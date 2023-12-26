import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shipf/app.dart';
import 'package:shipf/data/remote/firebase/firebase_api.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/services/ThemePreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

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
