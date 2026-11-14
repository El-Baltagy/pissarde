import 'package:newf/core/base/base_service.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';

import '../data/model/login_req_param.dart';

/// Abstract contract for the login service layer.
abstract class BaseLoginService extends BaseService {
  Future<void> loginServ(
    RequestCallbackObserver<LoginRes, LoginReqParam> requestInfo,
  );


}
