import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/app.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/notification_helper/service/alert_notification_mixin.dart';
import 'package:newf/core/notification_helper/service/base_notification_type.dart';
import 'package:newf/features/screens/notifications/controller/notifications_cubit.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/main.dart';

class ShiftNotification extends NotificationBase with NotificationAlertMixin {
  ShiftNotification();

  @override
  Future<void> handleAppUpdate(Map<String, dynamic> data) async {
    try {
      final context = navigatorKey.currentContext;
      if (context != null) {
        NotificationsCubit.get(context: context).getNotificationFunc(Reload());
      }
    } catch (_) {
      // Ignored if cubit not mounted in current context tree
    }
  }

  @override
  Future<void> handleNotificationAlert(RemoteMessage message) async {
    await sendNotificationAlert(message);
  }

  @override
  void handleNotificationNavigate(Map<String, dynamic> data) {
    NotificationBase.navigateWhenMounted(() {
      ProfileCubit? cubit;
      final context = navigatorKey.currentContext;
      if (context != null) {
        try {
          cubit = context.read<ProfileCubit>();
        } catch (_) {
          cubit = null;
        }
      }
      cubit ??= AppLocator()()<ProfileCubit>();

      appRouter.push(ShiftsRoute(args: ShiftsRouteArgs(cubit)));
    });
  }
}
