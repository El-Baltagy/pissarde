import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/features/screens/on_boarding/data/repo/base_on_boarding_repo.dart';

/// Concrete remote implementation of [BaseOnBoardingRepo].
class OnBoardingRemoteRepo implements BaseOnBoardingRepo {
  // ignore: unused_field
  final DioHelper dio;
  OnBoardingRemoteRepo(this.dio);
}
