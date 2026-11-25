part of 'attendance_history_screen.dart';

abstract class AttendanceHistoryPageBaseState
    extends State<AttendanceHistoryPage> {
  DateTime selectedMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadHistory(Init());
  }

  Future<void> _loadHistory(BaseRequestBackType type) async {
    await context.read<HomeCubit>().getAttendanceHistoryFunc(
          type,
          parameter: AttendanceHistoryReqParam(
            month: selectedMonth.month.toString(),
            year: selectedMonth.year.toString(),
            per_page: '20',
            page: 0,
          ),
        );
  }

  Future<void> onRefresh() => _loadHistory(Reload());

  void onPreviousMonth() {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month - 1);
    });
    _loadHistory(Reload());
  }

  void onNextMonth() {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + 1);
    });
    _loadHistory(Reload());
  }
}
