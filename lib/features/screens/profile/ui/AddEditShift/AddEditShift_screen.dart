import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/extension/form_auto_scroll.dart';
import 'package:newf/core/shared/methods/date_helper.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/shifts/1-create_shift_req_param.dart';
import 'package:newf/features/screens/profile/data/model/shifts/creating_shift_res/shift_creating_res.dart';
import 'package:newf/features/screens/profile/ui/AddEditShift/widgets/start_end_time_widget.dart';
import 'package:newf/features/screens/profile/ui/AddEditShift/widgets/title_with_input.dart';
import 'package:newf/features/screens/profile/ui/AddEditShift/widgets/working_days_selector.dart';

part 'AddEditShift_base_state.dart';

@RoutePage()
class AddEditShiftPage extends StatefulWidget implements AutoRouteWrapper {
  const AddEditShiftPage({super.key, required this.args});

  final AddEditShiftRouteArgs args;

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
  State<AddEditShiftPage> createState() => _AddEditShiftPageState();
}

class _AddEditShiftPageState extends AddEditShiftPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: createShiftListener,
      child: Semantics(
        label: 'Add or Edit Shift Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: CustomAppBar(
            title: widget.args.shiftItem != null
                ? 'update_shift'.tr()
                : 'new_shift'.tr(),
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
                        'shift_name'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldName,
                          labelText: 'shift_name'.tr(),
                          controller: controllerName,
                        ),
                      ),

                      AppSizes.s20.verticalSpace,
                      StartEndTimesWidget(
                        controllerS: controllerStartTime,
                        controllerE: controllerEndTime,
                        fieldS: fieldStartTime,
                        fieldE: fieldEndTime,
                        titleS: 'start_time'.tr(),
                        titleE: 'end_time'.tr(),
                      ),
                      AppSizes.s20.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppSizes.s10,
                        children: [
                          Expanded(
                            child: TitleWithInputField(
                              'grace_period_minutes'.tr(),
                              NameInputData(
                                isLabel: false,
                                widgetPrefix: const SizedBox.shrink(),
                                field: fieldGrace,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                labelText: '10',
                                controller: controllerGracePeriod,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TitleWithInputField(
                              'break_duration_minutes'.tr(),
                              NameInputData(
                                isLabel: false,
                                widgetPrefix: const SizedBox.shrink(),
                                field: fieldBreak,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                labelText: '60',
                                controller: controllerBreakDuration,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSizes.s20.verticalSpace,
                      Text(
                        'working_days'.tr(),
                        style: AppTextStyles.font14Regular.copyWith(
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      AppSizes.s10.verticalSpace,
                      WorkingDaysSelector(
                        selectedDaysNotifier: workingDaysNotifier,
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
                        child: Column(
                          children: [
                            ValueListenableBuilder<bool>(
                              valueListenable: isOvernightNotifier,
                              builder: (context, isOvernight, _) {
                                return SwitchListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    'overnight_shift'.tr(),
                                    style: AppTextStyles.font14Regular,
                                  ),
                                  value: isOvernight,
                                  activeTrackColor: context.theme.primaryColor,
                                   thumbColor: WidgetStateProperty.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return  context.theme.scaffoldBackgroundColor;
                                    }
                                    return context.theme.primaryColor  ;
                                  }),
                                   onChanged: (val) =>
                                      isOvernightNotifier.value = val,
                                );
                              },
                            ),
                            const Divider(color: AppColors.cardBorder),
                            ValueListenableBuilder<bool>(
                              valueListenable: isActiveNotifier,
                              builder: (context, isActive, _) {
                                return SwitchListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    'active'.tr(),
                                    style: AppTextStyles.font14Regular,
                                  ),
                                  value: isActive,
                                  thumbColor: WidgetStateProperty.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return  context.theme.scaffoldBackgroundColor;
                                    }
                                    return context.theme.primaryColor  ;
                                  }),
                                  onChanged: (val) =>
                                      isActiveNotifier.value = val,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      AppSizes.s32.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        height: AppSizes.s48,
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            final bool isLoading = state is ProfileLoaded &&
                                (state.createShiftState is Loading ||
                                    state.updateShiftState is Loading);
                            return ElevatedButton(
                              onPressed: () => createOrUpdateShift(isLoading),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.s8),
                                ),
                              ),
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color:
                                          context.theme.scaffoldBackgroundColor,
                                    )
                                  : Text(
                                      widget.args.shiftItem == null
                                          ? 'add'.tr()
                                          : 'save'.tr(),
                                      style:
                                          AppTextStyles.font16SemiBold.copyWith(
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
