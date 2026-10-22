import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/manager_dashboard/controller/manager_dashboard_cubit.dart';
import 'package:newf/features/screens/manager_dashboard/ui/manager_dashboard/widgets/manager_dashboard_content_widget.dart';

part 'manager_dashboard_base_state.dart';

@RoutePage()
class ManagerDashboardPage extends StatefulWidget implements AutoRouteWrapper {
  const ManagerDashboardPage({super.key, required this.args});
  final ManagerDashboardRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ManagerDashboardCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<ManagerDashboardPage> createState() => _ManagerDashboardPageState();
}

class _ManagerDashboardPageState extends ManagerDashboardPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ManagerDashboardCubit, ManagerDashboardState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          title: Text(
            'nav_manager_dashboard'.tr(),
            style: AppTextStyles.font18Bold.copyWith(
              color: AppColors.roleSwitchSelectedBg,
            ),
          ),
          backgroundColor: AppColors.headerBackground,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Semantics(
                label: 'Manager Dashboard and Statistics Overview',
                child: const ManagerDashboardContentWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
