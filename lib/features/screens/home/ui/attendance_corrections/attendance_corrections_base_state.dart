part of 'attendance_corrections_screen.dart';

abstract class AttendanceCorrectionsPageBaseState extends State<AttendanceCorrectionsPage> {
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
