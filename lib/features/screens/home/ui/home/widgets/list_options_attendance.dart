part of '../home_screen.dart';

/// Displays attendance navigation options inside [HomePage].
class ListOptionsAttendance extends StatelessWidget {
  const ListOptionsAttendance({super.key, required this.homeCubit});
final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    final List<({IconData icon, String title, VoidCallback onTap})> items = [
      (
      icon: Icons.today_outlined,
      title: 'attendance_today'.tr(),
      onTap: () => context.router.push(
        AttendanceTodayRoute(args: AttendanceTodayRouteArgs (homeCubit)),
      ),
      ),
      if(StorageHelper.isFullMode)
      ...[

        (
        icon: Icons.history_outlined,
        title: 'attendance_history'.tr(),
        onTap: () => context.router.push(
          AttendanceHistoryRoute(args: AttendanceHistoryRouteArgs (homeCubit)),
        ),
        ),
        (
        icon: Icons.fact_check_outlined,
        title: 'list_attendance_corrections'.tr(),
        onTap: () => context.router.push(
          AttendanceCorrectionsRoute(
            args: AttendanceCorrectionsRouteArgs (homeCubit),
          ),
        ),
        ),
        (
        icon: Icons.qr_code_2_outlined,
        title: 'rotate_branch_qr'.tr(),
        onTap: () => context.router.push(
          RotateBranchQrRoute(
            args: RotateBranchQrRouteArgs(homeCubit),
          ),
        ),
        ),

      ],
      (
      icon: Icons.qr_code_scanner_outlined,
      title: 'check_qr_branch_validation'.tr(),
      onTap: () => context.router.push(
        QrBranchValidationRoute(
          args: QrBranchValidationRouteArgs (homeCubit),
        ),
      ),
      ),
      (
        icon: Icons.edit_calendar_outlined,
        title: 'btn_request_correction'.tr(),
        onTap: () => context.router.push(
          CreateAttendanceCorrectionRoute(
            args: CreateAttendanceCorrectionRouteArgs (homeCubit),
          ),
        ),
      ),

      if(StorageHelper.isDutyEmployee)
      (
        icon: Icons.person_add_alt_1_outlined,
        title: 'check_in_instead_of_another_employee'.tr(),
        onTap: () => context.router.push(
          CheckInForEmployeeRoute(
            args: CheckInForEmployeeRouteArgs (homeCubit),
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
