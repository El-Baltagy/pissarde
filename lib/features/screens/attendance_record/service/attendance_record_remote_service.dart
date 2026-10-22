import 'package:newf/core/base/base_local_repo.dart';
import 'package:newf/features/screens/attendance_record/data/repo/base_attendance_record_repo.dart';
import 'package:newf/features/screens/attendance_record/service/base_attendance_record_service.dart';

/// Concrete implementation of [BaseAttendanceRecordService].
/// Depends on [BaseAttendanceRecordRepo] (abstraction), not on the remote repo directly.
class AttendanceRecordRemoteService implements BaseAttendanceRecordService {
  AttendanceRecordRemoteService(this._remoteRepo, this._localRepo);

  final BaseAttendanceRecordRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
