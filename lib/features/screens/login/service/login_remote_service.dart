import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
import 'package:newf/features/screens/login/data/model/forget_password_parameter.dart';
import 'package:newf/features/screens/login/data/model/login_parameters.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';
import 'package:newf/features/screens/login/data/repo/base_login_repo.dart';
import 'package:newf/features/screens/login/service/base_login_service.dart';
import 'package:token_saver/secure_token_manager.dart';

/// Concrete implementation of [BaseLoginService].
class LoginRemoteService implements BaseLoginService {
  LoginRemoteService(this._remoteRepo, this._localRepo);

  final BaseLoginRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> loginServ(
    RequestCallbackObserver<LoginRes, LoginParameters> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.loginApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      saveLocal: (old, newData) async {
        if (newData?.status == 'success') {
          BaseLocalRepo.setSecSessionId(
              (DateTime.now().millisecondsSinceEpoch + 1111).toString());
          await _localRepo.saveData(AppConstant.userKeyCash,
              savedData: newData!.data.user.toJson());
          await HWSecureSaver.save(
              AppConstant.tokenKeyCash, newData.data.token.toString());
        }
      },
    );
  }

  @override
  Future<void> sendResetPWLinkServ(
    RequestCallbackObserver<ForgetPasswordLink, ForgetPasswordParameter> requestInfo,
  ) {
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.sendresetpwlinkApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
    );
  }
}
