import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';

class NotificationDetailBottomSheet extends StatelessWidget {
  const NotificationDetailBottomSheet({
    super.key,
    required this.item,
  });

  final NotificationItem item;

  static Future<void> show(BuildContext context, NotificationItem item) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (_) => NotificationDetailBottomSheet(item: item),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meta = item.data.data is Map ? item.data.data as Map : null;
    final String? status = meta?['status']?.toString();
    final dynamic leaveId = meta?['leave_id'];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.r24)),
      ),
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSizes.s16,
          children: [
            Center(
              child: Container(
                width: AppSizes.s40,
                height: AppSizes.s4,
                decoration: BoxDecoration(
                  color: AppColors.lightBorder,
                  borderRadius: BorderRadius.circular(AppSizes.r4),
                ),
              ),
            ),
            Row(
              spacing: AppSizes.s12,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p10),
                  decoration: BoxDecoration(
                    color: AppColors.policyCardBg,
                    borderRadius: BorderRadius.circular(AppSizes.r12),
                  ),
                  child: const Icon(
                    Icons.notifications_active_rounded,
                    color: AppColors.headerBackground,
                    size: AppSizes.s24,
                  ),
                ),
                Expanded(
                  child: Text(
                    item.data.title,
                    style: AppTextStyles.font16Bold.copyWith(
                      color: AppColors.lightTextPrimary,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(AppPadding.p14),
              decoration: BoxDecoration(
                color: AppColors.metricContainerBg,
                borderRadius: BorderRadius.circular(AppSizes.r12),
                border: Border.all(color: AppColors.metricBorder, width: AppSizes.s1),
              ),
              child: Text(
                item.data.body,
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.lightTextPrimary,
                  height: 1.5,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppPadding.p12),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppSizes.r12),
                border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
              ),
              child: Column(
                spacing: AppSizes.s8,
                children: [
                  _buildInfoRow(
                    label: 'created_at'.tr().isNotEmpty ? 'created_at'.tr() : 'التاريخ',
                    value: _formatFullDate(item.created_at),
                    icon: Icons.calendar_today_rounded,
                  ),
                  if (status != null && status.isNotEmpty)
                    _buildInfoRow(
                      label: 'status'.tr().isNotEmpty ? 'status'.tr() : 'الحالة',
                      value: status,
                      icon: Icons.info_outline_rounded,
                    ),
                  if (leaveId != null)
                    _buildInfoRow(
                      label: 'رقم الإجازة',
                      value: '#$leaveId',
                      icon: Icons.confirmation_number_outlined,
                    ),
                  _buildInfoRow(
                    label: 'معرّف الإشعار',
                    value: item.id,
                    icon: Icons.tag_rounded,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.headerBackground,
                foregroundColor: AppColors.roleSwitchSelectedBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                ),
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
              ),
              child: Text(
                'close'.tr().isNotEmpty ? 'close'.tr() : 'إغلاق',
                style: AppTextStyles.font14Bold.copyWith(
                  color: AppColors.roleSwitchSelectedBg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: AppSizes.s6,
          children: [
            Icon(icon, size: AppSizes.s16, color: AppColors.contractorGreyText),
            Text(
              label,
              style: AppTextStyles.font12Regular.copyWith(
                color: AppColors.contractorGreyText,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: AppTextStyles.font12Medium.copyWith(
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _formatFullDate(String rawDate) {
    if (rawDate.isEmpty) return '';
    try {
      final dt = DateTime.parse(rawDate).toLocal();
      return DateFormat('yyyy/MM/dd • hh:mm a').format(dt);
    } catch (_) {
      return rawDate;
    }
  }
}
