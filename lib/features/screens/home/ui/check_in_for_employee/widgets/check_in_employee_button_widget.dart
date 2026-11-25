import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';

/// Check-in button that shows loading during location fetch or API submission.
class CheckInEmployeeButtonWidget extends StatelessWidget {
  const CheckInEmployeeButtonWidget({
    super.key,
    required this.isLocatingNotifier,
    required this.onCheckIn,
  });

  final ValueNotifier<bool> isLocatingNotifier;
  final void Function(bool isLoading) onCheckIn;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLocatingNotifier,
      builder: (context, isLocating, _) {
        return BlocSelector<HomeCubit, HomeState, bool>(
          selector: (state) =>
              state is HomeLoaded && state.checkInState is Loading,
          builder: (context, isSubmitting) {
            final isLoading = isLocating || isSubmitting;
            return SizedBox(
              width: double.infinity,
              height: AppSizes.s52,
              child: ElevatedButton(
                onPressed: isLoading ? null : () => onCheckIn(isLoading),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.onlineGreen,
                  disabledBackgroundColor:
                      AppColors.onlineGreen.withValues(alpha: 0.6),
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
                            Icons.qr_code_scanner_rounded,
                            size: AppSizes.s18,
                            color: AppColors.roleSwitchSelectedBg,
                          ),
                          Text(
                            'check_in'.tr(),
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
      },
    );
  }
}
