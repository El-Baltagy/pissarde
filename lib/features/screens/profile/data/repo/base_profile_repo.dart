import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../../core/shared/methods/no_parameter.dart';

abstract class BaseProfileRepo extends BaseRepo {
  Future<Either<Failure, GetAvilableHolidaysRes>> getListHolidaysApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });
}
