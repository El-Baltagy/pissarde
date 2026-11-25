part of 'attendance_today_screen.dart';

abstract class AttendanceTodayPageBaseState extends State<AttendanceTodayPage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = HomeCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
