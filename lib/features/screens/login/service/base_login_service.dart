import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';

import '../../../../core/shared/methods/no_parameter.dart';
import '../data/model/login_req_param.dart';

/// Abstract contract for the login service layer.
abstract class BaseLoginService extends BaseService {
  Future<void> loginServ(
    RequestCallbackObserver<LoginRes, LoginReqParam> requestInfo,
  );



  /// Abstract contract — implemented by [LoginRemoteService].
  Future<void> logoutServ(
    RequestCallbackObserver<bool, NoParameters> requestInfo,
  );

  /// Abstract contract — implemented by [LoginRemoteService].
  Future<void> getProfileServ(
    RequestCallbackObserver<User, NoParameters> requestInfo,
  );
}
