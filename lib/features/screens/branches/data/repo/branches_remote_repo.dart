import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/core/constants/app_api.dart';
import 'package:newf/features/screens/branches/data/repo/base_branches_repo.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/branches/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/branches/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-delete_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-update_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/delete_branch_res.dart';

import '../../../../../core/api_helper/caller_tag.dart';
import '../../../../../core/api_helper/response_handler.dart';
import '../../../../../core/shared/methods/no_parameter.dart';


class BranchesRemoteRepo implements BaseBranchesRepo {
  final DioHelper dio;
  BranchesRemoteRepo(this.dio);

  @override
  Future<Either<Failure, CreateBranchRes>> createBranchApi(
    CreateBranchReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.postData(
        uri: EndPoints.createBranch,
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: CreateBranchRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, BranchesList>> getListBranchesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.getData(
        uri: EndPoints.listBranches,
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: BranchesList.fromJson,
    );
  }

  @override
  Future<Either<Failure, DeleteBranchRes>> deleteBranchApi(
    DeleteBranchReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.deleteData(
        uri: EndPoints.deleteBranch(parameter?.id ?? ''),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: DeleteBranchRes.fromJson,
    );
  }

  @override
  Future<Either<Failure, CreateBranchRes>> updateBranchApi(
    UpdateBranchReqParam? parameter, {
    CancelToken? cancelToken,
  }) async {
    return handleResponse(
      onCallData: dio.putData(
        uri: EndPoints.updateBranch(parameter?.id ?? ''),
        data: parameter?.toJson(),
        cancelToken: cancelToken,
        caller: callerTag(),
      ),
      asObject: CreateBranchRes.fromJson,
    );
  }
}
