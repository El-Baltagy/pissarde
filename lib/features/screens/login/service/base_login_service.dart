import 'package:newf/core/base/base_service.dart';
import 'package:newf/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
import 'package:newf/features/screens/login/data/model/forget_password_parameter.dart';
import 'package:newf/features/screens/login/data/model/login_parameters.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';

/// Abstract contract for the login service layer.
abstract class BaseLoginService extends BaseService {
  Future<void> loginServ(
    RequestCallbackObserver<LoginRes, LoginParameters> requestInfo,
  );

  Future<void> sendResetPWLinkServ(
    RequestCallbackObserver<ForgetPasswordLink, ForgetPasswordParameter> requestInfo,
  );
}
