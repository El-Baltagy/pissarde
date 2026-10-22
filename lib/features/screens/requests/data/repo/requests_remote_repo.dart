import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/features/screens/requests/data/repo/base_requests_repo.dart';

/// Concrete remote implementation of [BaseRequestsRepo].
class RequestsRemoteRepo implements BaseRequestsRepo {
  final DioHelper dio;
  RequestsRemoteRepo(this.dio);
}
