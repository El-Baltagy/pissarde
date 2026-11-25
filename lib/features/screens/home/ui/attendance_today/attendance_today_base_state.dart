part of 'attendance_today_screen.dart';

abstract class AttendanceTodayPageBaseState extends State<AttendanceTodayPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().attendanceTodayFunc(Init());
  }

  Future<void> onRefresh() async {
    await context.read<HomeCubit>().attendanceTodayFunc(Reload());
  }
}
