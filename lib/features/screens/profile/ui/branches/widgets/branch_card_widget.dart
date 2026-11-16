import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/data/model/branches/get_branches_list/branches_list.dart';

/// Displays summary information for a single branch.
class BranchCardWidget extends StatelessWidget {
  const BranchCardWidget({super.key, required this.branch});

  final DataItem branch;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Branch card for ${branch.name}',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border:
              Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Row(
          spacing: AppSizes.s12,
          children: [
            Container(
              width: AppSizes.s48,
              height: AppSizes.s48,
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
              child: const Icon(
                Icons.location_city_outlined,
                color: AppColors.headerBackground,
                size: AppSizes.s24,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s4,
                children: [
                  Text(branch.name, style: AppTextStyles.font14Bold),
                  Text(branch.code, style: AppTextStyles.font12Regular),
                  Text(
                    branch.address,
                    style: AppTextStyles.font12Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: AppSizes.s4,
                    children: [
                      const Icon(Icons.people_outline,
                          size: AppSizes.s12,
                          color: AppColors.contractorGreyText),
                      Text('${branch.employees_count}',
                          style: AppTextStyles.font11Regular),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8, vertical: AppPadding.p4),
              decoration: BoxDecoration(
                color: branch.is_active
                    ? AppColors.statusPresentBg
                    : AppColors.statusAbsentBg,
                borderRadius: BorderRadius.circular(AppSizes.r8),
              ),
              child: Text(
                branch.is_active ? 'active' : 'inactive',
                style: AppTextStyles.font11Bold.copyWith(
                  color: branch.is_active
                      ? AppColors.statusPresentText
                      : AppColors.statusAbsentText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
