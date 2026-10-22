import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/home/data/repo/base_home_repo.dart';
import 'package:newf/features/screens/home/service/base_home_service.dart';

/// Concrete implementation of [BaseHomeService].
/// Depends on [BaseHomeRepo] (abstraction), not on the remote repo directly.
class HomeRemoteService implements BaseHomeService {
  HomeRemoteService(this._remoteRepo, this._localRepo);

  final BaseHomeRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
