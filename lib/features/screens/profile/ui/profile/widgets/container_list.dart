import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:newf/core/shared/widgets/entrance_fader.dart';

import '../../../../../../core/extension/context.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/theming/app_values.dart';

class ContainerListWidget extends StatelessWidget {
  const ContainerListWidget({super.key, required this.items});
 final List<({IconData icon, String title, VoidCallback onTap})> items;
  @override
  Widget build(BuildContext context) {
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
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return EntranceFader(
            dx: context.locale.languageCode=='ar'?32:32,
            delay: Duration(milliseconds: 200*index),
            child: Column(
              children: [
                _buildSettingItem(
                  context,
                  icon: item.icon,
                  title: item.title,
                  onTap: item.onTap,
                ),
                if (index < items.length - 1)
                  const Divider(
                    height: AppSizes.s1,
                    thickness: AppSizes.s1,
                    color: AppColors.cardBorder,
                    indent: AppPadding.p16,
                    endIndent: AppPadding.p16,
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
  Widget _buildSettingItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.r14),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p14,
          vertical: AppPadding.p12,
        ),
        child: Row(
          spacing: AppSizes.s12,
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
              child: Icon(
                icon,
                color: context.theme.primaryColor,
                size: AppSizes.s20,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s2,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.font13Medium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: AppSizes.s14,
              color: AppColors.contractorGreyText,
            ),
          ],
        ),
      ),
    );
  }
}
