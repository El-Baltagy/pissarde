import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/branches/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/branches/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-delete_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-update_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/delete_branch_res.dart';

import '../../../../core/shared/methods/no_parameter.dart';

abstract class BaseBranchesService extends BaseService {
  Future<void> getListBranchesServ(
    RequestCallbackObserver<BranchesList, NoParameters> requestInfo,
  );

  Future<void> createBranchServ(
    RequestCallbackObserver<CreateBranchRes, CreateBranchReqParam> requestInfo,
  );

  Future<void> updateBranchServ(
    RequestCallbackObserver<CreateBranchRes, UpdateBranchReqParam> requestInfo,
  );

  Future<void> deleteBranchServ(
    RequestCallbackObserver<DeleteBranchRes, DeleteBranchReqParam> requestInfo,
  );
}
