import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/methods/qr_token_validator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/rotate_branch_qr_code_res/rotate_branch_qr_code_res.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// Displays the rotated branch QR code image centered in a card.
class RotateQrDisplayWidget extends StatelessWidget {
  const RotateQrDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, BaseEmit?>(
      selector: (state) =>
          state is HomeLoaded ? state.rotateBranchQrState : null,
      builder: (context, emit) {
        if (emit is! Success<RotateBranchQrCodeRes>) {
          return const SizedBox.shrink();
        }
        final res = emit.data;
        if (res == null
        // ||
            // !qrTokenRegex.hasMatch(res.qr_data.qr_token.trim())
        ) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.all(AppPadding.p20),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppSizes.r14),
            border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppSizes.s12,
            children: [
              Text(
                res.qr_data.branch_name,
                style: AppTextStyles.font16Bold,
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.all(AppPadding.p16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                  border: Border.all(
                    color: AppColors.cardBorder,
                    width: AppSizes.s1,
                  ),
                ),
                child: QrImageView(
                  data: res.qr_data.qr_token,
                  version: QrVersions.auto,
                  size: 220,
                  backgroundColor: Colors.white,
                ),
              ),
              Text(
                '${'qr_code'.tr()} • ${res.qr_data.branch_code}',
                style: AppTextStyles.font12Medium.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
              Text(
                res.qr_data.qr_generated_at,
                style: AppTextStyles.font11Regular.copyWith(
                  color: AppColors.lightTextSecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
