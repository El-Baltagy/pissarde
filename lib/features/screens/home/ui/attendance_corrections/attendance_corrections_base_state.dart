part of 'attendance_corrections_screen.dart';

abstract class AttendanceCorrectionsPageBaseState
    extends State<AttendanceCorrectionsPage> {
  late final HomeCubit homeCubit;
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
    _loadData();
  }

  Future<void> _loadData([BaseRequestBackType? requestType]) async {
    await homeCubit.getAttendanceCorrectionsFunc(requestType ?? Init());
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
