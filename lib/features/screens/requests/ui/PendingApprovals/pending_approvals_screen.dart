import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';
import 'package:newf/features/screens/requests/data/model/get_pending_approval_leaves_res/get_pending_approval_leaves_res.dart';
import 'package:newf/features/screens/requests/data/model/review_leave_request_req_param.dart';

part 'pending_approvals_base_state.dart';

@RoutePage()
class PendingApprovalsPage extends StatefulWidget implements AutoRouteWrapper {
  const PendingApprovalsPage({super.key, required this.args});
  final PendingApprovalsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.requestsCubit, child: this);
  }

  @override
  State<PendingApprovalsPage> createState() => _PendingApprovalsPageState();
}

class _PendingApprovalsPageState extends PendingApprovalsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestsCubit, RequestsState>(
      listener: _listener,
      child: Semantics(
        label: 'Pending Approvals Screen',
        child: Scaffold(
          backgroundColor: AppColors.lightSurface,
          appBar: CustomAppBar(title: 'pending_approvals'.tr()),
          body: BlocSelector<RequestsCubit, RequestsState, BaseEmit?>(
            selector: (state) =>
                state is RequestsLoaded ? state.getPendingApprovalLeavesState : null,
            builder: (context, emit) => _buildBody(context, emit),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, BaseEmit? emit) {
    if (emit == null || emit is Loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (emit is ErrorState) {
      final err = emit;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Text(
            err.failure.message,
            style: AppTextStyles.font14Regular.copyWith(
              color: AppColors.primaryActionRed,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    if (emit is Success) {
      final data = emit.data;
      if (data is GetPendingApprovalLeavesRes) {
        final list = data.data;
        if (list.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  size: 64,
                  color: AppColors.statusPresentText,
                ),
                const SizedBox(height: AppSizes.s12),
                Text(
                  'no_pending_approvals'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.contractorGreyText,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(AppPadding.p16),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSizes.s12),
          itemBuilder: (context, i) => _PendingApprovalCard(
            item: list[i],
            onApprove: () => _showReviewDialog(context, list[i], 'approved'),
            onReject: () => _showReviewDialog(context, list[i], 'rejected'),
          ),
        );
      }
    }
    return const SizedBox.shrink();
  }

  void _showReviewDialog(
    BuildContext context,
    PendingApprovalLeavesItem item,
    String status,
  ) {
    final notesCtrl = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          (status == 'approved' ? 'confirm_approve' : 'confirm_reject').tr(),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${item.user.name} - ${item.leave_type.name}',
              style: AppTextStyles.font14Bold,
            ),
            const SizedBox(height: AppSizes.s12),
            TextField(
              controller: notesCtrl,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'review_notes'.tr(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r10),
                ),
              ),
            ),
          ],
        ),
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
              requestsCubit.reviewLeaveRequestFunc(
                Init(),
                parameter: ReviewLeaveRequestReqParam(
                  id: item.id,
                  status: status,
                  review_notes: notesCtrl.text.trim(),
                ),
              );
            },
            child: Text(
              (status == 'approved' ? 'approve' : 'reject').tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: status == 'approved'
                    ? AppColors.tagApprovedText
                    : AppColors.primaryActionRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingApprovalCard extends StatelessWidget {
  const _PendingApprovalCard({
    required this.item,
    required this.onApprove,
    required this.onReject,
  });

  final PendingApprovalLeavesItem item;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Pending approval card for ${item.user.name}',
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
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: AppColors.roleSwitchBg,
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                  child: Icon(
                    Icons.person_outline,
                    color: context.theme.primaryColor,
                    size: AppSizes.s20,
                  ),
                ),
                const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.user.name, style: AppTextStyles.font14Bold),
                      const SizedBox(height: AppSizes.s2),
                      Text(
                        item.leave_type.name,
                        style: AppTextStyles.font12Regular.copyWith(
                          color: AppColors.contractorGreyText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s12),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: AppSizes.s12,
                  color: AppColors.contractorGreyText,
                ),
                const SizedBox(width: AppSizes.s4),
                Text(
                  '${item.start_date} → ${item.end_date}',
                  style: AppTextStyles.font12Regular,
                ),
                const SizedBox(width: AppSizes.s12),
                const Icon(
                  Icons.access_time_outlined,
                  size: AppSizes.s12,
                  color: AppColors.contractorGreyText,
                ),
                const SizedBox(width: AppSizes.s4),
                Text(
                  '${item.total_days} ${'total_days'.tr()}',
                  style: AppTextStyles.font12Regular,
                ),
              ],
            ),
            if (item.reason.isNotEmpty) ...[
              const SizedBox(height: AppSizes.s8),
              Text(
                item.reason,
                style: AppTextStyles.font12Regular.copyWith(
                  color: AppColors.contractorGreyText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: AppSizes.s12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: onReject,
                  icon: const Icon(
                    Icons.close,
                    size: AppSizes.s16,
                    color: AppColors.primaryActionRed,
                  ),
                  label: Text(
                    'reject'.tr(),
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
                const SizedBox(width: AppSizes.s8),
                OutlinedButton.icon(
                  onPressed: onApprove,
                  icon: const Icon(
                    Icons.check,
                    size: AppSizes.s16,
                    color: AppColors.tagApprovedText,
                  ),
                  label: Text(
                    'approve'.tr(),
                    style: AppTextStyles.font12Regular.copyWith(
                      color: AppColors.tagApprovedText,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                      vertical: AppPadding.p6,
                    ),
                    side: const BorderSide(
                      color: AppColors.tagApprovedText,
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
}
