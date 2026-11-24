import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/profile/data/repo/base_profile_repo.dart';
import 'package:newf/features/screens/profile/service/base_profile_service.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

import '../../../../core/base/base_service.dart';
import '../../../../core/shared/methods/no_parameter.dart';

class ProfileRemoteService implements BaseProfileService {
  ProfileRemoteService(this._remoteRepo, this._localRepo);

  final BaseProfileRepo _remoteRepo;
  final BaseLocalRepo _localRepo;

  @override
  Future<void> getListHolidaysServ(
    RequestCallbackObserver<GetAvilableHolidaysRes, NoParameters> requestInfo,
  ) {
    const cacheKey = AppConstant.getListHolidaysKeyCash;
    return requestInfo.handleRequest(
      fetchFromClient: (token) => _remoteRepo.getListHolidaysApi(
        requestInfo.parameter,
        cancelToken: token,
      ),
      fetchLocal: () async {
        final tuple = await _localRepo.readData(cacheKey);
        if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
          return GetAvilableHolidaysRes.fromJson(tuple!.$2);
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
}
