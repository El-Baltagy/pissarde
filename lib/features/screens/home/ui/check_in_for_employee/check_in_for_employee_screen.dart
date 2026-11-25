import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';

part 'check_in_for_employee_base_state.dart';

@RoutePage()
class CheckInForEmployeePage extends StatefulWidget
    implements AutoRouteWrapper {
  const CheckInForEmployeePage({super.key, required this.args});
  final CheckInForEmployeeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit,
      child: this,
    );
  }

  @override
  State<CheckInForEmployeePage> createState() =>
      _CheckInForEmployeePageState();
}

class _CheckInForEmployeePageState extends CheckInForEmployeePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          title: Text(
            'check_in_instead_of_another_employee'.tr(),
            style: AppTextStyles.font18SemiBold,
          ),
        ),
        body: Semantics(
          label: 'Check In Instead of Another Employee Screen',
          child: Center(
            child: Text(
              'check_in_instead_of_another_employee'.tr(),
              style: AppTextStyles.font16SemiBold.copyWith(
                color: AppColors.lightTextSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
