import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:newf/core/extension/form_auto_scroll.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/shared/widgets/one_item_drop_down_sheet.dart';
import 'package:newf/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/branches/get_branches_list/branches_list.dart'
    as branches_model;
import 'package:newf/features/screens/profile/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/profile/data/model/employees/2-update_employee_req_param.dart';
import 'package:newf/features/screens/profile/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/profile/data/model/employees/get_all_employees_res/get_all_employees_res.dart'
    as employees_model;
import 'package:newf/features/screens/profile/data/model/shifts/get_all_shifts_res/get_all_shifts_res.dart';
import 'package:newf/features/screens/profile/ui/AddEditEmloyee/widgets/BottomSheetSelector.dart';
import 'package:newf/features/screens/profile/ui/AddEditShift/widgets/title_with_input.dart';

import '../../../../../core/shared/widgets/text_inputs/drop_down_select.dart';
import '../../../../../core/shared/widgets/text_inputs/email_text_input_data.dart';
import '../../../../../core/shared/widgets/text_inputs/password_text_input_data.dart';

part 'AddEditEmloyee_base_state.dart';

part 'widgets/active_switch_widget.dart';

part 'widgets/supervisor_selector_widget.dart';

part 'widgets/shift_selector_widget.dart';

part 'widgets/branch_selector.dart';

@RoutePage()
class AddEditEmloyeePage extends StatefulWidget implements AutoRouteWrapper {
  const AddEditEmloyeePage({super.key, required this.args});

  final AddEditEmloyeeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    if (args.profileCubit != null) {
      return BlocProvider.value(value: args.profileCubit!, child: this);
    }
    return BlocProvider<ProfileCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<AddEditEmloyeePage> createState() => _AddEditEmloyeePageState();
}

class _AddEditEmloyeePageState extends AddEditEmloyeePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: createEmployeeListener,
      child: Semantics(
        label: 'Add or Edit Employee Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: CustomAppBar(
            title: widget.args.employeeItem != null
                ? 'update_employee'.tr()
                : 'new_employee'.tr(),
          ),
          body: ValueListenableBuilder<bool>(
            valueListenable: isLoadingNotifier,
            builder: (context, isLoadingData, _) {
              if (isLoadingData) {
                return const Center(child: CircularProgressIndicator());
              }
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    spacing: AppSizes.s20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWithInputField(
                        'employee_name'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldName,
                          labelText: 'employee_name'.tr(),
                          controller: controllerName,
                        ),
                      ),
                      TitleWithInputField(
                        'email'.tr(),
                        EmailInputData(
                          isLabel: false,
                           field: fieldEmail,
                          // readOnly: _isEditMode,
                          // enabled: !_isEditMode,
                          // keyboardType: TextInputType.emailAddress,
                          labelText: 'email'.tr(),
                          controller: controllerEmail,
                        ),
                      ),
                      if (!_isEditMode)
                        TitleWithInputField(
                          'password'.tr(),
                          PasswordInputData(
                            isLabel: false,
                            field: fieldPassword,
                            labelText: 'password'.tr(),
                            controller: controllerPassword,
                          ),
                        ),
                      TitleWithInputField(
                        'phone'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldPhone,
                          keyboardType: TextInputType.phone,
                          labelText: 'phone'.tr(),
                          controller: controllerPhone,
                        ),
                      ),

                      ActiveSwitchWidget(isActiveNotifier: isActiveNotifier),

                      BranchSelector(
                        selectedNotifier: selectedBranchNotifier,
                        field: fieldBranch,
                      ),
                      ShiftSelectorWidget(
                        selectedNotifier: selectedShiftNotifier,
                        field: fieldShift,
                      ),
                      SupervisorSelectorWidget(
                        selectedNotifier: selectedSupervisorNotifier,
                        field: fieldSupervisor,
                      ),

                      /// extract --SubmitButton
                      SizedBox.shrink(),

                      Container(
                        margin: EdgeInsets.only(top: AppSizes.s16),
                        width: double.infinity,
                        height: AppSizes.s48,
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            final bool isLoading =
                                state is ProfileLoaded &&
                                (state.addEditEmployeeState is Loading ||
                                    state.addEditEmployeeState is Loading);
                            return ElevatedButton(
                              onPressed: () =>
                                  createOrUpdateEmployee(isLoading),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.s8,
                                  ),
                                ),
                              ),
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color:
                                          context.theme.scaffoldBackgroundColor,
                                    )
                                  : Text(
                                      widget.args.employeeItem == null
                                          ? 'add'.tr()
                                          : 'save'.tr(),
                                      style: AppTextStyles.font16SemiBold
                                          .copyWith(
                                            color: context
                                                .theme
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                            );
                          },
                        ),
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
