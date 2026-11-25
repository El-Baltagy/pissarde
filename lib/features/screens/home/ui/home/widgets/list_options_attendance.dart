part of '../home_screen.dart';

/// Displays attendance navigation options inside [HomePage].
class ListOptionsAttendance extends StatelessWidget {
  const ListOptionsAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    final List<({IconData icon, String title, VoidCallback onTap})> items = [
      (
        icon: Icons.today_outlined,
        title: 'attendance_today'.tr(),
        onTap: () => context.router.push(
          AttendanceTodayRoute(args: AttendanceTodayRouteArgs.noArgs()),
        ),
      ),
      (
        icon: Icons.history_outlined,
        title: 'attendance_history'.tr(),
        onTap: () => context.router.push(
          AttendanceHistoryRoute(args: AttendanceHistoryRouteArgs.noArgs()),
        ),
      ),
      (
        icon: Icons.fact_check_outlined,
        title: 'list_attendance_corrections'.tr(),
        onTap: () => context.router.push(
          AttendanceCorrectionsRoute(
            args: AttendanceCorrectionsRouteArgs.noArgs(),
          ),
        ),
      ),
      (
        icon: Icons.edit_calendar_outlined,
        title: 'btn_request_correction'.tr(),
        onTap: () => context.router.push(
          CreateAttendanceCorrectionRoute(
            args: CreateAttendanceCorrectionRouteArgs.noArgs(),
          ),
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: ContainerListWidget(items: items),
    );
  }
}
