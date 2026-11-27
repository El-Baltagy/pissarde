import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/storage/storage_helper.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/main.dart';

import '../../../../../../core/app/route.dart';
import '../../../../home/ui/home/home_screen.dart';
import '../../../../login/controller/login_cubit.dart';
import '../../../../notifications/controller/notifications_cubit.dart';
import '../../../../notifications/ui/notifications/notifications_screen.dart';
import '../../../../profile/ui/profile/profile_screen.dart';
import '../../../../requests/ui/requests/requests_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap, required this.loginCubit, required this.notificationsCubit,
  });

  final int currentIndex;
  final LoginCubit loginCubit;
  final NotificationsCubit notificationsCubit;
  final ValueChanged<int> onTap;
  static List<BottomNavItem> listBottom (LoginCubit loginCubit,NotificationsCubit notificationsCubit)=> [
    BottomNavItem(
      'nav_home',
      Icons.home_rounded,
      const HomePage(
        args: HomeRouteArgs(),
      ).wrappedRoute(navigatorKey.currentContext!),
    ),
    BottomNavItem(
      'notificications',
      Icons.notifications,
        NotificationsPage(
        args: NotificationsRouteArgs(notificationsCubit),
      ).wrappedRoute(navigatorKey.currentContext!),
    ),
    if(!StorageHelper.isAdmin)
    BottomNavItem(
      'nav_requests',
      Icons.description_outlined,
      RequestsPage(
        args: RequestsRouteArgs() ,
      ).wrappedRoute(navigatorKey.currentContext!),
    ),
    BottomNavItem(
      'nav_my_account',
      Icons.person_outline_rounded,
      ProfilePage(
        args: ProfileRouteArgs(loginCubit),
      ).wrappedRoute(navigatorKey.currentContext!),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: AppSizes.s70,
      color: AppColors.bottomNavBg,
      elevation: AppSizes.s8,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          listBottom(loginCubit,notificationsCubit).length,
          (index) => _buildNavItem(
            index: index,
            icon: listBottom(loginCubit,notificationsCubit)[index].icon,
            labelKey: listBottom(loginCubit,notificationsCubit)[index].txt,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String labelKey,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected
        ? AppColors.bottomNavActive
        : AppColors.bottomNavInactive;
    final label = labelKey.tr();

    return Expanded(
      child: Semantics(
        label: label,
        button: true,
        selected: isSelected,
        child: InkWell(
          onTap: () => onTap(index),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.s4,
            children: [
              Icon(icon, color: color, size: AppSizes.s24),
              Text(
                label,
                style: isSelected
                    ? AppTextStyles.font14Bold.copyWith(color: color)
                    : AppTextStyles.font13Medium.copyWith(color: color),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavItem {
  final String txt;
  final IconData icon;
  final Widget widget;

  BottomNavItem(this.txt, this.icon, this.widget);
}
