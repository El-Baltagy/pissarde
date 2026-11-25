import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/methods/position_helper.dart';
import 'package:newf/core/shared/methods/qr_token_validator.dart';
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

  // ─── Permission + GPS gate ────────────────────────────────────────────────

  /// Returns [true] only when both location permission is granted AND the GPS
  /// service is active. Shows an appropriate dialog / toast otherwise.
  Future<bool> _ensureLocationReady() async {
    // 1. Check & request permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (!mounted) return false;

    if (permission == LocationPermission.deniedForever) {
      // User permanently denied – open app settings
      await _showPermissionDeniedDialog();
      return false;
    }

    if (permission == LocationPermission.denied) {
      context.showToast('location_permission_required'.tr(), isSuccess: false);
      return false;
    }

    // 2. Check GPS service
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!mounted) return false;

    if (!serviceEnabled) {
      await _showGpsDisabledDialog();
      return false;
    }

    return true;
  }

  /// Dialog shown when GPS service is OFF – offers to open Location Settings.
  Future<void> _showGpsDisabledDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
        title: Row(
          spacing: AppSizes.s8,
          children: [
            Icon(Icons.location_off_rounded, color: AppColors.notificationRed, size: AppSizes.s24),
            Text(
              'location_permission_required'.tr(),
              style: AppTextStyles.font16Bold,
            ),
          ],
        ),
        content: Text(
          'location_services_are_disabled_please_enable_gps_to_continue'.tr(),
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.lightTextSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'cancel'.tr(),
              style: AppTextStyles.font14Medium.copyWith(color: AppColors.lightTextSecondary),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await Geolocator.openLocationSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.primaryColor,
              foregroundColor: AppColors.roleSwitchSelectedBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
            ),
            icon: const Icon(Icons.settings_rounded, size: AppSizes.s18),
            label: Text(
              'enable_location'.tr(),
              style: AppTextStyles.font14SemiBold.copyWith(color: AppColors.roleSwitchSelectedBg),
            ),
          ),
        ],
      ),
    );
  }

  /// Dialog shown when permission is permanently denied – opens App Settings.
  Future<void> _showPermissionDeniedDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
        title: Row(
          spacing: AppSizes.s8,
          children: [
            Icon(Icons.location_disabled_rounded, color: AppColors.notificationRed, size: AppSizes.s24),
            Expanded(
              child: Text(
                'location_permission_required'.tr(),
                style: AppTextStyles.font16Bold,
              ),
            ),
          ],
        ),
        content: Text(
          'location_permission_denied_please_grant_location_access_from_app_settings'.tr(),
          style: AppTextStyles.font14Regular.copyWith(color: AppColors.lightTextSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'cancel'.tr(),
              style: AppTextStyles.font14Medium.copyWith(color: AppColors.lightTextSecondary),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await Geolocator.openAppSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.primaryColor,
              foregroundColor: AppColors.roleSwitchSelectedBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
            ),
            icon: const Icon(Icons.app_settings_alt_rounded, size: AppSizes.s18),
            label: Text(
              'grant_permission'.tr(),
              style: AppTextStyles.font14SemiBold.copyWith(color: AppColors.roleSwitchSelectedBg),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Main action ──────────────────────────────────────────────────────────

  Future<void> _handleToggleAction({required bool isCheckedIn}) async {
    setState(() => _isLocating = true);

    try {
      // 1. Gate: permission + GPS must be ready before anything else
      final bool ready = await _ensureLocationReady();
      if (!mounted || !ready) return;

      // 2. Fetch GPS coordinates (service is on + permission granted)
      final pos = await PositionHelper.instance.getLatLng();
      if (!mounted) return;

      if (pos == null) {
        context.showToast('location_unavailable'.tr(), isSuccess: false);
        return;
      }

      setState(() => _isLocating = false);

      // 3. Open QR scanner
      final scannedToken = await Navigator.of(context).push<String>(
        MaterialPageRoute(builder: (_) => const QrCameraScannerPage()),
      );

      if (!mounted || scannedToken == null || scannedToken.trim().isEmpty) return;

      if (!validateQrToken(context, scannedToken)) return;

      setState(() => _isLocating = true);

      // 4. Submit
      final cubit = context.read<HomeCubit>();
      final String latitude = pos.latitude.toString();
      final String longitude = pos.longitude.toString();
      final String qrToken = scannedToken.trim();

      if (isCheckedIn) {
        await cubit.checkOutFunc(
          Reload(),
          parameter: CheckOutReqParam(qr_token: qrToken, latitude: latitude, longitude: longitude),
        );
      } else {
        await cubit.checkInFunc(
          Reload(),
          parameter: CheckInReqParam(qr_token: qrToken, latitude: latitude, longitude: longitude),
        );
      }
    } finally {
      if (mounted) setState(() => _isLocating = false);
    }
  }

  // ─── Build ────────────────────────────────────────────────────────────────

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
      context.showToast(res?.message.isNotEmpty == true ? res!.message : 'check_in_successfully'.tr());
    } else if (state.checkInState is ErrorState) {
      final ErrorState error = state.checkInState as ErrorState;
      context.showToast(error.failure.message, isSuccess: false);
    }

    if (state.checkOutState is Success<ChechInRes>) {
      final ChechInRes? res = (state.checkOutState as Success<ChechInRes>).data;
      context.showToast(res?.message.isNotEmpty == true ? res!.message : 'check_out_successfully'.tr());
    } else if (state.checkOutState is ErrorState) {
      final ErrorState error = state.checkOutState as ErrorState;
      context.showToast(error.failure.message, isSuccess: false);
    }
  }

  // ─── Helpers ─────────────────────────────────────────────────────────────

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
      spacing: AppSizes.s4,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSizes.s6,
          children: [
            Container(
              width: AppSizes.s8,
              height: AppSizes.s8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCheckedIn ? AppColors.onlineGreen : AppColors.notificationRed,
              ),
            ),
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
    if (status == null) return 'current_status_attendance_time'.tr();

    // active_attendance is typed as `dynamic` (raw map from JSON), so access
    // it safely via map key lookup to avoid NoSuchMethodError.
    final Map<String, dynamic>? attendance =
        status.active_attendance is Map<String, dynamic>
            ? status.active_attendance as Map<String, dynamic>
            : null;

    if (isCheckedIn) {
      final String time = _formatTime(
        (attendance?['check_in_at'] as String?) ?? '',
      );
      if (time.isNotEmpty) return 'current_status_checked_in_at'.tr(args: [time]);
      return 'current_status_attendance_time'.tr();
    }

    if (status.has_checked_in) {
      final String time = _formatTime(
        (attendance?['check_out_at'] as String?) ?? '',
      );
      if (time.isNotEmpty) return 'current_status_checked_out_at'.tr(args: [time]);
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
      onPressed: isLoading ? null : () => _handleToggleAction(isCheckedIn: isCheckedIn),
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
}
