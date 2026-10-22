import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/requests/data/repo/base_requests_repo.dart';
import 'package:newf/features/screens/requests/service/base_requests_service.dart';

/// Concrete implementation of [BaseRequestsService].
/// Depends on [BaseRequestsRepo] (abstraction), not on the remote repo directly.
class RequestsRemoteService implements BaseRequestsService {
  RequestsRemoteService(this._remoteRepo, this._localRepo);

  final BaseRequestsRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
