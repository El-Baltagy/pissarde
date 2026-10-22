import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/features/screens/main_navigation/data/repo/base_main_navigation_repo.dart';

/// Concrete remote implementation of [BaseMainNavigationRepo].
class MainNavigationRemoteRepo implements BaseMainNavigationRepo {
  final DioHelper dio;
  MainNavigationRemoteRepo(this.dio);
}
