import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class AttendanceActionSectionWidget extends StatelessWidget {
  const AttendanceActionSectionWidget({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSizes.s12,
        children: [
          Center(
            child: Text(
              'current_status_attendance_time'.tr(),
              style: AppTextStyles.font12Medium.copyWith(color: AppColors.lightTextSecondary),
            ),
          ),
          _buildCheckOutButton(),
          _buildQuickActionLinks(),
        ],
      ),
    );
  }

  Widget _buildCheckOutButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryActionRed,
        foregroundColor: AppColors.roleSwitchSelectedBg,
        elevation: AppSizes.s2,
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r14)),
      ),
      /// RTL-first: text → icon
      child: Row(
        spacing: AppSizes.s8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'btn_check_out_gps'.tr(),
            style: AppTextStyles.font16Bold.copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
          const Icon(Icons.logout_rounded, color: AppColors.roleSwitchSelectedBg, size: AppSizes.s20),
        ],
      ),
    );
  }

  Widget _buildQuickActionLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuickLink(icon: Icons.description_outlined, labelKey: 'btn_request_correction'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: Text('•', style: AppTextStyles.font14Regular.copyWith(color: AppColors.lightBorder)),
        ),
        _buildQuickLink(icon: Icons.access_time_rounded, labelKey: 'btn_request_permission'),
      ],
    );
  }

  Widget _buildQuickLink({required IconData icon, required String labelKey}) {
    return InkWell(
      onTap: () {},
      child: Row(
        spacing: AppSizes.s6,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.headerBackground, size: AppSizes.s16),
          Text(labelKey.tr(), style: AppTextStyles.font12Medium.copyWith(color: AppColors.headerBackground)),
        ],
      ),
    );
  }
}
