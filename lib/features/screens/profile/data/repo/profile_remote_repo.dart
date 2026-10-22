import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/features/screens/profile/data/repo/base_profile_repo.dart';

/// Concrete remote implementation of [BaseProfileRepo].
class ProfileRemoteRepo implements BaseProfileRepo {
  final DioHelper dio;
  ProfileRemoteRepo(this.dio);
}
