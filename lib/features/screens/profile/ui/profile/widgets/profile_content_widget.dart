import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class ProfileContentWidget extends StatefulWidget {
  const ProfileContentWidget({super.key});

  @override
  State<ProfileContentWidget> createState() => _ProfileContentWidgetState();
}

class _ProfileContentWidgetState extends State<ProfileContentWidget> {
  static const _languages = [
    _LanguageOption(code: 'ar', nativeName: 'العربية', flag: '🇸🇦'),
    _LanguageOption(code: 'en', nativeName: 'English', flag: '🇬🇧'),
    _LanguageOption(code: 'tr', nativeName: 'Türkçe', flag: '🇹🇷'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProfileCard(),
          16.verticalSpace,
          _buildLanguageSelector(context),
          16.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppSizes.r14),
              border: Border.all(
                color: AppColors.cardBorder,
                width: AppSizes.s1,
              ),
            ),
            child: Column(
              children: [
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
              ],
            ),
          ) ,
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
      /// RTL-first: avatar (right) → text (left)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
          14.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }

  // ─────────────────────────── Language Selector ────────────────────────────

  Widget _buildLanguageSelector(BuildContext context) {
    final currentLocale = context.locale;
    final currentLang = _languages.firstWhere(
      (l) => l.code == currentLocale.languageCode,
      orElse: () => _languages.first,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p4,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.r14),
        border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

           /// RTL side: label + globe icon
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: AppColors.roleSwitchBg,
                  borderRadius: BorderRadius.circular(AppSizes.r10),
                ),
                child: Icon(
                  Icons.language_rounded,
                  color: AppColors.headerBackground,
                  size: AppSizes.s20,
                ),
              ),
              10.horizontalSpace,
              Text(
                'اللغة',
                style: AppTextStyles.font13Medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const Icon(
              //   Icons.language_rounded,
              //   color: AppColors.headerBackground,
              //   size: AppSizes.s20,
              // ),

            ],
          ),
          /// LTR side: dropdown
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentLang.code,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.headerBackground,
              ),
              style: AppTextStyles.font13Medium.copyWith(
                color: AppColors.lightTextPrimary,
              ),
              onChanged: (code) async {
                if (code == null) return;
                await context.setLocale(Locale(code));
              },
              items: _languages.map((lang) {
                return DropdownMenuItem<String>(
                  value: lang.code,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(lang.flag, style: const TextStyle(fontSize: 18)),
                      8.horizontalSpace,
                      Text(lang.nativeName),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────── Settings Group ──────────────────────────────


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
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          Spacer(),
          /// LTR side: arrow chevron
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: AppSizes.s14,
            color: AppColors.contractorGreyText,
          ),
          /// RTL side: icon box + text

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

// ─────────────────────────── Helper Model ─────────────────────────────────

class _LanguageOption {
  const _LanguageOption({
    required this.code,
    required this.nativeName,
    required this.flag,
  });
  final String code;
  final String nativeName;
  final String flag;
}
