import 'package:newf/core/api_helper/dio_helper.dart';
import 'package:newf/features/screens/attendance_record/data/repo/base_attendance_record_repo.dart';

/// Concrete remote implementation of [BaseAttendanceRecordRepo].
class AttendanceRecordRemoteRepo implements BaseAttendanceRecordRepo {
  final DioHelper dio;
  AttendanceRecordRemoteRepo(this.dio);
}
