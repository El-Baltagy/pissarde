import 'dart:developer' as dev;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:newf/core/notification_helper/local_notification_service.dart';

mixin NotificationAlertMixin {
  Future<void> sendNotificationAlert(RemoteMessage message) async {
    try {
      final Map<String, dynamic> data = message.data;
      final title = message.notification?.title ??
          data['title']?.toString() ??
          'Pissarde';
      final body = message.notification?.body ??
          data['body']?.toString() ??
          data['message']?.toString();

      if ((body == null || body.isEmpty) && message.notification?.title == null && data['title'] == null) {
        dev.log('Notification has neither title nor body, skipping alert.');
        return;
      }

      final int id = int.tryParse(data['id']?.toString() ?? '') ??
          (DateTime.now().millisecondsSinceEpoch ~/ 1000);

      await LocalNotificationService.instance.showNotification(
        id: id,
        title: title,
        body: body ?? '',
        payload: data,
      );
    } catch (e, stack) {
      dev.log('Error in sendNotificationAlert: $e', error: e, stackTrace: stack);
    }
  }
}
