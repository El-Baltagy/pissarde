import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/data/model/branches/get_branches_list/branches_list.dart';

import 'branch_card_widget.dart';

/// Renders the branches list, handling loading / error / empty / success states.
class BranchesListWidget extends StatelessWidget {
  const BranchesListWidget({super.key, required this.emit});

  final BaseEmit? emit;

  @override
  Widget build(BuildContext context) {
    if (emit == null || emit is Loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (emit is ErrorState) {
      final e = emit as ErrorState;
      return Center(
        child: Text(
          e.failure.message,
          style: AppTextStyles.font14Regular
              .copyWith(color: AppColors.primaryActionRed),
          textAlign: TextAlign.center,
        ),
      );
    }
    if (emit is Success<BranchesList>) {
      final items = (emit as Success<BranchesList>).data?.data ?? [];
      if (items.isEmpty) {
        return Center(
            child: Text('no_branches'.tr(),
                style: AppTextStyles.font14Regular));
      }
      return ListView.separated(
        padding: const EdgeInsets.all(AppPadding.p16),
        itemCount: items.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.s12),
        itemBuilder: (_, i) => BranchCardWidget(branch: items[i]),
      );
    }
    return const SizedBox.shrink();
  }
}
