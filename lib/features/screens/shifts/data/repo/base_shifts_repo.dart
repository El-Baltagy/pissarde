import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/creating_shift_res/shift_creating_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/delete_shift_res/delete_shift_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/1-create_shift_req_param.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/2-delete_shift_req_param.dart';

import '../../../../../core/shared/methods/no_parameter.dart';

abstract class BaseShiftsRepo extends BaseRepo {
  Future<Either<Failure, ShiftCreatingRes>> createShiftApi(
    AddEditShiftReqParam? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, GetAllShiftsRes>> getListShiftsApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, DeleteShiftRes>> deleteShiftApi(
    DeleteShiftReqParam? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, ShiftCreatingRes>> updateShiftApi(
    AddEditShiftReqParam? parameter, {
    CancelToken? cancelToken,
  });
}
