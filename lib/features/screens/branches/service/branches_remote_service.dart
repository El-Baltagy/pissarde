import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/branches/data/repo/base_branches_repo.dart';
import 'package:newf/features/screens/branches/service/base_branches_service.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/branches/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/branches/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-delete_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-update_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/delete_branch_res.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/shared/methods/no_parameter.dart';

class BranchesRemoteService implements BaseBranchesService {
  BranchesRemoteService(this._remoteRepo, this._localRepo);

  final BaseBranchesRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> getListBranchesServ(
    RequestCallbackObserver<BranchesList, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getListBranchesKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getListBranchesApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);
        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return BranchesList.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearDataToKey(cacheKey),
    );
  }

  @override
  Future<void> createBranchServ(
    RequestCallbackObserver<CreateBranchRes, CreateBranchReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.createBranchApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }

  @override
  Future<void> updateBranchServ(
    RequestCallbackObserver<CreateBranchRes, UpdateBranchReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.updateBranchApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }

  @override
  Future<void> deleteBranchServ(
    RequestCallbackObserver<DeleteBranchRes, DeleteBranchReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.deleteBranchApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }
}
