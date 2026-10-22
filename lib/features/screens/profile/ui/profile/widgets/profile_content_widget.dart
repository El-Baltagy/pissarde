import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProfileCard(),
          16.verticalSpace,
          _buildSettingsGroup([
            _buildSettingItem(
              icon: Icons.badge_outlined,
              title: 'البيانات الوظيفية',
              subtitle: 'الرقم الوظيفي: EMP-2024-88',
            ),
            _buildSettingItem(
              icon: Icons.schedule_outlined,
              title: 'جدول الورديات وساعات العمل',
              subtitle: 'الشيفت الصباحي الرسمي (08:00 - 16:00)',
            ),
            _buildSettingItem(
              icon: Icons.fingerprint_rounded,
              title: 'إعدادات البصمة والتحقق الجغرافي',
              subtitle: 'مفعّلة عبر GPS والتطبيق',
            ),
            _buildSettingItem(
              icon: Icons.notifications_none_rounded,
              title: 'إشعارات التذكير بالحضور',
              subtitle: 'تنبيه قبل بدء الشيفت بـ 15 دقيقة',
            ),
          ]),
          16.verticalSpace,
          _buildLogoutButton(),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.headerBackground,
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'user_name'.tr(),
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
              4.verticalSpace,
              Text(
                'job_title'.tr(),
                style: AppTextStyles.font12Medium.copyWith(
                  color: AppColors.darkTextSecondary,
                ),
              ),
              2.verticalSpace,
              Text(
                'user_branch_dept'.tr(),
                style: AppTextStyles.font11Regular.copyWith(
                  color: AppColors.darkTextSecondary,
                ),
              ),
            ],
          ),
          14.horizontalSpace,
          Container(
            width: AppSizes.s56,
            height: AppSizes.s56,
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
        ],
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(
          color: AppColors.cardBorder,
          width: AppSizes.s1,
        ),
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: AppSizes.s14,
            color: AppColors.contractorGreyText,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.font13Medium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    subtitle,
                    style: AppTextStyles.font11Regular,
                  ),
                ],
              ),
              12.horizontalSpace,
              Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: AppColors.roleSwitchBg,
                  borderRadius: BorderRadius.circular(AppSizes.r10),
                ),
                child: Icon(
                  icon,
                  color: AppColors.headerBackground,
                  size: AppSizes.s20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.notificationRed,
        side: const BorderSide(color: AppColors.notificationRed),
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
      ),
      icon: const Icon(Icons.logout_rounded, size: AppSizes.s18),
      label: Text(
        'تسجيل الخروج',
        style: AppTextStyles.font14Bold.copyWith(
          color: AppColors.notificationRed,
        ),
      ),
    );
  }
}
