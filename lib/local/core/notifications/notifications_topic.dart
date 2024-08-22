import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsTopic {
 static void subscribeToTopic({required String topic}) {
    FirebaseMessaging.instance.subscribeToTopic(topic);
 }

 static void unsubscribeFromTopic({required String topic}) {
  FirebaseMessaging.instance.unsubscribeFromTopic(topic);
 }
}
