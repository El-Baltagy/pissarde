import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/notifications/controller/notifications_cubit.dart';
import 'package:newf/features/screens/notifications/data/model/get_notifications_res/get_notifications_res.dart';
import 'package:newf/features/screens/notifications/data/model/pagination.dart';
import 'package:newf/features/screens/notifications/data/model/notifications_list_param.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notification_card_widget.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notification_detail_bottom_sheet.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notifications_empty_widget.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notifications_error_widget.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notifications_filter_chips_widget.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notifications_loading_widget.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notifications_summary_header_widget.dart';

class NotificationsListWidget extends StatefulWidget {
  const NotificationsListWidget({
    super.key,
    required this.emit,
    required this.onRefresh,
  });

  final BaseEmit? emit;
  final VoidCallback onRefresh;

  @override
  State<NotificationsListWidget> createState() => _NotificationsListWidgetState();
}

class _NotificationsListWidgetState extends State<NotificationsListWidget> {
  String _selectedFilter = 'all';
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    widget.onRefresh();
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    final cubit = NotificationsCubit.get(context: context);
    final emit = widget.emit;
    GetNotificationsRes? data;
    if (emit is Success<GetNotificationsRes>) {
      data = emit.data;
    } else if (emit is Loading<GetNotificationsRes>) {
      data = emit.item;
    }
    final pagination = data?.pagination;
    if (pagination == null) {
      _refreshController.loadComplete();
      return;
    }
    await cubit.getNotificationFunc(
      pagination.toGetPaginationInfo(data),
      parameter: NotificationsListParam(page: pagination.current_page),
    );
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final emit = widget.emit;

    if (emit == null) {
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullUp: false,
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: NotificationsLoadingWidget(),
        ),
      );
    }

    if (emit is Loading<GetNotificationsRes> && (emit as Loading<GetNotificationsRes>).item == null) {
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullUp: false,
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: NotificationsLoadingWidget(),
        ),
      );
    }

    if (emit is ErrorState) {
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullUp: false,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: NotificationsErrorWidget(
            message: emit.failure.message,
            onRetry: widget.onRefresh,
          ),
        ),
      );
    }

    GetNotificationsRes? data;
    if (emit is Success<GetNotificationsRes>) {
      data = emit.data;
    } else if (emit is Loading<GetNotificationsRes>) {
      data = emit.item;
    }

    if (data != null) {
      final List<NotificationItem> allItems = data.notifications.data;

      if (allItems.isEmpty) {
        return SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          enablePullUp: false,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: NotificationsEmptyWidget(onRefresh: widget.onRefresh),
          ),
        );
      }

      final filteredItems = _getFilteredItems(allItems);
      // final counts = _calculateCounts(allItems);
      // final int totalCount = data?.notifications.total ?? allItems.length;

      final pagination = data?.pagination;
      final enablePullUp = pagination != null && pagination.current_page < pagination.last_page;
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullUp: enablePullUp,
        footer: CustomFooter(
          height: 50,
          builder: (BuildContext context, LoadStatus? mode) {
            if (mode == LoadStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox.shrink();
          },
        ),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 12.verticalSpace,
                  // NotificationsSummaryHeaderWidget(total: totalCount),
                  // 12.verticalSpace,
                  // NotificationsFilterChipsWidget(
                  //   selectedFilter: _selectedFilter,
                  //   onFilterChanged: (filter) => setState(() => _selectedFilter = filter),
                  //   counts: counts,
                  // ),
                  12.verticalSpace,
                ],
              ),
            ),
            if (filteredItems.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: AppSizes.s8,
                      children: [
                        const Icon(
                          Icons.filter_list_off_rounded,
                          size: AppSizes.s48,
                          color: AppColors.contractorGreyText,
                        ),
                        Text(
                          'notifications_empty_title'.tr(),
                          style: AppTextStyles.font14Bold.copyWith(
                            color: AppColors.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p16,
                  right: AppPadding.p16,
                  bottom: AppPadding.p24,
                ),
                sliver: SliverList.separated(
                  itemCount: filteredItems.length,
                  separatorBuilder: (_, __) => 12.verticalSpace,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return NotificationCardWidget(
                      item: item,
                      onTap: () => NotificationDetailBottomSheet.show(context, item),
                    );
                  },
                ),
              ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  List<NotificationItem> _getFilteredItems(List<NotificationItem> items) {
    switch (_selectedFilter) {
      case 'leaves':
        return items.where((item) {
          final meta = item.data.data is Map ? item.data.data as Map : null;
          final type = (meta?['type'] ?? '').toString().toLowerCase();
          final title = item.data.title.toLowerCase();
          return type.contains('leave') || title.contains('إجازة') || title.contains('leave');
        }).toList();
      case 'attendance':
        return items.where((item) {
          final meta = item.data.data is Map ? item.data.data as Map : null;
          final type = (meta?['type'] ?? '').toString().toLowerCase();
          final title = item.data.title.toLowerCase();
          final body = item.data.body.toLowerCase();
          return type.contains('attendance') ||
              title.contains('حضور') ||
              title.contains('انصراف') ||
              body.contains('حضور') ||
              body.contains('attendance');
        }).toList();
      case 'reminders':
        return items.where((item) {
          final meta = item.data.data is Map ? item.data.data as Map : null;
          final type = (meta?['type'] ?? '').toString().toLowerCase();
          final title = item.data.title.toLowerCase();
          final body = item.data.body.toLowerCase();
          return type.contains('reminder') ||
              title.contains('تذكير') ||
              body.contains('تذكير');
        }).toList();
      default:
        return items;
    }
  }

  Map<String, int> _calculateCounts(List<NotificationItem> items) {
    int leavesCount = 0;
    int attendanceCount = 0;
    int remindersCount = 0;

    for (final item in items) {
      final meta = item.data.data is Map ? item.data.data as Map : null;
      final type = (meta?['type'] ?? '').toString().toLowerCase();
      final title = item.data.title.toLowerCase();
      final body = item.data.body.toLowerCase();

      if (type.contains('leave') || title.contains('إجازة') || title.contains('leave')) {
        leavesCount++;
      } else if (type.contains('reminder') || title.contains('تذكير') || body.contains('تذكير')) {
        remindersCount++;
      } else if (title.contains('حضور') || title.contains('انصراف') || body.contains('حضور')) {
        attendanceCount++;
      }
    }

    return {
      'all': items.length,
      'leaves': leavesCount,
      'attendance': attendanceCount,
      'reminders': remindersCount,
    };
  }
}
