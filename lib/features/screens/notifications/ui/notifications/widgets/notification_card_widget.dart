import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.item,
    this.onTap,
  });

  final NotificationItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final typeConfig = _getTypeConfig(item);
    final meta = item.data.data is Map ? item.data.data as Map : null;
    final String? status = meta?['status']?.toString();
    final dynamic leaveId = meta?['leave_id'];
    final String formattedTime = _formatDate(item.created_at);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.r16),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.r16),
          border: Border.all(color: AppColors.cardBorder, width: AppSizes.s1),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightBorder.withValues(alpha: 0.3),
              blurRadius: AppSizes.s8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.s12,
          children: [
            Container(
              width: AppSizes.s48,
              height: AppSizes.s48,
              decoration: BoxDecoration(
                color: typeConfig.bgColor,
                borderRadius: BorderRadius.circular(AppSizes.r14),
              ),
              child: Icon(
                typeConfig.icon,
                color: typeConfig.iconColor,
                size: AppSizes.s24,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.s6,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.data.title,
                          style: AppTextStyles.font14Bold.copyWith(
                            color: AppColors.lightTextPrimary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (formattedTime.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p8,
                            vertical: AppPadding.p2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.roleSwitchBg,
                            borderRadius: BorderRadius.circular(AppSizes.r8),
                          ),
                          child: Text(
                            formattedTime,
                            style: AppTextStyles.font10Regular.copyWith(
                              color: AppColors.lightTextSecondary,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    item.data.body,
                    style: AppTextStyles.font12Regular.copyWith(
                      color: AppColors.lightTextSecondary,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Wrap(
                    spacing: AppSizes.s6,
                    runSpacing: AppSizes.s4,
                    children: [
                      _buildChip(
                        label: typeConfig.typeKey.tr(),
                        bgColor: typeConfig.bgColor,
                        textColor: typeConfig.iconColor,
                      ),
                      if (status != null && status.isNotEmpty)
                        _buildStatusChip(status),
                      if (leaveId != null)
                        _buildChip(
                          label: '#$leaveId',
                          bgColor: AppColors.roleSwitchBg,
                          textColor: AppColors.lightTextPrimary,
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

  Widget _buildChip({
    required String label,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p2,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppSizes.r6),
      ),
      child: Text(
        label,
        style: AppTextStyles.font10SemiBold.copyWith(color: textColor),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color bg = AppColors.roleSwitchBg;
    Color text = AppColors.lightTextSecondary;
    String label = status;

    switch (status.toLowerCase()) {
      case 'approved':
        bg = AppColors.statusPresentBg;
        text = AppColors.statusPresentText;
        label = 'status_approved'.tr();
        break;
      case 'pending':
        bg = AppColors.statusLateBg;
        text = AppColors.statusLateText;
        label = 'status_under_review'.tr();
        break;
      case 'rejected':
      case 'cancelled':
        bg = AppColors.statusAbsentBg;
        text = AppColors.statusAbsentText;
        label = status;
        break;
    }

    return _buildChip(label: label, bgColor: bg, textColor: text);
  }

  String _formatDate(String rawDate) {
    if (rawDate.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(rawDate).toLocal();
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inMinutes < 60) {
        return '${difference.inMinutes}m';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}h';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d';
      } else {
        return DateFormat('yyyy/MM/dd').format(dateTime);
      }
    } catch (_) {
      return rawDate;
    }
  }

  _NotificationTypeConfig _getTypeConfig(NotificationItem item) {
    final meta = item.data.data is Map ? item.data.data as Map : null;
    final String type = (meta?['type'] ?? '').toString().toLowerCase();
    final String title = item.data.title.toLowerCase();

    if (type.contains('leave') || title.contains('إجازة') || title.contains('leave')) {
      final String status = (meta?['status'] ?? '').toString().toLowerCase();
      if (status == 'approved' || title.contains('موافقة')) {
        return const _NotificationTypeConfig(
          icon: Icons.check_circle_outline_rounded,
          bgColor: AppColors.statusPresentBg,
          iconColor: AppColors.statusPresentText,
          typeKey: 'notification_type_leave_review',
        );
      }
      return const _NotificationTypeConfig(
        icon: Icons.beach_access_rounded,
        bgColor: AppColors.statusLateBg,
        iconColor: AppColors.statusLateText,
        typeKey: 'notification_type_leave_request',
      );
    }

    if (type.contains('reminder') || title.contains('تذكير') || title.contains('reminder')) {
      return const _NotificationTypeConfig(
        icon: Icons.alarm_rounded,
        bgColor: AppColors.policyCardBg,
        iconColor: AppColors.headerBackground,
        typeKey: 'notification_type_reminder',
      );
    }

    if (title.contains('حضور') || title.contains('attendance') || title.contains('انصراف')) {
      return const _NotificationTypeConfig(
        icon: Icons.fingerprint_rounded,
        bgColor: AppColors.commitmentBadgeBg,
        iconColor: AppColors.commitmentBadgeText,
        typeKey: 'notifications_filter_attendance',
      );
    }

    return const _NotificationTypeConfig(
      icon: Icons.notifications_rounded,
      bgColor: AppColors.policyCardBg,
      iconColor: AppColors.headerBackground,
      typeKey: 'notification_type_general',
    );
  }
}

class _NotificationTypeConfig {
  const _NotificationTypeConfig({
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.typeKey,
  });

  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String typeKey;
}
