import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/manager_dashboard/data/repo/base_manager_dashboard_repo.dart';
import 'package:newf/features/screens/manager_dashboard/service/base_manager_dashboard_service.dart';

/// Concrete implementation of [BaseManagerDashboardService].
/// Depends on [BaseManagerDashboardRepo] (abstraction), not on the remote repo directly.
class ManagerDashboardRemoteService implements BaseManagerDashboardService {
  ManagerDashboardRemoteService(this._remoteRepo, this._localRepo);

  final BaseManagerDashboardRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
