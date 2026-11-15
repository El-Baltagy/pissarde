import 'package:newf/core/base/base_service.dart';
import 'package:newf/core/shared/methods/no_parameter.dart';
import 'package:newf/features/screens/home/data/model/chech_in_status/chech_in_status.dart';
import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/data/model/check_out_req_param.dart';

/// Abstract contract for the home service layer.
/// The cubit depends on this, not on a concrete implementation.
abstract class BaseHomeService extends BaseService {
  // TODO: declare service method signatures here

  /// Abstract contract — implemented by [HomeRemoteService].
  Future<void> attendanceTodayServ(
    RequestCallbackObserver<ChechInStatus, NoParameters> requestInfo,
  );

  /// Abstract contract — implemented by [HomeRemoteService].
  Future<void> checkInServ(
    RequestCallbackObserver<ChechInRes, CheckInReqParam> requestInfo,
  );

  /// Abstract contract — implemented by [HomeRemoteService].
  Future<void> checkOutServ(
    RequestCallbackObserver<ChechInRes, CheckOutReqParam> requestInfo,
  );
}
