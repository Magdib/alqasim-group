import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'inital_notifications.dart';
import 'notifications_topic.dart';
import 'notififctions_service.dart';

class NotificationsServiceImpl implements NotificationsService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  Future<void> init() async {
    await InitialNotifications.initialize();
  }

  @override
  void subscribeToTopic({required String topic}) {
    NotificationsTopic.subscribeToTopic(topic: topic);
  }

  @override
  void unsubscribeFromTopic({required String topic}) {
    NotificationsTopic.unsubscribeFromTopic(topic: topic);
  }
}
