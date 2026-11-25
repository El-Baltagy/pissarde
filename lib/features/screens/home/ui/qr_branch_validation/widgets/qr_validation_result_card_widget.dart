import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/verify_branch_qr_code_res/verify_branch_qr_code_res.dart';

/// Displays the QR validation result card (valid / invalid + reason).
class QrValidationResultCardWidget extends StatelessWidget {
  const QrValidationResultCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, BaseEmit?>(
      selector: (state) =>
          state is HomeLoaded ? state.verifyBranchQrState : null,
      builder: (context, emit) {
        if (emit is! Success<VerifyBranchQrCodeRes>) {
          return const SizedBox.shrink();
        }
        final res = emit.data;
        if (res == null) return const SizedBox.shrink();

        final color = res.valid
            ? AppColors.contractorGreen
            : AppColors.primaryActionRed;

        return Container(
          padding: const EdgeInsets.all(AppPadding.p16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppSizes.r14),
            border: Border.all(color: color, width: AppSizes.s1),
          ),
          child: Row(
            spacing: AppSizes.s12,
            children: [
              Icon(
                res.valid ? Icons.check_circle_rounded : Icons.cancel_rounded,
                color: color,
                size: AppSizes.s28,
              ),
              Expanded(
                child: Text(
                  res.valid?'valid'.tr() : (res.reason??'invalid'.tr()),
                  style: AppTextStyles.font14SemiBold.copyWith(color: color),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
