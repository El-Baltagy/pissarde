part of '../home_screen.dart';

class BranchStatusCardWidget extends StatefulWidget {
  const BranchStatusCardWidget({super.key});

  @override
  State<BranchStatusCardWidget> createState() => _BranchStatusCardWidgetState();
}

class _BranchStatusCardWidgetState extends State<BranchStatusCardWidget> {
  static const String _allBranchesKey = '__all_branches__';
  String? _selectedBranchId;

  @override
  void initState() {
    super.initState();
    if (StorageHelper.isSupervisor) {
      _selectedBranchId = StorageHelper.userData?.branch?.id.toString();
    }
  }

  /// Triggers the attendance summary API for the chosen branch (or null for all).
  void _onBranchSelected(String value) {
    if (StorageHelper.isSupervisor) return;
    final nextBranchId = value == _allBranchesKey ? null : value;
    if (nextBranchId == _selectedBranchId) return;
    setState(() => _selectedBranchId = nextBranchId);
    HomeCubit.get(context: context).attendanceSummaryFunc(
      Reload(),
      parameter: GetDailySummaryAttendanceParam(branch_id: nextBranchId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBorder.withValues(alpha: 0.3),
            blurRadius: AppSizes.s8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: BlocSelector<HomeCubit, HomeState, BaseEmit?>(
        selector: (state) =>
            state is HomeLoaded ? state.attendanceSummaryState : null,
        builder: (context, emit) {
          if (emit is ErrorState) {
            return _buildErrorBody(context, emit.failure.message);
          }

          final isLoading = emit == null || emit is Loading;
          final summary = emit is Success<DailyAttendanceSummaryRes>
              ? emit.data
              : null;

          return Column(
            spacing: AppSizes.s14,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderRow(context, summary, isLoading),
              Skeletonizer(
                enabled: isLoading,
                child: _buildStatusMetricsRow(summary),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildErrorBody(BuildContext context, String message) {
    return Column(
      spacing: AppSizes.s12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeaderRow(context, null, false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.primaryActionRed,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                HomeCubit.get(context: context).attendanceSummaryFunc(
                  Reload(),
                  parameter: GetDailySummaryAttendanceParam(
                    branch_id: _selectedBranchId,
                  ),
                );
              },
              icon: Icon(
                Icons.refresh_rounded,
                color: context.theme.primaryColor,
                size: AppSizes.s20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderRow(
    BuildContext context,
    DailyAttendanceSummaryRes? summary,
    bool isLoading,

  ) {
    final totalEmployees = summary?.total_employees ?? 0;

//total_employees_in_all_branches
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: AppSizes.s8,
      children: [
        /// RTL-first: icon + title (right)
        Expanded(
          child: Row(
            spacing: AppSizes.s10,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: AppColors.roleSwitchBg,
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                ),
                child: Icon(
                  Icons.groups_rounded,
                  color: context.theme.primaryColor,
                  size: AppSizes.s20,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'branch_status_title'.tr(),
                      style: AppTextStyles.font14Bold,
                    ),
                    Skeletonizer(
                      enabled: isLoading,
                      child: Text(
                        '${'total_employees'.tr()}: $totalEmployees ',
                        style: AppTextStyles.font11Regular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Branch dropdown selector (left)
        _buildBranchDropdown(context,),
      ],
    );
  }

  /// Builds the branch filter dropdown menu with "All Branches" (null) option.
  Widget _buildBranchDropdown(BuildContext context,bool disableSelection,ValueNotifier<int?>notifierId) {
    return BlocSelector<BranchesCubit, BranchesState, BaseEmit?>(
      selector: (state) =>
          state is BranchesLoaded ? state.getListBranchesState : null,
      builder: (context, branchState) {
        final branches = branchState is Success<BranchesList>
            ? branchState.data?.data ?? <DataItem>[]
            : <DataItem>[];


        List<(int?,String)>list=[
          ( null,'all_branches'.tr()),
          ...branches.map((e) =>( e.id,e.name))];

        return ValueListenableBuilder(valueListenable: notifierId, builder: (context, value, child) {

          return PopupMenuButton<int?>(
            enabled: disableSelection,
            initialValue: value,
            onSelected: (value) =>  notifierId.value=value,
            itemBuilder:(context) =>  list.map((e) => PopupMenuItem<int?>(
              value: e.$1 ,
              child: Text(
                e.$2,
                style: AppTextStyles.font13Medium,
              ),
            ) ).toList(),

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p10,
                vertical: AppPadding.p6,
              ),
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r12),
                border: Border.all(
                  color: AppColors.cardBorder,
                  width: AppSizes.s1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: AppSizes.s4,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: AppSizes.s100),
                    child: Text(
                      list[value??0].$2,
                      style: AppTextStyles.font11Regular.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (!disableSelection)
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: context.theme.primaryColor,
                      size: AppSizes.s18,
                    ),
                ],
              ),
            ),
          );
        },);
      },
    );
  }

  Widget _buildStatusMetricsRow(DailyAttendanceSummaryRes? summary) {
    final metrics = [
      (
        count: '${summary?.present_on_time ?? 0}',
        labelKey: 'status_present',
        bgColor: AppColors.statusPresentBg,
        textColor: AppColors.statusPresentText,
      ),
      (
        count: '${summary?.late ?? 0}',
        labelKey: 'status_late',
        bgColor: AppColors.statusLateBg,
        textColor: AppColors.statusLateText,
      ),
      (
        count: '${summary?.absent ?? 0}',
        labelKey: 'status_absent',
        bgColor: AppColors.statusAbsentBg,
        textColor: AppColors.statusAbsentText,
      ),
      (
        count: '${summary?.on_leave ?? 0}',
        labelKey: 'status_leave',
        bgColor: AppColors.statusLeaveBg,
        textColor: AppColors.statusLeaveText,
      ),
    ];

    return Row(
      spacing: AppSizes.s8,
      children: metrics
          .map(
            (m) => _buildMetricBox(
              count: m.count,
              labelKey: m.labelKey,
              bgColor: m.bgColor,
              textColor: m.textColor,
            ),
          )
          .toList(),
    );
  }

  Widget _buildMetricBox({
    required String count,
    required String labelKey,
    required Color bgColor,
    required Color textColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        child: Column(
          spacing: AppSizes.s4,
          children: [
            Text(
              count,
              style: AppTextStyles.font18Bold.copyWith(color: textColor),
            ),
            Text(
              labelKey.tr(),
              style: AppTextStyles.font12Medium.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
