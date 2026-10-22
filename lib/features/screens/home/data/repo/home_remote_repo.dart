import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/features/screens/home/data/repo/base_home_repo.dart';

/// Concrete remote implementation of [BaseHomeRepo].
class HomeRemoteRepo implements BaseHomeRepo {
  final DioHelper dio;
  HomeRemoteRepo(this.dio);
}
