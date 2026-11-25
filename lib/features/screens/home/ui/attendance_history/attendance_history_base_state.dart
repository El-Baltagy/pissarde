part of 'attendance_history_screen.dart';

abstract class AttendanceHistoryPageBaseState
    extends State<AttendanceHistoryPage> {
  late final HomeCubit homeCubit;
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context: context);
    _loadData();
  }

  Future<void> _loadData([BaseRequestBackType? requestType]) async {
    await homeCubit.getAttendanceHistoryFunc(
      requestType ?? Init(),
      parameter: AttendanceHistoryReqParam(
        month: DateTime.now().month.toString(),
        year: DateTime.now().year.toString(),
        per_page: '10',
      ),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
