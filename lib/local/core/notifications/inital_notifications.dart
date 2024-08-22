import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj/global/core/functions/check_internet_connection.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'register_notifications.dart';
import 'show_notifications.dart';

class InitialNotifications {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static late Box authBox;
  static Future<void> initialize() async {
    authBox = Hive.box(HiveBoxes.authBox);
    if (await checkInternet()) {
      try {
        const android = AndroidInitializationSettings('app_icon');
        const iOS = DarwinInitializationSettings();
        const initSettings = InitializationSettings(android: android, iOS: iOS);
        flutterLocalNotificationsPlugin.initialize(
          initSettings,
        );
        await RegisterNotification.registerNotification();
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
          log("message is  $message");
          if (message != null) {
            ShowNotifications.showNotification(
                title: message.notification!.title!,
                body: message.notification!.body!);
          }
        });
        // await messaging.getToken().then(
        //       (value) => {
        //         if (value != null)
        //           {
        //             GetStorageClass().setString(
        //                 key: LocalStorageKey.fcmToken.toString(), value: value),
        //             AppServices.fcmToken = value,
        //             LogHelper.logCyan(
        //                 "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),
        //             LogHelper.logCyan(
        //                 "___________FCM TOKEN IS : ${AppServices.fcmToken}"),
        //           },
        //       },
        //     );
      } catch (exception) {
        log("exception $exception");
      }
    } else {
      log("NO INTERNET CONNECTION");
    }
  }
}
