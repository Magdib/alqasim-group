import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'show_notifications.dart';
import 'package:proj/main.dart';

class RegisterNotification {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static registerNotification() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      StreamSubscription<RemoteMessage> subscribe =
          FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) async {
          log('Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
          if (message.notification != null) {
            await ShowNotifications.showNotification(
                title: message.notification!.title!,
                body: message.notification!.body!);
          }
        },
      );
      subscribe.onError((data) {
        log("error is $data");
      });
    }
  }
}
