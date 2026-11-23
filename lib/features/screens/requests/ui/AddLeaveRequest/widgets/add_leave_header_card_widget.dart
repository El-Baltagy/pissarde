import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class AddLeaveHeaderCardWidget extends StatelessWidget {
  const AddLeaveHeaderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Leave request header banner',
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r14),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Row(
          spacing: AppSizes.s12,
          children: [
            Container(
              width: AppSizes.s48,
              height: AppSizes.s48,
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
              child: Icon(
                Icons.time_to_leave_outlined,
                color: context.theme.primaryColor,
                size: AppSizes.s24,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s2,
                children: [
                  Text(
                    'new_leave_request'.tr(),
                    style: AppTextStyles.font14Bold,
                  ),
                  Text(
                    'leave_request_header_desc'.tr(),
                    style: AppTextStyles.font12Regular.copyWith(
                      color: AppColors.lightTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
