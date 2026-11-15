import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/login/controller/login_cubit.dart';
import 'package:newf/features/screens/login/controller/login_state.dart';

import '../../../../../../core/base/base_state.dart';
part 'list_options.dart';
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
      padding: const EdgeInsets.all(AppPadding.p16).copyWith(bottom: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSizes.s16,
        children: [
          _buildProfileCard(),
          _buildLanguageSelector(context),
          ListOptionsWidget(),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LogoutState && state.baseEmit is Success) {
                context.router.replaceAll([const LoginRoute()]);
              }
            },
            builder: (context, state) {
              final isLoading = state is LogoutState && state.baseEmit is Loading;
              if (isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return _buildLogoutButton(() => LoginCubit.get(context: context).logoutFunc());
            },
          ),
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
        spacing: AppSizes.s14,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.s4,
            children: [
              Text(
                'user_name'.tr(),
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
              Text(
                'job_title'.tr(),
                style: AppTextStyles.font12Medium.copyWith(
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
            spacing: AppSizes.s10,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: AppColors.roleSwitchBg,
                  borderRadius: BorderRadius.circular(AppSizes.r10),
                ),
                child: const Icon(
                  Icons.language_rounded,
                  color: AppColors.headerBackground,
                  size: AppSizes.s20,
                ),
              ),
              Text(
                'language'.tr(),
                style: AppTextStyles.font13Medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                    spacing: AppSizes.s8,
                    children: [
                      Text(lang.flag, style: const TextStyle(fontSize: 18)),
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



  Widget _buildLogoutButton(void Function()? logout) {
    return OutlinedButton.icon(
      onPressed: logout,
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
        'logout'.tr(),
        style: AppTextStyles.font14Bold.copyWith(
          color: AppColors.notificationRed,
        ),
      ),
    );
  }
}

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


