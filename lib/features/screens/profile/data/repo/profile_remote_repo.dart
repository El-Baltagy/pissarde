import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/features/screens/profile/data/repo/base_profile_repo.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../../core/api_helper/caller_tag.dart';
import '../../../../../core/api_helper/response_handler.dart';
import '../../../../../core/shared/methods/no_parameter.dart';

class ProfileRemoteRepo implements BaseProfileRepo {
  final DioHelper dio;
  ProfileRemoteRepo(this.dio);

  @override
  Future<Either<Failure, GetAvilableHolidaysRes>> getListHolidaysApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.holidays,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: GetAvilableHolidaysRes.fromJson,
    );
  }
}
