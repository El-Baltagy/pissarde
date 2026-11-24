import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/methods/date_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';
import 'package:newf/features/screens/requests/data/model/cancel_leave_req_param.dart';
import 'package:newf/features/screens/requests/data/model/get_my_leaves_requests_res/get_my_leaves_requests_res.dart';
import 'package:newf/features/screens/requests/ui/requests/widgets/ship_icon.dart';

class LeaveRequestCardWidget extends StatelessWidget {
  const LeaveRequestCardWidget({
    super.key,
    required this.request,
    required this.requestsCubit,
  });

  final LeavesRequest request;
  final RequestsCubit requestsCubit;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Leave request card for ${request.leave_type.name}',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchBg,
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                  child: Icon(
                    Icons.event_note_outlined,
                    color: context.theme.primaryColor,
                    size: AppSizes.s20,
                  ),
                ),
                const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.leave_type.name,
                        style: AppTextStyles.font14Bold,
                      ),
                      const SizedBox(height: AppSizes.s2),
                      Text(
                        '${request.total_days} ${'total_days'.tr()}',
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.contractorGreyText,
                        ),
                      ),
                    ],
                  ),
                ),
                _statusBadge(),
              ],
            ),
            const SizedBox(height: AppSizes.s12),
            // Dates row
            Row(
              children: [
                InfoShip (Icons.calendar_today_outlined, DateTimeHelper.formatDateTimeFromString(
                  request.start_date,
                  DateFormat(
                    (DateTimeHelper.formatDateOnly ),
                  ),
                ),),
                const SizedBox(width: AppSizes.s8),
                const Icon(
                  Icons.arrow_forward,
                  size: AppSizes.s14,
                  color: AppColors.contractorGreyText,
                ),
                const SizedBox(width: AppSizes.s8),
                InfoShip (
                  Icons.calendar_today_outlined,
                  DateTimeHelper.formatDateTimeFromString(
                    request.end_date,
                    DateFormat(
                      (DateTimeHelper.formatDateOnly ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: AppSizes.s8),
            if (request.reason != null && request.reason!.isNotEmpty) ...[
              const SizedBox(height: AppSizes.s8),
              Text(
                request.reason!,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.contractorGreyText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            // Cancel button (only if pending)
            if (request.status == 'pending') ...[
              const SizedBox(height: AppSizes.s12),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: OutlinedButton.icon(
                  onPressed: () => _onCancel(context),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: AppSizes.s16,
                    color: AppColors.primaryActionRed,
                  ),
                  label: Text(
                    'cancel_request'.tr(),
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
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _statusBadge() {
    Color bg;
    Color text;
    switch (request.status.toLowerCase()) {
      case 'approved':
        bg = AppColors.tagApprovedBg;
        text = AppColors.tagApprovedText;
        break;
      case 'rejected':
        bg = AppColors.statusAbsentBg;
        text = AppColors.statusAbsentText;
        break;
      case 'cancelled':
        bg = const Color(0xFFF3F4F6);
        text = AppColors.contractorGreyText;
        break;
      default: // pending
        bg = AppColors.tagReviewBg;
        text = AppColors.tagReviewText;
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p4,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Text(
        request.status.tr(),
        style: AppTextStyles.font11Bold.copyWith(color: text),
      ),
    );
  }



  void _onCancel(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('confirm_cancel'.tr()),
        content: Text('confirm_cancel_message'.tr()),
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
              requestsCubit.cancelLeaveRequestFunc(
                Init(),
                parameter: CancelLeaveReqParam(id: request.id),
              );
            },
            child: Text(
              'confirm_cancel'.tr(),
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
