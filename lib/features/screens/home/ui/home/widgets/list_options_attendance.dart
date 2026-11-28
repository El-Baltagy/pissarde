part of '../home_screen.dart';

/// Displays attendance navigation options inside [HomePage] as a list or grid.
class ListOptionsAttendance extends StatelessWidget {
  const ListOptionsAttendance({
    super.key,
    required this.homeCubit,
    this.isGrid = false,
  });

  final HomeCubit homeCubit;
  final bool isGrid;
  @override
  Widget build(BuildContext context) {
    final List<({IconData icon, String title, VoidCallback onTap})> items = [
      // if(!StorageHelper.isAdmin)
      (
      icon: Icons.today_outlined,
      title: 'attendance_today'.tr(),
      onTap: () => context.router.push(
        AttendanceTodayRoute(args: AttendanceTodayRouteArgs (homeCubit)),
      ),
      ),

      if(StorageHelper.isAdminOrHr)
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
if(StorageHelper.isAdminOrHrOrSupervisor)
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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: isGrid
            ? _buildOptionsGrid(context, items)
            : ContainerListWidget(
                key: const ValueKey('options_list'),
                items: items,
              ),
      ),
    );
  }

  /// Builds the 2-column grid layout for attendance options.
  Widget _buildOptionsGrid(
    BuildContext context,
    List<({IconData icon, String title, VoidCallback onTap})> items,
  ) {
    return GridView.builder(
      key: const ValueKey('options_grid'),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      padding: EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSizes.s12,
        crossAxisSpacing: AppSizes.s12,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: item.onTap,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p12),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppSizes.r14),
              border: Border.all(
                color: AppColors.cardBorder,
                width: AppSizes.s1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSizes.s10,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p10),
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchBg,
                    borderRadius: BorderRadius.circular(AppSizes.r12),
                  ),
                  child: Icon(
                    item.icon,
                    color: context.theme.primaryColor,
                    size: AppSizes.s24,
                  ),
                ),
                Text(
                  item.title,
                  style: AppTextStyles.font13Medium,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
