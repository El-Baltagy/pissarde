import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:newf/features/screens/home/data/model/today_attendacne_res/today_attendacne_res.dart';

part 'attendance_today_base_state.dart';

@RoutePage()
class AttendanceTodayPage extends StatefulWidget implements AutoRouteWrapper {
  const AttendanceTodayPage({super.key, required this.args});
  final AttendanceTodayRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit, child: this);
  }

  @override
  State<AttendanceTodayPage> createState() => _AttendanceTodayPageState();
}

class _AttendanceTodayPageState extends AttendanceTodayPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded && state.attendanceTodayState is ErrorState) {
          final err = state.attendanceTodayState as ErrorState;
          context.showToast(err.failure.message, isSuccess: false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(title: 'attendance_today'.tr()),
        body: Semantics(
          label: 'Attendance today',
          child: BlocSelector<HomeCubit, HomeState, BaseEmit?>(
            selector: (state) =>
                state is HomeLoaded ? state.attendanceTodayState : null,
            builder: (context, emit) {
              if (emit == null || emit is Loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (emit is ErrorState) {
                return Center(
                  child: Text(
                    (emit as ErrorState).failure.message,
                    style: AppTextStyles.font14Regular
                        .copyWith(color: AppColors.primaryActionRed),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              if (emit is Success<TodayAttendacneRes>) {
                final data = emit.data;
                if (data == null) {
                  return Center(child: Text('no_data'.tr()));
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: AppSizes.s16,
                    children: [
                      _InfoCard(
                        icon: Icons.calendar_today_rounded,
                        title: 'date'.tr(),
                        value: data.date,
                      ),
                      _StatusCard(
                        hasCheckedIn: data.has_checked_in,
                        isOpen: data.is_open,
                      ),
                      _InfoCard(
                        icon: Icons.schedule_rounded,
                        title: 'shift'.tr(),
                        value: data.shift.name,
                      ),
                      _InfoCard(
                        icon: Icons.location_city_rounded,
                        title: 'branch'.tr(),
                        value: data.branch.name,
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        spacing: AppSizes.s14,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration: BoxDecoration(
              color: AppColors.roleSwitchBg,
              borderRadius: BorderRadius.circular(AppSizes.r10),
            ),
            child: Icon(icon,
                color: context.theme.primaryColor, size: AppSizes.s20),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.s2,
              children: [
                Text(
                  title,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.contractorGreyText,
                  ),
                ),
                Text(
                  value,
                  style: AppTextStyles.font14SemiBold.copyWith(
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

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.hasCheckedIn, required this.isOpen});

  final bool hasCheckedIn;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final color = hasCheckedIn
        ? AppColors.contractorGreen
        : AppColors.primaryActionRed;
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        spacing: AppSizes.s14,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSizes.r10),
            ),
            child: Icon(
              hasCheckedIn
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: color,
              size: AppSizes.s20,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.s2,
              children: [
                Text(
                  'check_in_status'.tr(),
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.contractorGreyText,
                  ),
                ),
                Text(
                  hasCheckedIn ? 'checked_in'.tr() : 'not_checked_in'.tr(),
                  style: AppTextStyles.font14SemiBold.copyWith(color: color),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p10,
              vertical: AppPadding.p4,
            ),
            decoration: BoxDecoration(
              color: isOpen
                  ? AppColors.contractorGreen.withValues(alpha: 0.12)
                  : AppColors.primaryActionRed.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSizes.r20),
            ),
            child: Text(
              isOpen ? 'open'.tr() : 'closed'.tr(),
              style: AppTextStyles.font12Medium.copyWith(
                color: isOpen
                    ? AppColors.contractorGreen
                    : AppColors.primaryActionRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
