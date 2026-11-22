import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_values.dart';

class NotificationsLoadingWidget extends StatelessWidget {
  const NotificationsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(AppPadding.p16),
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.s12),
      itemBuilder: (_, __) => Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r16),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s12,
          children: [
            Container(
              width: AppSizes.s48,
              height: AppSizes.s48,
              decoration: BoxDecoration(
                color: AppColors.roleSwitchBg,
                borderRadius: BorderRadius.circular(AppSizes.r14),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s8,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AppSizes.s140,
                        height: AppSizes.s14,
                        decoration: BoxDecoration(
                          color: AppColors.roleSwitchBg,
                          borderRadius: BorderRadius.circular(AppSizes.r4),
                        ),
                      ),
                      Container(
                        width: AppSizes.s40,
                        height: AppSizes.s12,
                        decoration: BoxDecoration(
                          color: AppColors.roleSwitchBg,
                          borderRadius: BorderRadius.circular(AppSizes.r4),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: AppSizes.s12,
                    decoration: BoxDecoration(
                      color: AppColors.roleSwitchBg,
                      borderRadius: BorderRadius.circular(AppSizes.r4),
                    ),
                  ),
                  Container(
                    width: AppSizes.s200,
                    height: AppSizes.s12,
                    decoration: BoxDecoration(
                      color: AppColors.roleSwitchBg,
                      borderRadius: BorderRadius.circular(AppSizes.r4),
                    ),
                  ),
                  Row(
                    spacing: AppSizes.s6,
                    children: [
                      Container(
                        width: AppSizes.s60,
                        height: AppSizes.s18,
                        decoration: BoxDecoration(
                          color: AppColors.roleSwitchBg,
                          borderRadius: BorderRadius.circular(AppSizes.r6),
                        ),
                      ),
                      Container(
                        width: AppSizes.s50,
                        height: AppSizes.s18,
                        decoration: BoxDecoration(
                          color: AppColors.roleSwitchBg,
                          borderRadius: BorderRadius.circular(AppSizes.r6),
                        ),
                      ),
                    ],
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
