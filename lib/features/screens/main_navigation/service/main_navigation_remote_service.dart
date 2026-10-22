import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/main_navigation/data/repo/base_main_navigation_repo.dart';
import 'package:newf/features/screens/main_navigation/service/base_main_navigation_service.dart';

/// Concrete implementation of [BaseMainNavigationService].
/// Depends on [BaseMainNavigationRepo] (abstraction), not on the remote repo directly.
class MainNavigationRemoteService implements BaseMainNavigationService {
  MainNavigationRemoteService(this._remoteRepo, this._localRepo);

  final BaseMainNavigationRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
