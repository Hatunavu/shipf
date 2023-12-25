import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shipf/app.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/services/ThemePreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.instance.requestPermission();
  // await Future.delayed(Duration(seconds: 1));
  // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // await Future.delayed(Duration(seconds: 1));
  // String? deviceToken = await firebaseMessaging.getToken();
  // log('token: $deviceToken');

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
