import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';
import 'package:newf/features/screens/login/data/repo/base_login_repo.dart';
import 'package:newf/features/screens/login/service/base_login_service.dart';
import 'package:token_saver/secure_token_manager.dart';

import '../../../../core/shared/methods/no_parameter.dart';
import '../data/model/login_req_param.dart';

/// Concrete implementation of [BaseLoginService].
class LoginRemoteService implements BaseLoginService {
  LoginRemoteService(this._remoteRepo, this._localRepo);

  final BaseLoginRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> loginServ(
    RequestCallbackObserver<LoginRes, LoginReqParam> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.loginApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      saveLocal: (old, newData) async {
        if (newData?.user.id != null) {
          BaseLocalRepo.setSecSessionId(
              (DateTime.now().millisecondsSinceEpoch + 1111).toString());
          await _localRepo.saveData(AppConstant.userKeyCash,
              savedData: newData!.user .toJson());
          await HWSecureSaver.save(
              AppConstant.tokenKeyCash, newData.token .toString());
        }
      },
    );
  }



  @override
  Future<void> logoutServ(
    RequestCallbackObserver<bool, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.logoutKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.logoutApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }

  @override
  Future<void> getProfileServ(
    RequestCallbackObserver<User, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getProfileKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getProfileApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);

        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return User.fromJson(tuple!.$2);
        }
        return null;
      },
      saveLocal: (old, newData) async {
        if (newData != null) {
          await _localRepo.saveData(cacheKey, savedData: newData.toJson());
        }
      },
      clearLocal: () => _localRepo.clearData(cacheKey),
    );
  }
}
