import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:newf/core/api_helper/dio_error_handler.dart';
import 'package:newf/core/base/base_remote_repo.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/branches/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/branches/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-delete_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-update_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/delete_branch_res.dart';

import '../../../../../core/shared/methods/no_parameter.dart';

abstract class BaseBranchesRepo extends BaseRepo {
  Future<Either<Failure, CreateBranchRes>> createBranchApi(
    CreateBranchReqParam? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, BranchesList>> getListBranchesApi(
    NoParameters? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, DeleteBranchRes>> deleteBranchApi(
    DeleteBranchReqParam? parameter, {
    CancelToken? cancelToken,
  });

  Future<Either<Failure, CreateBranchRes>> updateBranchApi(
    UpdateBranchReqParam? parameter, {
    CancelToken? cancelToken,
  });
}
