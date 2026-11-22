import 'dart:convert';
import 'dart:developer' as dev;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:newf/core/app/app.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/notification_helper/service/notification_types/attendance_notification.dart';
import 'package:newf/core/notification_helper/service/notification_types/default_notification.dart';
import 'package:newf/core/notification_helper/service/notification_types/leave_notification.dart';
import 'package:newf/core/notification_helper/service/notification_types/shift_notification.dart';
import 'package:newf/features/screens/main_navigation/controller/main_navigation_cubit.dart';
import 'package:newf/features/screens/notifications/controller/notifications_cubit.dart';
import 'package:newf/main.dart';

abstract class NotificationBase {
  Future<void> handleAppUpdate(Map<String, dynamic> data);
  Future<void> handleNotificationAlert(RemoteMessage message);
  void handleNotificationNavigate(Map<String, dynamic> data);

  /// Waits until the navigator context is mounted before performing navigation.
  static void navigateWhenMounted(void Function() navigationAction, [int attempts = 0]) {
    if (navigatorKey.currentContext != null) {
      navigationAction();
    } else if (attempts < 20) {
      Future.delayed(const Duration(milliseconds: 250), () {
        navigateWhenMounted(navigationAction, attempts + 1);
      });
    } else {
      dev.log('Failed to navigate: navigatorKey.currentContext remained null after 20 attempts.');
    }
  }

  /// Navigates to main home, sets index to 1 (Notifications tab), and reloads notifications.
  static void navigateToNotificationsTab() {
    navigateWhenMounted(() {
      MainNavigationCubit.pendingTabIndex = 1;

      // Navigate to main home
      appRouter.navigate(MainNavigationRoute(args: MainNavigationRouteArgs.noArgs()));
      appRouter.popUntil((route) => route.settings.name == MainNavigationRoute.name);

      _switchToTabAndReload(1);
    });
  }

  static void _switchToTabAndReload(int targetIndex, [int attempts = 0]) {
    if (MainNavigationCubit.instance != null) {
      MainNavigationCubit.instance!.changeTab(targetIndex);
      if (NotificationsCubit.instance != null) {
        NotificationsCubit.instance!.getNotificationFunc(Reload());
      }
      return;
    }

    final context = navigatorKey.currentContext;
    if (context != null) {
      try {
        MainNavigationCubit.get(context: context).changeTab(targetIndex);
        try {
          NotificationsCubit.get(context: context).getNotificationFunc(Reload());
        } catch (_) {}
        return;
      } catch (_) {}
    }

    if (attempts < 20) {
      Future.delayed(const Duration(milliseconds: 150), () {
        _switchToTabAndReload(targetIndex, attempts + 1);
      });
    }
  }

  /// Factory method to determine the notification type based on payload data.
  static NotificationBase getNotificationBuilder(RemoteMessage message) {
    final Map<String, dynamic> data = message.data;
    return getNotificationBuilderFromData(data);
  }

  /// Factory method using a raw Map data.
  static NotificationBase getNotificationBuilderFromData(Map<String, dynamic> data) {
    final String type = (data['type'] ?? data['notification_type'] ?? data['action'] ?? '').toString().toLowerCase();

    if (type.contains('leave') || type.contains('approval') || data.containsKey('leave_id')) {
      return LeaveNotification();
    }

    if (type.contains('attendance') || type.contains('check_in') || type.contains('check_out')) {
      return AttendanceNotification();
    }

    if (type.contains('shift') || data.containsKey('shift_id')) {
      return ShiftNotification();
    }

    return DefaultNotification.instance;
  }

  /// Handles navigation when a notification response with a payload is received.
  static void handleNavigationFromPayload(String? payload) {
    if (payload == null || payload.isEmpty) {
      navigateToNotificationsTab();
      return;
    }

    try {
      final decoded = jsonDecode(payload);
      final Map<String, dynamic> data = decoded is Map<String, dynamic>
          ? decoded
          : {'raw_payload': payload};
      final handler = getNotificationBuilderFromData(data);
      handler.handleNotificationNavigate(data);
    } catch (e, stack) {
      dev.log('Error parsing notification payload: $e', error: e, stackTrace: stack);
      navigateToNotificationsTab();
    }
  }
}
