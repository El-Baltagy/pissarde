import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/data/model/history_attendacne_res/history_attendacne_res.dart';
import 'package:newf/features/screens/home/ui/attendance_history/widgets/attendance_history_card_widget.dart';

/// Displays loading, error, empty, or paginated attendance history list.
class AttendanceHistoryListWidget extends StatelessWidget {
  const AttendanceHistoryListWidget({
    super.key,
    required this.emit,
    required this.onRefresh,
  });

  final BaseEmit? emit;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (emit == null || emit is Loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (emit is ErrorState) {
      final err = emit as ErrorState;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.s12,
            children: [
              Text(
                err.failure.message,
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.primaryActionRed,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                onPressed: onRefresh,
                icon: const Icon(Icons.refresh_rounded, size: AppSizes.s18),
                label: Text('retry'.tr()),
              ),
            ],
          ),
        ),
      );
    }
    if (emit is Success && (emit as Success).data is HistoryAttendacneRes) {
      final list = ((emit as Success).data as HistoryAttendacneRes).data;
      if (list.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.s12,
            children: [
              const Icon(
                Icons.history_toggle_off_outlined,
                size: 64,
                color: AppColors.contractorGreyText,
              ),
              Text(
                'no_attendance_history'.tr(),
                style: AppTextStyles.font14Regular.copyWith(
                  color: AppColors.contractorGreyText,
                ),
              ),
            ],
          ),
        );
      }
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.separated(
          padding: const EdgeInsets.all(AppPadding.p16),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSizes.s12),
          itemBuilder: (context, index) =>
              AttendanceHistoryCardWidget(item: list[index]),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
