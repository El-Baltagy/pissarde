part of 'attendance_record_screen.dart';

abstract class AttendanceRecordPageBaseState extends State<AttendanceRecordPage> {
  late final AttendanceRecordCubit attendanceRecordCubit;

  @override
  void initState() {
    attendanceRecordCubit = AttendanceRecordCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
