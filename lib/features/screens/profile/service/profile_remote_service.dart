import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/profile/data/repo/base_profile_repo.dart';
import 'package:newf/features/screens/profile/service/base_profile_service.dart';

/// Concrete implementation of [BaseProfileService].
/// Depends on [BaseProfileRepo] (abstraction), not on the remote repo directly.
class ProfileRemoteService implements BaseProfileService {
  ProfileRemoteService(this._remoteRepo, this._localRepo);

  final BaseProfileRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
