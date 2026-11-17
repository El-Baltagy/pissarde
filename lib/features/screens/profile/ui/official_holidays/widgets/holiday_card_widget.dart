import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/data/model/get_avilable_holidays_res/get_avilable_holidays_res.dart';

/// Displays summary information for a single holiday item.
class HolidayCardWidget extends StatelessWidget {
  const HolidayCardWidget({super.key, required this.holiday});

  final HolidayItem holiday;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Holiday card for ${holiday.name}',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s10,
          children: [
            // ── Header row ────────────────────────────────────────────
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchBg,
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                  child: const Icon(
                    Icons.beach_access_outlined,
                    color: AppColors.headerBackground,
                    size: AppSizes.s20,
                  ),
                ),
                const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSizes.s2,
                    children: [
                      Text(holiday.name, style: AppTextStyles.font14Bold),
                      if (holiday.description.isNotEmpty)
                        Text(
                          holiday.description,
                          style: AppTextStyles.font12Regular,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                // ── Recurring badge ──────────────────────────────────
                if (holiday.is_recurring)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p8, vertical: AppPadding.p4),
                    decoration: BoxDecoration(
                      color: AppColors.statusPresentBg,
                      borderRadius: BorderRadius.circular(AppSizes.r8),
                    ),
                    child: Text(
                      'recurring'.tr(),
                      style: AppTextStyles.font11Bold.copyWith(
                        color: AppColors.statusPresentText,
                      ),
                    ),
                  ),
              ],
            ),
            // ── Date row ──────────────────────────────────────────────
            Row(
              spacing: AppSizes.s16,
              children: [
                _infoChip(Icons.calendar_today_outlined, holiday.start_date),
                _infoChip(Icons.event_outlined, holiday.end_date),
              ],
            ),
            // ── Meta chips ────────────────────────────────────────────
            Wrap(
              spacing: AppSizes.s8,
              runSpacing: AppSizes.s6,
              children: [
                _tagChip(holiday.type),
                if (holiday.is_company_wide)
                  _tagChip('company_wide'.tr()),
                if (!holiday.is_company_wide && holiday.branch_name.isNotEmpty)
                  _tagChip(holiday.branch_name),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AppSizes.s4,
      children: [
        Icon(icon, size: AppSizes.s14, color: AppColors.contractorGreyText),
        Text(text, style: AppTextStyles.font12Regular),
      ],
    );
  }

  Widget _tagChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8, vertical: AppPadding.p4),
      decoration: BoxDecoration(
        color: AppColors.roleSwitchBg,
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Text(label, style: AppTextStyles.font11Bold.copyWith(
        color: AppColors.headerBackground,
      )),
    );
  }
}
