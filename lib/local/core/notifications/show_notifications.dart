import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math' as math;

class ShowNotifications {
static  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
static  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const android = AndroidNotificationDetails(
      'channel id',
      'channel name',
      priority: Priority.high,
      // color:Colors.transparent,
      importance: Importance.max,
      channelShowBadge: false,
      onlyAlertOnce: true,
    );
    const iOS = DarwinNotificationDetails();
    const platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        math.Random().nextInt(100), title, body, platform);
  }
}
