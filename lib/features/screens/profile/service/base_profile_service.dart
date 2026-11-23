import 'package:newf/core/constants/app_typedef.dart';
import 'package:newf/core/base/base_service.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../core/shared/methods/no_parameter.dart';

abstract class BaseProfileService extends BaseService {
  Future<void> getListHolidaysServ(
    RequestCallbackObserver<GetAvilableHolidaysRes, NoParameters> requestInfo,
  );
}
