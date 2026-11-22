import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';

/// Abstract contract for the notifications service layer.
/// The cubit depends on this, not on a concrete implementation.
abstract class BaseNotificationsService extends BaseService {
  // TODO: declare service method signatures here

  /// Abstract contract — implemented by [NotificationsRemoteService].
  Future<void> getNotificationServ(
    RequestCallbackObserver<GetNotificationsRes, NoParameters> requestInfo,
  );
}
