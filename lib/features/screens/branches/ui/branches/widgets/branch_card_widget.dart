import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/branches/controller/branches_cubit.dart';
import 'package:newf/features/screens/branches/data/model/branches/2-delete_branch_req_param.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';

/// Displays summary information for a single branch with edit and delete actions.
class BranchCardWidget extends StatelessWidget {
  const BranchCardWidget({
    super.key,
    required this.branch,
    required this.branchesCubit,
  });

  final DataItem branch;
  final BranchesCubit branchesCubit;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s10,
          children: [
            // ── Header row ──────────────────────────────────────────────
            Row(
              children: [
                Container(
                  width: AppSizes.s48,
                  height: AppSizes.s48,
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchBg,
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                  child: Icon(
                    Icons.location_city_outlined,
                    color: context.theme.primaryColor,
                    size: AppSizes.s24,
                  ),
                ),
                const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSizes.s2,
                    children: [
                      Text(branch.name, style: AppTextStyles.font14Bold),
                      Text(branch.code, style: AppTextStyles.font12Regular),
                    ],
                  ),
                ),
                // ── Active badge ─────────────────────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p8,
                    vertical: AppPadding.p4,
                  ),
                  decoration: BoxDecoration(
                    color: branch.is_active
                        ? AppColors.statusPresentBg
                        : AppColors.statusAbsentBg,
                    borderRadius: BorderRadius.circular(AppSizes.r8),
                  ),
                  child: Text(
                    branch.is_active ? 'active'.tr() : 'inactive'.tr(),
                    style: AppTextStyles.font11Bold.copyWith(
                      color: branch.is_active
                          ? AppColors.statusPresentText
                          : AppColors.statusAbsentText,
                    ),
                  ),
                ),
              ],
            ),
            // ── Address & stats ──────────────────────────────────────────
            Text(
              branch.address,
              style: AppTextStyles.font12Regular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              spacing: AppSizes.s16,
              children: [
                Row(
                  spacing: AppSizes.s4,
                  children: [
                    const Icon(
                      Icons.people_outline,
                      size: AppSizes.s14,
                      color: AppColors.contractorGreyText,
                    ),
                    Text(
                      '${branch.employees_count}',
                      style: AppTextStyles.font12Regular,
                    ),
                  ],
                ),
                Row(
                  spacing: AppSizes.s4,
                  children: [
                    const Icon(
                      Icons.radar_outlined,
                      size: AppSizes.s14,
                      color: AppColors.contractorGreyText,
                    ),
                    Text(
                      '${branch.geofence_radius_meters}m',
                      style: AppTextStyles.font12Regular,
                    ),
                  ],
                ),
              ],
            ),
            // ── Action buttons ───────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: AppSizes.s8,
              children: [
                // Edit button
                OutlinedButton.icon(
                  onPressed: () => _onEdit(context),
                  icon: Icon(
                    Icons.edit_outlined,
                    size: AppSizes.s16,
                    color: context.theme.primaryColor,
                  ),
                  label: Text(
                    'edit_branch'.tr(),
                    style: AppTextStyles.font12Regular.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                      vertical: AppPadding.p6,
                    ),
                    side: BorderSide(
                      color: context.theme.primaryColor,
                      width: AppSizes.s1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.r8),
                    ),
                  ),
                ),
                // Delete button
                OutlinedButton.icon(
                  onPressed: () => _onDelete(context),
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    size: AppSizes.s16,
                    color: AppColors.primaryActionRed,
                  ),
                  label: Text(
                    'delete_branch'.tr(),
                    style: AppTextStyles.font12Regular.copyWith(
                      color: AppColors.primaryActionRed,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                      vertical: AppPadding.p6,
                    ),
                    side: const BorderSide(
                      color: AppColors.primaryActionRed,
                      width: AppSizes.s1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.r8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onEdit(BuildContext context) async {
    final res = await context.push(
      AddEditBranchRoute(
        args: AddEditBranchRouteArgs(
          branchesCubit: branchesCubit,
          branchItem: branch,
        ),
      ),
    );
    if (res == true) {
      await branchesCubit.getListBranchesFunc(Reload());
    }
  }

  void _onDelete(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('delete_branch'.tr()),
        content: Text('are_you_sure_you_want_to_delete_this_branch'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              'cancel'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              branchesCubit.deleteBranchFunc(
                Init(),
                parameter: DeleteBranchReqParam(id: branch.id),
              );
            },
            child: Text(
              'delete_branch'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.primaryActionRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
