import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/features/screens/shifts/data/repo/base_shifts_repo.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/creating_shift_res/shift_creating_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/delete_shift_res/delete_shift_res.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/1-create_shift_req_param.dart';
import 'package:newf/features/screens/shifts/data/model/shifts/2-delete_shift_req_param.dart';

import '../../../../../core/api_helper/caller_tag.dart';
import '../../../../../core/api_helper/response_handler.dart';
import '../../../../../core/shared/methods/no_parameter.dart';


class ShiftsRemoteRepo implements BaseShiftsRepo {
  final DioHelper dio;
  ShiftsRemoteRepo(this.dio);

  @override
  Future<Either<Failure, ShiftCreatingRes>> createShiftApi(
    AddEditShiftReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.createShift,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ShiftCreatingRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, GetAllShiftsRes>> getListShiftsApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.listShifts,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetAllShiftsRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, DeleteShiftRes>> deleteShiftApi(
    DeleteShiftReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteShift(parameter?.id ?? ''),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: DeleteShiftRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, ShiftCreatingRes>> updateShiftApi(
    AddEditShiftReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.putData(
        uri: EndPoints.updateShift(parameter?.id ?? ''),
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: ShiftCreatingRes.fromJson,
    );
  }
}
