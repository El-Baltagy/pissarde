import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/shifts/2-delete_shift_req_param.dart';
import 'package:newf/features/screens/profile/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';

import '../../../../../../core/shared/methods/date_helper.dart';

/// Displays summary information for a single shift with edit and delete actions.
class ShiftCardWidget extends StatelessWidget {
  const ShiftCardWidget({
    super.key,
    required this.shift,
    required this.profileCubit,
  });

  final ShiftItem shift;
  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Shift card for ${shift.name}',
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
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchBg,
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                  child: Icon(
                    Icons.access_time_outlined,
                    color: context.theme.primaryColor,
                    size: AppSizes.s20,
                  ),
                ),
                const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSizes.s2,
                    children: [
                      Text(shift.name, style: AppTextStyles.font14Bold),
                      Text(shift.code,
                          style: AppTextStyles.font12Regular),
                    ],
                  ),
                ),
                // ── Active badge ─────────────────────────────────────────
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                      vertical: AppPadding.p4),
                  decoration: BoxDecoration(
                    color: shift.is_active
                        ? AppColors.statusPresentBg
                        : AppColors.statusAbsentBg,
                    borderRadius: BorderRadius.circular(AppSizes.r8),
                  ),
                  child: Text(
                    shift.is_active ? 'active'.tr() : 'inactive'.tr(),
                    style: AppTextStyles.font11Bold.copyWith(
                      color: shift.is_active
                          ? AppColors.statusPresentText
                          : AppColors.statusAbsentText,
                    ),
                  ),
                ),
              ],
            ),
            // ── Working days ─────────────────────────────────────────────
            _buildWorkingDays(context),
            // ── Time chips ───────────────────────────────────────────────
            Row(
              spacing: AppSizes.s16,
              children: [
                _timeChip(Icons.login_rounded,
                    DateTimeHelper.toHourMinute(shift.start_time)),
                _timeChip(Icons.logout_rounded,
                    DateTimeHelper.toHourMinute(shift.end_time)),
                if (shift.employees_count != null)
                  _timeChip(Icons.people_outline,
                      '${shift.employees_count}'),
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
                    'edit_shift'.tr(),
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
                        width: AppSizes.s1),
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
                    'delete_shift'.tr(),
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
                        width: AppSizes.s1),
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

  // ── Handlers ───────────────────────────────────────────────────────────────

  Future<void> _onEdit(BuildContext context) async {
    final res = await context.push(
      AddEditShiftRoute(
        args: AddEditShiftRouteArgs(
          profileCubit: profileCubit,
          shiftItem: shift,
        ),
      ),
    );
    // Caller (shifts_screen) will refresh list when res == true
    // but we also trigger a local refresh if the navigation pops successfully
    if (res == true) {
      await profileCubit.getListShiftsFunc(Reload());
    }
  }

  void _onDelete(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('delete_shift'.tr()),
        content: Text('are_you_sure_you_want_to_delete_this_shift'.tr()),
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
              profileCubit.deleteShiftFunc(
                Init(),
                parameter: DeleteShiftReqParam(id: shift.id),
              );
            },
            child: Text(
              'delete_shift'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: AppColors.primaryActionRed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  Widget _buildWorkingDays(BuildContext context) {
    if (shift.working_days.isEmpty) return const SizedBox.shrink();

    final currentLocale = context.locale.languageCode;
    final sortedDays = List<int>.from(shift.working_days)..sort();

    return Wrap(
      spacing: AppSizes.s6,
      runSpacing: AppSizes.s4,
      children: sortedDays.map((day) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            vertical: AppPadding.p2,
          ),
          decoration: BoxDecoration(
            color: context.theme.primaryColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppSizes.r6),
            border: Border.all(
              color: context.theme.primaryColor.withValues(alpha: 0.25),
              width: AppSizes.s1,
            ),
          ),
          child: Text(
            DateTimeHelper.getWeekdayName(day, locale: currentLocale),
            style: AppTextStyles.font11Bold.copyWith(
              color: context.theme.primaryColor,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _timeChip(IconData icon, String text) {
    return Row(
      spacing: AppSizes.s4,
      children: [
        Icon(icon,
            size: AppSizes.s14, color: AppColors.contractorGreyText),
        Text(text, style: AppTextStyles.font12Regular),
      ],
    );
  }
}
