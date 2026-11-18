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
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/data/model/branches/1-create_branch_req_param.dart';
import 'package:newf/features/screens/profile/data/model/branches/2-update_branch_req_param.dart';
import 'package:newf/features/screens/profile/data/model/branches/create_branch_res/create_branch_res.dart';
import 'package:newf/features/screens/profile/ui/AddEditShift/widgets/title_with_input.dart';

part 'AddEditBranch_base_state.dart';

@RoutePage()
class AddEditBranchPage extends StatefulWidget implements AutoRouteWrapper {
  const AddEditBranchPage({super.key, required this.args});

  final AddEditBranchRouteArgs args;

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
  State<AddEditBranchPage> createState() => _AddEditBranchPageState();
}

class _AddEditBranchPageState extends AddEditBranchPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: createBranchListener,
      child: Semantics(
        label: 'Add or Edit Branch Screen',
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: CustomAppBar(
            title: widget.args.branchItem != null
                ? 'update_branch'.tr()
                : 'new_branch'.tr(),
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
                        'branch_name'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldName,
                          labelText: 'branch_name'.tr(),
                          controller: controllerName,
                        ),
                      ),
                      AppSizes.s20.verticalSpace,
                      TitleWithInputField(
                        'branch_code'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldCode,
                          labelText: 'branch_code'.tr(),
                          controller: controllerCode,
                        ),
                      ),
                      AppSizes.s20.verticalSpace,
                      TitleWithInputField(
                        'address'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldAddress,
                          labelText: 'address'.tr(),
                          controller: controllerAddress,
                        ),
                      ),
                      AppSizes.s20.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppSizes.s10,
                        children: [
                          Expanded(
                            child: TitleWithInputField(
                              'latitude'.tr(),
                              NameInputData(
                                isLabel: false,
                                widgetPrefix: const SizedBox.shrink(),
                                field: fieldLat,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: '24.7136',
                                controller: controllerLat,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TitleWithInputField(
                              'longitude'.tr(),
                              NameInputData(
                                isLabel: false,
                                widgetPrefix: const SizedBox.shrink(),
                                field: fieldLng,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: '46.6753',
                                controller: controllerLng,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSizes.s20.verticalSpace,
                      TitleWithInputField(
                        'geofence_radius'.tr(),
                        NameInputData(
                          isLabel: false,
                          widgetPrefix: const SizedBox.shrink(),
                          field: fieldRadius,
                          enableValidation: false,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          labelText: '100',
                          controller: controllerRadius,
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
                                (state.createBranchState is Loading ||
                                    state.updateBranchState is Loading);
                            return ElevatedButton(
                              onPressed: () => createOrUpdateBranch(isLoading),
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
                                      widget.args.branchItem == null
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
