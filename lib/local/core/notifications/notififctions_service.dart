abstract class NotificationsService {
   Future<void>  init();

  void subscribeToTopic({required String topic});

  void unsubscribeFromTopic({required String topic});
}
