import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/data/model/get_leaves_balance_res/get_leaves_balance_res.dart';
import 'package:newf/features/screens/requests/ui/requests/widgets/leave_balance_card_widget.dart';

class LeaveBalanceListWidget extends StatelessWidget {
  const LeaveBalanceListWidget({super.key, required this.emit});
  final BaseEmit? emit;

  @override
  Widget build(BuildContext context) {
    if (emit == null || emit is Loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (emit is ErrorState) {
      final err = emit as ErrorState;
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
      final data = (emit as Success).data;
      if (data is GetLeavesBalanceRes) {
        final list = data.balances;
        if (list.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 64,
                  color: AppColors.contractorGreyText,
                ),
                const SizedBox(height: AppSizes.s12),
                Text(
                  'no_leave_balances'.tr(),
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
          itemBuilder: (context, index) => LeaveBalanceCardWidget(item: list[index]),
        );
      }
    }
    return const SizedBox.shrink();
  }
}
