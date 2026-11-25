import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/methods/position_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/employees/controller/employees_cubit.dart';
import 'package:newf/features/screens/employees/data/model/employees/get_all_employees_res/get_all_employees_res.dart';
import 'package:newf/features/screens/employees/data/model/list_employees_param.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/chech_in_res/chech_in_res.dart';
import 'package:newf/features/screens/home/data/model/check_in_req_param.dart';
import 'package:newf/features/screens/home/ui/check_in_for_employee/widgets/check_in_duty_reason_widget.dart';
import 'package:newf/features/screens/home/ui/check_in_for_employee/widgets/check_in_employee_button_widget.dart';
import 'package:newf/features/screens/home/ui/check_in_for_employee/widgets/check_in_employee_header_card_widget.dart';
import 'package:newf/features/screens/home/ui/check_in_for_employee/widgets/check_in_employee_selector_widget.dart';
import 'package:newf/features/screens/home/ui/qr_branch_validation/widgets/qr_camera_scanner_widget.dart';

part 'check_in_for_employee_base_state.dart';

@RoutePage()
class CheckInForEmployeePage extends StatefulWidget
    implements AutoRouteWrapper {
  const CheckInForEmployeePage({super.key, required this.args});
  final CheckInForEmployeeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: args.homeCubit),
        BlocProvider<EmployeesCubit>(create: (context) => AppLocator()()()),
      ],
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
      listener: _listener,
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.roleSwitchSelectedBg),
          title: Text(
            'check_in_instead_of_another_employee'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        body: Semantics(
          label: 'Check In Instead of Another Employee Screen',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSizes.s16,
              children: [
                const CheckInEmployeeHeaderCardWidget(),
                CheckInEmployeeSelectorWidget(
                  selectedNotifier: selectedEmployeeNotifier,
                ),
                CheckInDutyReasonWidget(
                  controllerDutyReason: controllerDutyReason,
                ),
                CheckInEmployeeButtonWidget(
                  isLocatingNotifier: isLocatingNotifier,
                  onCheckIn: _onCheckInPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
