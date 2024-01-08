import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shipf/ui/services/account_services.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This is channel is used for importance notification',
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // navigatorKey.currentState?.pushNamed();
  }

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
        handleMessage(message);
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  _androidChannel.id, _androidChannel.name,
                  channelDescription: _androidChannel.description,
                  icon: '@drawable/ic_launcher')),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future<void> initNotifications() async {
    String? fCMToken = '';
    await _firebaseMessaging.requestPermission();
    if (Platform.isIOS) {
      String? apnsToken = await _firebaseMessaging.getAPNSToken();
      if (apnsToken != null) {
        fCMToken = await _firebaseMessaging.getToken();
      } else {
        await Future.delayed(
          const Duration(
            seconds: 3,
          ),
        );
        apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken != null) {
          fCMToken = await _firebaseMessaging.getToken();
        }
      }
    } else {
      fCMToken = await _firebaseMessaging.getToken();
    }
    AccountServices().saveNotificationToken(fCMToken ?? '');
    log('Token: $fCMToken');
    initPushNotifications();
    initLocalNotifications();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}
