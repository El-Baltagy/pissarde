import 'package:newf/core/shared/methods/print.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/notifications/data/repo/base_notifications_repo.dart';
import 'package:newf/features/screens/notifications/service/base_notifications_service.dart';

/// Concrete implementation of [BaseNotificationsService].
/// Depends on [BaseNotificationsRepo] (abstraction), not on the remote repo directly.
class NotificationsRemoteService implements BaseNotificationsService {
  NotificationsRemoteService(this._remoteRepo, this._localRepo);

  final BaseNotificationsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
