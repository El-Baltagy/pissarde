import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/creating_shift_res/shift_creating_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/delete_shift_res/delete_shift_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/1-create_shift_req_param.dart';

import '../../../../core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/2-delete_shift_req_param.dart';

abstract class BaseShiftsService extends BaseService {
  Future<void> getListShiftsServ(
    RequestCallbackObserver<GetAllShiftsRes, NoParameters> requestInfo,
  );

  Future<void> createShiftServ(
    RequestCallbackObserver<ShiftCreatingRes, AddEditShiftReqParam> requestInfo,
  );

  Future<void> updateShiftServ(
    RequestCallbackObserver<ShiftCreatingRes, AddEditShiftReqParam> requestInfo,
  );

  Future<void> deleteShiftServ(
    RequestCallbackObserver<DeleteShiftRes, DeleteShiftReqParam> requestInfo,
  );
}
