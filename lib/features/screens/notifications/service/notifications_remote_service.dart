import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';
import 'package:newf/features/screens/notifications/data/repo/base_notifications_repo.dart';
import 'package:newf/features/screens/notifications/service/base_notifications_service.dart';

/// Concrete implementation of [BaseNotificationsService].
/// Depends on [BaseNotificationsRepo] (abstraction), not on the remote repo directly.
class NotificationsRemoteService implements BaseNotificationsService {
  NotificationsRemoteService(this._remoteRepo, this._localRepo);

  final BaseNotificationsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> getNotificationServ(
    RequestCallbackObserver<GetNotificationsRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getNotificationKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getNotificationApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetNotificationsRes.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
