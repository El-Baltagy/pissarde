import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class AttendanceHeaderWidget extends StatelessWidget {
  const AttendanceHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.headerBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.r24),
          bottomRight: Radius.circular(AppSizes.r24),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppPadding.p16,
            AppPadding.p12,
            AppPadding.p16,
            AppPadding.p16,
          ),
          child: Column(
            spacing: AppSizes.s16,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildUserInfoRow(),
              _buildDateTimeRow(),
            ],
          ),
        ),
      ),
    );
  }

  /// RTL-first: avatar → user details → spacer → notification
  Widget _buildUserInfoRow() {
    return Row(
      spacing: AppSizes.s12,
      children: [
        _buildAvatar(),
        _buildUserDetails(),
        const Spacer(),
        _buildNotificationButton(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: AppSizes.s48,
          height: AppSizes.s48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.headerBadgeBg,
            border: Border.all(
              color: AppColors.roleSwitchSelectedBg,
              width: AppSizes.s2,
            ),
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.roleSwitchSelectedBg,
            size: AppSizes.s32,
          ),
        ),
        PositionedDirectional(
          bottom: AppSizes.s0,
          end: AppSizes.s0,
          child: Container(
            width: AppSizes.s12,
            height: AppSizes.s12,
            decoration: BoxDecoration(
              color: AppColors.onlineGreen,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.headerBackground,
                width: AppSizes.s2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: AppSizes.s4,
      children: [
        /// RTL-first: name → job badge
        Row(
          spacing: AppSizes.s8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'user_name'.tr(),
              style: AppTextStyles.font16Bold.copyWith(
                color: AppColors.roleSwitchSelectedBg,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8,
                vertical: AppPadding.p2,
              ),
              decoration: BoxDecoration(
                color: AppColors.headerBadgeBg,
                borderRadius: BorderRadius.circular(AppSizes.r12),
              ),
              child: Text(
                'job_title'.tr(),
                style: AppTextStyles.font10SemiBold.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
            ),
          ],
        ),
        /// RTL-first: branch text → building icon
        Row(
          spacing: AppSizes.s4,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'user_branch_dept'.tr(),
              style: AppTextStyles.font11Regular.copyWith(
                color: AppColors.darkTextSecondary,
              ),
            ),
            const Icon(
              Icons.business_rounded,
              color: AppColors.darkTextSecondary,
              size: AppSizes.s14,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: AppSizes.s40,
          height: AppSizes.s40,
          decoration: BoxDecoration(
            color: AppColors.headerBadgeBg,
            borderRadius: BorderRadius.circular(AppSizes.r12),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.roleSwitchSelectedBg,
            size: AppSizes.s20,
          ),
        ),
        PositionedDirectional(
          top: -AppSizes.s4,
          end: -AppSizes.s4,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p4),
            decoration: const BoxDecoration(
              color: AppColors.notificationRed,
              shape: BoxShape.circle,
            ),
            child: Text(
              '3',
              style: AppTextStyles.font10SemiBold.copyWith(
                color: AppColors.roleSwitchSelectedBg,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimeRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
        color: AppColors.headerTimeDateBg,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: AppSizes.s6,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.roleSwitchSelectedBg,
                size: AppSizes.s16,
              ),
              Text(
                'current_date'.tr(),
                style: AppTextStyles.font12Medium.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
            ],
          ),
          Row(
            spacing: AppSizes.s6,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'current_time'.tr(),
                style: AppTextStyles.font12Medium.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
              const Icon(
                Icons.access_time_rounded,
                color: AppColors.roleSwitchSelectedBg,
                size: AppSizes.s16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
