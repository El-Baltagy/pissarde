import 'dart:developer' as dev;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:newf/core/notification_helper/local_notification_service.dart';
import 'package:newf/core/notification_helper/service/base_notification_type.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  dev.log('Handling background message: ${message.messageId} | ${message.data}');
}

class FcmHandler {
  FcmHandler._();

  static RemoteMessage? initialMessage;
  static Map<String, dynamic>? _lastNotificationData = {};

  static Map<String, dynamic>? get notificationData => _lastNotificationData;

  /// Retrieves the current device FCM token
  static Future<String?> fcmToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      dev.log('FCM Token: $token');
      return token;
    } catch (e, stack) {
      dev.log('Error getting FCM token: $e', error: e, stackTrace: stack);
      return null;
    }
  }

  /// Deletes the device FCM token (useful on logout)
  static Future<void> deleteToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
      dev.log('FCM token deleted.');
    } catch (e, stack) {
      dev.log('Error deleting FCM token: $e', error: e, stackTrace: stack);
    }
  }

  /// Initializes FCM permissions, local notifications, and event listeners
  static Future<void> initFCM() async {
    try {
      // 1. Request notification permissions
      final settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      dev.log('FCM permission authorization status: ${settings.authorizationStatus}');

      // 2. Set presentation options for foreground on iOS
      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      // 3. Initialize local notifications
      await LocalNotificationService.instance.initLocalNotification();

      // 4. Register top-level background handler
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      // 5. Foreground notifications listener
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        _lastNotificationData = message.data;
        dev.log('Foreground FCM received: title=${message.notification?.title}, body=${message.notification?.body}, data=${message.data}');

        final handler = NotificationBase.getNotificationBuilder(message);
        await handler.handleNotificationAlert(message);
        await handler.handleAppUpdate(message.data);
      });

      // 6. Background opened notification listener (when user taps tray notification while app in background)
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        dev.log('FCM opened from background: ${message.data}');
        final handler = NotificationBase.getNotificationBuilder(message);
        handler.handleNotificationNavigate(message.data);
      });

      // 7. Check for initial message (when user taps notification to launch app from terminated state)
      initialMessage = await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        dev.log('FCM initial message found: ${initialMessage!.data}');
        final handler = NotificationBase.getNotificationBuilder(initialMessage!);
        handler.handleNotificationNavigate(initialMessage!.data);
      }

      // 8. Listen to token refreshes
      FirebaseMessaging.instance.onTokenRefresh.listen((token) {
        dev.log('FCM token refreshed: $token');
      });
    } catch (e, stack) {
      dev.log('FCM initialization error: $e', error: e, stackTrace: stack);
    }
  }
}

/// Alias for backwards compatibility / familiar naming
typedef Messaging = FcmHandler;
