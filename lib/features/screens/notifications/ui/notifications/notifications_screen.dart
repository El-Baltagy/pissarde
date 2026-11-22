import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/features/screens/notifications/controller/notifications_cubit.dart';
import 'package:newf/features/screens/notifications/ui/notifications/widgets/notifications_list_widget.dart';

part 'notifications_base_state.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget implements AutoRouteWrapper {
  const NotificationsPage({super.key, required this.args});
  final NotificationsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<NotificationsCubit>.value(value: args.notificationsCubit,
    child: this,
    );
  }

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends NotificationsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCubit, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsLoaded && state.getNotificationState is ErrorState) {
          final error = state.getNotificationState as ErrorState;
          context.showToast(error.failure.message, isSuccess: false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(
          title: 'notifications_title'.tr(),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.refresh_rounded,
                color: AppColors.roleSwitchSelectedBg,
              ),
              tooltip: 'notifications_retry'.tr(),
              onPressed: () => notificationsCubit.getNotificationFunc(Reload()),
            ),
          ],
        ),
        body: Semantics(
          label: 'Notifications screen list',
          child: SafeArea(
            child: BlocSelector<NotificationsCubit, NotificationsState, BaseEmit?>(
              selector: (state) =>
                  state is NotificationsLoaded ? state.getNotificationState : null,
              builder: (context, emit) {
                return NotificationsListWidget(
                  emit: emit,
                  onRefresh: () => notificationsCubit.getNotificationFunc(Reload()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
