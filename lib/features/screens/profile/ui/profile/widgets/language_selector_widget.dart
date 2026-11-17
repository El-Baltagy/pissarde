

part of '../profile_screen.dart';

/// Extracted mini widget: [LanguageSelectorWidget]
class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<_LanguageOption> languages = [
      _LanguageOption(code: 'ar', nativeName: 'العربية', flag: '🇸🇦'),
      _LanguageOption(code: 'en', nativeName: 'English', flag: '🇬🇧'),
      _LanguageOption(code: 'tr', nativeName: 'Türkçe', flag: '🇹🇷'),
    ];
    return _buildLanguageSelector(context,languages);
  }
  // ─────────────────────────── Language Selector ────────────────────────────


  Widget _buildLanguageSelector(BuildContext context, List<_LanguageOption> languages) {
    final currentLocale = context.locale;
    final currentLang = languages.firstWhere(
          (l) => l.code == currentLocale.languageCode,
      orElse: () => languages.first,
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
                child:   Icon(
                  Icons.language_rounded,
                  color: context.theme.primaryColor,
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
              icon:   Icon(
                Icons.keyboard_arrow_down_rounded,
                color: context.theme.primaryColor,
              ),
              style: AppTextStyles.font13Medium.copyWith(
                color: AppColors.lightTextPrimary,
              ),
              onChanged: (code) async {
                if (code == null) return;
                await context.setLocale(Locale(code));
              },
              items: languages.map((lang) {
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
