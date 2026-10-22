import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class GpsVerificationCardWidget extends StatelessWidget {
  const GpsVerificationCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(
          color: AppColors.cardBorder,
          width: AppSizes.s1,
        ),
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
        children: [
          _buildHeaderRow(),
          14.verticalSpace,
          _buildRadarDisplay(),
          14.verticalSpace,
          _buildDistanceFooter(),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p10,
            vertical: AppPadding.p4,
          ),
          decoration: BoxDecoration(
            color: AppColors.gpsTagBg,
            borderRadius: BorderRadius.circular(AppSizes.r20),
          ),
          child: Text(
            'gps_within_range'.tr(),
            style: AppTextStyles.font11Regular.copyWith(
              color: AppColors.gpsTagText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'gps_verification_title'.tr(),
                  style: AppTextStyles.font14Bold,
                ),
                2.verticalSpace,
                Text(
                  'gps_branch_location'.tr(),
                  style: AppTextStyles.font11Regular,
                ),
              ],
            ),
            10.horizontalSpace,
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: AppColors.gpsTagBg,
                borderRadius: BorderRadius.circular(AppSizes.r12),
              ),
              child: const Icon(
                Icons.location_on_rounded,
                color: AppColors.onlineGreen,
                size: AppSizes.s20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRadarDisplay() {
    return Container(
      height: AppSizes.s120,
      decoration: BoxDecoration(
        color: AppColors.gpsRadarBg,
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Radar concentric circle
          Container(
            width: AppSizes.s100,
            height: AppSizes.s100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.gpsRadarCircle.withValues(alpha: 0.5),
                width: AppSizes.s1_5,
              ),
            ),
          ),
          // Center branch building icon
          Container(
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration: const BoxDecoration(
              color: AppColors.headerBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.business_rounded,
              color: AppColors.roleSwitchSelectedBg,
              size: AppSizes.s20,
            ),
          ),
          // User position pin
          Positioned(
            right: AppSizes.s28,
            top: AppSizes.s24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p4),
                  decoration: const BoxDecoration(
                    color: AppColors.onlineGreen,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.roleSwitchSelectedBg,
                    size: AppSizes.s14,
                  ),
                ),
                4.verticalSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p6,
                    vertical: AppPadding.p2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchSelectedBg,
                    borderRadius: BorderRadius.circular(AppSizes.r8),
                  ),
                  child: Text(
                    'gps_you_distance'.tr(),
                    style: AppTextStyles.font10SemiBold.copyWith(
                      color: AppColors.lightTextPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // GPS accuracy badge at bottom right
          Positioned(
            bottom: AppSizes.s8,
            right: AppSizes.s12,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'gps_accuracy'.tr(),
                  style: AppTextStyles.font10Regular.copyWith(
                    color: AppColors.gpsRadarIndicator,
                  ),
                ),
                4.horizontalSpace,
                const Icon(
                  Icons.navigation_rounded,
                  color: AppColors.gpsRadarIndicator,
                  size: AppSizes.s12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDistanceFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'gps_current_distance'.tr(),
          style: AppTextStyles.font12SemiBold,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'gps_allowed_range'.tr(),
              style: AppTextStyles.font12Medium,
            ),
            6.horizontalSpace,
            const Icon(
              Icons.verified_user_outlined,
              color: AppColors.onlineGreen,
              size: AppSizes.s16,
            ),
          ],
        ),
      ],
    );
  }
}
