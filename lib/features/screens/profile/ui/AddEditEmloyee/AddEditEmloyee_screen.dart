import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/extension/form_auto_scroll.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/employees/1-create_employee_req_param.dart';
import 'package:newf/features/screens/profile/data/model/employees/2-update_employee_req_param.dart';
import 'package:newf/features/screens/profile/data/model/employees/create_employee_res/create_employee_res.dart';
import 'package:newf/features/screens/profile/ui/AddEditShift/widgets/title_with_input.dart';

part 'AddEditEmloyee_base_state.dart';

@RoutePage()
class AddEditEmloyeePage extends StatefulWidget implements AutoRouteWrapper {
  const AddEditEmloyeePage({super.key, required this.args});

  final AddEditEmloyeeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    if (args.profileCubit != null) {
      return BlocProvider.value(
        value: args.profileCubit!,
        child: this,
      );
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
                      AppSizes.s20.verticalSpace,
                      TitleWithInputField(
                        'email'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldEmail,
                          readOnly: _isEditMode,
                          enabled: !_isEditMode,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'email'.tr(),
                          controller: controllerEmail,
                          validator: (value) {
                            if (_isEditMode) return null;
                            if (value == null || value.trim().isEmpty) {
                              return "can't_be_empty".tr();
                            }
                            if (!value.contains('@')) {
                              return 'please_enter_valid_email'.tr();
                            }
                            return null;
                          },
                        ),
                      ),
                      if (!_isEditMode) ...[
                        AppSizes.s20.verticalSpace,
                        ValueListenableBuilder<bool>(
                          valueListenable: isPasswordVisibleNotifier,
                          builder: (context, isVisible, _) {
                            return TitleWithInputField(
                              'password'.tr(),
                              NameInputData(
                                isLabel: false,
                                widgetPrefix: const SizedBox.shrink(),
                                field: fieldPassword,
                                isObscureText: !isVisible,
                                labelText: 'password'.tr(),
                                controller: controllerPassword,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "can't_be_empty".tr();
                                  }
                                  if (value.trim().length < 6) {
                                    return 'the_password_must_be_at_least_6_characters'.tr();
                                  }
                                  return null;
                                },
                              ),
                            );
                          },
                        ),
                      ],
                      AppSizes.s20.verticalSpace,
                      TitleWithInputField(
                        'employee_code'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldCode,
                          readOnly: _isEditMode,
                          enabled: !_isEditMode,
                          labelText: 'employee_code'.tr(),
                          controller: controllerCode,
                        ),
                      ),
                      AppSizes.s20.verticalSpace,
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
                      AppSizes.s20.verticalSpace,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p12,
                          vertical: AppPadding.p8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(AppSizes.r10),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: isActiveNotifier,
                          builder: (context, isActive, _) {
                            return SwitchListTile.adaptive(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'active'.tr(),
                                style: AppTextStyles.font14Regular,
                              ),
                              value: isActive,
                              thumbColor:
                                  WidgetStateProperty.resolveWith((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return context.theme.scaffoldBackgroundColor;
                                }
                                return context.theme.primaryColor;
                              }),
                              onChanged: (val) =>
                                  isActiveNotifier.value = val,
                            );
                          },
                        ),
                      ),
                      AppSizes.s32.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        height: AppSizes.s48,
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            final bool isLoading = state is ProfileLoaded &&
                                (state.addEditEmployeeState is Loading ||
                                    state.addEditEmployeeState is Loading);
                            return ElevatedButton(
                              onPressed: () => createOrUpdateEmployee(isLoading),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.s8),
                                ),
                              ),
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color: context
                                          .theme.scaffoldBackgroundColor,
                                    )
                                  : Text(
                                      widget.args.employeeItem == null
                                          ? 'add'.tr()
                                          : 'save'.tr(),
                                      style: AppTextStyles.font16SemiBold
                                          .copyWith(
                                        color: context
                                            .theme.scaffoldBackgroundColor,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                      AppSizes.s20.verticalSpace,
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
