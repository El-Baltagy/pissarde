import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/employees/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/employees/data/model/employees/3-delete_employee_req_param.dart';
import 'package:newf/features/screens/employees/data/model/list_employees_param.dart';

import '../../../../core/shared/methods/no_parameter.dart';
import '../../../../core/shared/methods/print.dart';
import '../data/model/get_supervisors_list/get_supervisors_list.dart';

abstract class BaseEmployeesService extends BaseService {
  Future<void> getListEmployeesServ(
    RequestCallbackObserver<GetAllEmployeesRes, EmployeesListParam> requestInfo,
  );

  Future<void> addEditEmployeeServ(
    RequestCallbackObserver<CreateEmployeeRes, CreateEmployeeReqParam> requestInfo,
  );

  Future<void> deleteEmployeeServ(
    RequestCallbackObserver<CreateEmployeeRes, DeleteEmployeeReqParam> requestInfo,
  );

  /// Abstract contract — implemented by [EmployeesRemoteService].
  Future<void> getSupervisorsServ(
    RequestCallbackObserver<GetSupervisorsList, NoParameter> requestInfo,
  );
}
