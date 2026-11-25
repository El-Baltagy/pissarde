part of 'attendance_history_screen.dart';

abstract class AttendanceHistoryPageBaseState
    extends State<AttendanceHistoryPage> {
  static final DateTime _firstMonth = DateTime(2026, 11);

  late DateTime selectedMonth;

  DateTime get _currentMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month);
  }

  bool get canGoPrevious =>
      DateTime(selectedMonth.year, selectedMonth.month).isAfter(_firstMonth);

  bool get canGoNext =>
      DateTime(selectedMonth.year, selectedMonth.month).isBefore(_currentMonth);

  @override
  void initState() {
    super.initState();
    final current = _currentMonth;
    selectedMonth = current.isBefore(_firstMonth) ? _firstMonth : current;
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
    if (!canGoPrevious) return;
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month - 1);
    });
    _loadHistory(Reload());
  }

  void onNextMonth() {
    if (!canGoNext) return;
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + 1);
    });
    _loadHistory(Reload());
  }
}
