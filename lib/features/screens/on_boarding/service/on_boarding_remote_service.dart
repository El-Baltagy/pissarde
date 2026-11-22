import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/on_boarding/data/repo/base_on_boarding_repo.dart';
import 'package:newf/features/screens/on_boarding/service/base_on_boarding_service.dart';

/// Concrete implementation of [BaseOnBoardingService].
/// Depends on [BaseOnBoardingRepo] (abstraction), not on the remote repo directly.
class OnBoardingRemoteService implements BaseOnBoardingService {
  OnBoardingRemoteService(this._remoteRepo, this._localRepo);

  // ignore: unused_field
  final BaseOnBoardingRepo _remoteRepo;
  // ignore: unused_field
  final BaseLocalRepo _localRepo;
}
