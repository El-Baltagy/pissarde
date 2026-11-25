import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';

/// Primary button that triggers the rotate branch QR request.
class RotateQrButtonWidget extends StatelessWidget {
  const RotateQrButtonWidget({
    super.key,
    required this.onRotate,
  });

  final void Function(bool isLoading) onRotate;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) =>
          state is HomeLoaded && state.rotateBranchQrState is Loading,
      builder: (context, isLoading) {
        return SizedBox(
          width: double.infinity,
          height: AppSizes.s52,
          child: ElevatedButton(
            onPressed: isLoading ? null : () => onRotate(isLoading),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.primaryColor,
              disabledBackgroundColor:
                  context.theme.primaryColor.withValues(alpha: 0.6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
            ),
            child: isLoading
                ? const SizedBox(
                    width: AppSizes.s24,
                    height: AppSizes.s24,
                    child: CircularProgressIndicator(
                      strokeWidth: AppSizes.s2,
                      color: AppColors.roleSwitchSelectedBg,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: AppSizes.s8,
                    children: [
                      const Icon(
                        Icons.refresh_rounded,
                        size: AppSizes.s18,
                        color: AppColors.roleSwitchSelectedBg,
                      ),
                      Text(
                        'rotate_qr'.tr(),
                        style: AppTextStyles.font16SemiBold.copyWith(
                          color: AppColors.roleSwitchSelectedBg,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
