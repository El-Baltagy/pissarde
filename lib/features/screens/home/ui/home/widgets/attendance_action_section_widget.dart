import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/methods/position_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/data/model/check_out_req_param.dart';
import 'package:newf/features/screens/home/ui/qr_branch_validation/widgets/qr_camera_scanner_widget.dart';

import '../../../data/model/check_in_today_status_res/check_in_today_status_res.dart';

class AttendanceActionSectionWidget extends StatefulWidget {
  const AttendanceActionSectionWidget({super.key});

  @override
  State<AttendanceActionSectionWidget> createState() => _AttendanceActionSectionWidgetState();
}

class _AttendanceActionSectionWidgetState extends State<AttendanceActionSectionWidget> {
  bool _isLocating = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: _cubitListener,
      builder: (context, state) {
        CheckInTodayStatusRes? status;
        if (state is HomeLoaded && state.attendanceTodayState is Success<CheckInTodayStatusRes>) {
          status = (state.attendanceTodayState as Success<CheckInTodayStatusRes>).data;
        }

        final bool isCheckedIn = status?.is_open ?? false;
        final bool isCheckingIn = state is HomeLoaded && state.checkInState is Loading;
        final bool isCheckingOut = state is HomeLoaded && state.checkOutState is Loading;
        final bool isActionLoading = isCheckingIn || isCheckingOut || _isLocating;
        final bool isStatusLoading = state is HomeLoaded && state.attendanceTodayState is Loading;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSizes.s12,
            children: [
              _buildStatusHeader(status: status, isCheckedIn: isCheckedIn, isLoading: isStatusLoading),
              _buildToggleButton(
                context: context,
                isCheckedIn: isCheckedIn,
                isLoading: isActionLoading,
              ),
            ],
          ),
        );
      },
    );
  }

  void _cubitListener(BuildContext context, HomeState state) {
    if (state is! HomeLoaded) return;

    if (state.checkInState is Success<ChechInRes>) {
      final ChechInRes? res = (state.checkInState as Success<ChechInRes>).data;
      context.showToast(res?.message.isNotEmpty == true ? res!.message : 'btn_check_in_gps'.tr());
    } else if (state.checkInState is ErrorState) {
      final ErrorState error = state.checkInState as ErrorState;
      context.showToast(error.failure.message, isSuccess: false);
    }

    if (state.checkOutState is Success<ChechInRes>) {
      final ChechInRes? res = (state.checkOutState as Success<ChechInRes>).data;
      context.showToast(res?.message.isNotEmpty == true ? res!.message : 'btn_check_out_gps'.tr());
    } else if (state.checkOutState is ErrorState) {
      final ErrorState error = state.checkOutState as ErrorState;
      context.showToast(error.failure.message, isSuccess: false);
    }
  }

  Future<void> _handleToggleAction({
    required bool isCheckedIn,
  }) async {
    final scannedToken = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const QrCameraScannerPage()),
    );

    if (!mounted || scannedToken == null || scannedToken.trim().isEmpty) {
      return;
    }

    setState(() => _isLocating = true);

    try {
      final pos = await PositionHelper.instance.getLatLng();
      if (!mounted) return;

      final cubit = context.read<HomeCubit>();
      final String latitude = pos?.latitude.toString() ?? '0.0';
      final String longitude = pos?.longitude.toString() ?? '0.0';
      final String qrToken = scannedToken.trim();

      if (isCheckedIn) {
        await cubit.checkOutFunc(
          Reload(),
          parameter: CheckOutReqParam(
            qr_token: qrToken,
            latitude: latitude,
            longitude: longitude,
          ),
        );
      } else {
        await cubit.checkInFunc(
          Reload(),
          parameter: CheckInReqParam(
            qr_token: qrToken,
            latitude: latitude,
            longitude: longitude,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLocating = false);
      }
    }
  }

  Widget _buildStatusHeader({
    required CheckInTodayStatusRes? status,
    required bool isCheckedIn,
    required bool isLoading,
  }) {
    if (isLoading && status == null) {
      return Center(
        child: Text(
          'current_status_attendance_time'.tr(),
          style: AppTextStyles.font12Medium.copyWith(color: AppColors.lightTextSecondary),
        ),
      );
    }

    final String statusText = _resolveStatusText(status, isCheckedIn);

    return Column(
      spacing: AppSizes.s6,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppSizes.s8,
              height: AppSizes.s8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCheckedIn ? AppColors.onlineGreen : AppColors.notificationRed,
              ),
            ),
            const SizedBox(width: AppSizes.s6),
            Text(
              isCheckedIn
                  ? 'status_checked_in'.tr()
                  : (status?.has_checked_in == true
                      ? 'status_checked_out'.tr()
                      : 'status_not_checked_in'.tr()),
              style: AppTextStyles.font12Medium.copyWith(
                color: isCheckedIn ? AppColors.statusPresentText : AppColors.lightTextSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            statusText,
            style: AppTextStyles.font12Medium.copyWith(color: AppColors.lightTextSecondary),
            textAlign: TextAlign.center,
          ),
        ),
        if (status != null && status.shift.name.isNotEmpty)
          Text(
            '${status.shift.name} • ${status.branch.name}',
            style: AppTextStyles.font11Regular.copyWith(color: AppColors.contractorGreyText),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }

  String _resolveStatusText(CheckInTodayStatusRes? status, bool isCheckedIn) {
    if (status == null) {
      return 'current_status_attendance_time'.tr();
    }

    if (isCheckedIn) {
      final String time = _formatTime(status.active_attendance.check_in_at);
      if (time.isNotEmpty) {
        return 'current_status_checked_in_at'.tr(args: [time]);
      }
      return 'current_status_attendance_time'.tr();
    }

    if (status.has_checked_in) {
      final String time = _formatTime(status.active_attendance.check_out_at);
      if (time.isNotEmpty) {
        return 'current_status_checked_out_at'.tr(args: [time]);
      }
      return 'status_checked_out'.tr();
    }

    return 'current_status_not_checked_in'.tr();
  }

  String _formatTime(String rawTime) {
    if (rawTime.isEmpty) return '';
    try {
      if (rawTime.contains('T') || rawTime.contains('-')) {
        final dt = DateTime.parse(rawTime);
        return DateFormat('hh:mm a').format(dt);
      }
      final parts = rawTime.split(':');
      if (parts.length >= 2) {
        final hour = int.tryParse(parts[0]) ?? 0;
        final minute = int.tryParse(parts[1]) ?? 0;
        final now = DateTime.now();
        final dt = DateTime(now.year, now.month, now.day, hour, minute);
        return DateFormat('hh:mm a').format(dt);
      }
    } catch (_) {}
    return rawTime;
  }

  Widget _buildToggleButton({
    required BuildContext context,
    required bool isCheckedIn,
    required bool isLoading,
  }) {
    final Color buttonColor = isCheckedIn ? AppColors.primaryActionRed : AppColors.onlineGreen;
    final String buttonLabel = isCheckedIn ? 'btn_check_out_gps'.tr() : 'btn_check_in_gps'.tr();
    final IconData buttonIcon = isCheckedIn ? Icons.logout_rounded : Icons.login_rounded;

    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () => _handleToggleAction(isCheckedIn: isCheckedIn),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: AppColors.roleSwitchSelectedBg,
        disabledBackgroundColor: buttonColor.withValues(alpha: 0.6),
        disabledForegroundColor: AppColors.roleSwitchSelectedBg,
        elevation: AppSizes.s2,
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r14)),
      ),
      child: isLoading
          ? const SizedBox(
              height: AppSizes.s20,
              width: AppSizes.s20,
              child: CircularProgressIndicator(
                strokeWidth: AppSizes.s2,
                color: AppColors.roleSwitchSelectedBg,
              ),
            )
          : Row(
              spacing: AppSizes.s8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonLabel,
                  style: AppTextStyles.font16Bold.copyWith(color: AppColors.roleSwitchSelectedBg),
                ),
                Icon(buttonIcon, color: AppColors.roleSwitchSelectedBg, size: AppSizes.s20),
              ],
            ),
    );
  }



  Widget _buildQuickLink({required IconData icon, required String labelKey}) {
    return Row(
      spacing: AppSizes.s6,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: context.theme.primaryColor, size: AppSizes.s16),
        Text(
          labelKey.tr(),
          style: AppTextStyles.font12Medium.copyWith(
            fontSize: 11,
            color: context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
