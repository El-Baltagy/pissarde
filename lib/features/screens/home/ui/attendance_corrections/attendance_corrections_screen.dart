import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/shared/methods/date_helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/list_attendance_corrections_res/list_attendance_corrections_res.dart';
import 'package:newf/features/screens/home/data/model/corrections_pagination.dart';
import 'package:newf/features/screens/home/data/model/attendance_corrections_param.dart';

part 'attendance_corrections_base_state.dart';

@RoutePage()
class AttendanceCorrectionsPage extends StatefulWidget
    implements AutoRouteWrapper {
  const AttendanceCorrectionsPage({super.key, required this.args});
  final AttendanceCorrectionsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit, child: this);
  }

  @override
  State<AttendanceCorrectionsPage> createState() =>
      _AttendanceCorrectionsPageState();
}

class _AttendanceCorrectionsPageState
    extends AttendanceCorrectionsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded &&
            state.attendanceCorrectionsState is ErrorState) {
          final err = state.attendanceCorrectionsState as ErrorState;
          context.showToast(err.failure.message, isSuccess: false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(title: 'list_attendance_corrections'.tr()),
        body: Semantics(
          label: 'Attendance corrections',
          child: BlocSelector<HomeCubit, HomeState, BaseEmit?>(
            selector: (state) => state is HomeLoaded
                ? state.attendanceCorrectionsState
                : null,
            builder: (context, emit) {
              ListAttendanceCorrectionsRes? data;
              if (emit is Success<ListAttendanceCorrectionsRes>) {
                data = emit.data;
              } else if (emit is Loading<ListAttendanceCorrectionsRes>) {
                data = emit.item;
              }
              final pagination = data?.pagination;
              final items = data?.data ?? [];
              final isInitialLoading = data == null;

              return SmartRefresher(
                controller: refreshController,
                onRefresh: () async => await _loadData(Reload()).whenComplete(() {
                  refreshController.loadComplete();
                  refreshController.refreshCompleted();
                }),
                onLoading: () async {
                  if (pagination == null) {
                    refreshController.loadComplete();
                    return;
                  }
                  await homeCubit.getAttendanceCorrectionsFunc(
                    pagination.toGetPaginationInfo(data),
                    parameter: AttendanceCorrectionsParam(
                        page: pagination.current_page),
                  );
                  refreshController.loadComplete();
                },
                enablePullUp: (pagination != null &&
                    pagination.current_page < pagination.last_page),
                footer: CustomFooter(
                  height: 50,
                  builder: (BuildContext context, LoadStatus? mode) {
                    if (mode == LoadStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SizedBox.shrink();
                  },
                ),
                child: isInitialLoading
                    ? const Center(child: CircularProgressIndicator())
                    : (emit is ErrorState)
                        ? Center(
                            child: Text(
                              (emit).failure.message,
                              style: AppTextStyles.font14Regular.copyWith(
                                  color: AppColors.primaryActionRed),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : (items.isEmpty)
                            ? Center(
                                child: Text('no_attendance_corrections'.tr(),
                                    style: AppTextStyles.font14Regular),
                              )
                            : ListView.separated(
                                padding:
                                    const EdgeInsets.all(AppPadding.p16),
                                itemCount: items.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: AppSizes.s12),
                                itemBuilder: (_, i) =>
                                    _CorrectionCard(item: items[i]),
                              ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CorrectionCard extends StatelessWidget {
  const _CorrectionCard({required this.item});
  final DataItem item;

  @override
  Widget build(BuildContext context) {
    final statusColor = item.status.value == 'approved'
        ? AppColors.contractorGreen
        : (item.status.value == 'rejected'
            ? AppColors.primaryActionRed
            : AppColors.contractorGreyText);
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.s8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.date,
                style: AppTextStyles.font14SemiBold.copyWith(
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p10,
                  vertical: AppPadding.p4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSizes.r20),
                ),
                child: Text(
                  item.status.label,
                  style: AppTextStyles.font12Medium.copyWith(color: statusColor),
                ),
              ),
            ],
          ),
          Row(
            spacing: AppSizes.s12,
            children: [
              _TimeChip(
                icon: Icons.login_rounded,
                label: 'check_in_date'.tr(),
                value: DateTimeHelper.formatDateTimeFromString(item.requested_check_in_at, DateFormat(DateTimeHelper.formatTimeOnly)),
              ),
              _TimeChip(
                icon: Icons.logout_rounded,
                label: 'check_out_date'.tr(),
                value: DateTimeHelper.formatDateTimeFromString(item.requested_check_out_at, DateFormat(DateTimeHelper.formatTimeOnly)),
              ),
            ],
          ),
          if (item.reason.isNotEmpty)
            Text(
              item.reason,
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.contractorGreyText,
              ),
            ),
        ],
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  const _TimeChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        spacing: AppSizes.s6,
        children: [
          Icon(icon, size: AppSizes.s16, color: AppColors.contractorGreyText),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.font11Regular.copyWith(
                    color: AppColors.contractorGreyText,
                  ),
                ),
                Text(
                  value,
                  style: AppTextStyles.font12Medium.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
