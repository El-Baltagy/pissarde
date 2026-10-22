import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/features/screens/manager_dashboard/data/repo/base_manager_dashboard_repo.dart';

/// Concrete remote implementation of [BaseManagerDashboardRepo].
class ManagerDashboardRemoteRepo implements BaseManagerDashboardRepo {
  final DioHelper dio;
  ManagerDashboardRemoteRepo(this.dio);
}
