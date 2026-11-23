import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';

class AddLeaveSubmitButtonWidget extends StatelessWidget {
  const AddLeaveSubmitButtonWidget({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RequestsCubit, RequestsState, bool>(
      selector: (state) =>
          state is RequestsLoaded && state.createLeaveRequestState is Loading,
      builder: (context, isLoading) {
        return SizedBox(
          width: double.infinity,
          height: AppSizes.s52,
          child: ElevatedButton(
            onPressed: isLoading ? null : onSubmit,
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
                        Icons.send_rounded,
                        size: AppSizes.s18,
                        color: AppColors.roleSwitchSelectedBg,
                      ),
                      Text(
                        'send'.tr(),
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
