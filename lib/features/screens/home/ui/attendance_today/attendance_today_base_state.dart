part of 'attendance_today_screen.dart';

abstract class AttendanceTodayPageBaseState extends State<AttendanceTodayPage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
    homeCubit.attendanceTodayFunc(Reload());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
