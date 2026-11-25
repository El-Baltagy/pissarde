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
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/verify_branch_qr_code_res/verify_branch_qr_code_res.dart';
import 'package:newf/features/screens/home/data/model/verify_branch_qr_param.dart';

part 'qr_branch_validation_base_state.dart';

@RoutePage()
class QrBranchValidationPage extends StatefulWidget
    implements AutoRouteWrapper {
  const QrBranchValidationPage({super.key, required this.args});
  final QrBranchValidationRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: args.homeCubit, child: this);
  }

  @override
  State<QrBranchValidationPage> createState() =>
      _QrBranchValidationPageState();
}

class _QrBranchValidationPageState
    extends QrBranchValidationPageBaseState {
  final _formKey = GlobalKey<FormState>();
  final _branchIdController = TextEditingController();
  final _tokenController = TextEditingController();

  @override
  void dispose() {
    _branchIdController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  Future<void> _submit(bool isLoading) async {
    if (isLoading) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;

    await homeCubit.verifyBranchQrFunc(
      Init(),
      parameter: VerifyBranchQrParam(
        branch_id: _branchIdController.text.trim(),
        branch_token: _tokenController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) {
          if (state.verifyBranchQrState is Success) {
            final res = (state.verifyBranchQrState as Success).data;
            final msg = res is VerifyBranchQrCodeRes
                ? res.reason
                : (res?.valid == true ? 'valid'.tr() : 'invalid'.tr());
            context.showToast(msg, isSuccess: res is VerifyBranchQrCodeRes ? res.valid : false);
          } else if (state.verifyBranchQrState is ErrorState) {
            final err = state.verifyBranchQrState as ErrorState;
            context.showToast(err.failure.message, isSuccess: false);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(title: 'check_qr_branch_validation'.tr()),
        body: Semantics(
          label: 'Check QR branch validation',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppSizes.s16,
                children: [
                  _Field(
                    controller: _branchIdController,
                    label: 'branch_id'.tr(),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'required'.tr() : null,
                  ),
                  _Field(
                    controller: _tokenController,
                    label: 'branch_token'.tr(),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'required'.tr() : null,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final isLoading = state is HomeLoaded &&
                          state.verifyBranchQrState is Loading;
                      return SizedBox(
                        width: double.infinity,
                        height: AppSizes.s48,
                        child: ElevatedButton(
                          onPressed: () => _submit(isLoading),
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
                                  'verify'.tr(),
                                  style: AppTextStyles.font16SemiBold
                                      .copyWith(
                                    color:
                                        context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is! HomeLoaded) return const SizedBox.shrink();
                      final s = state.verifyBranchQrState;
                      if (s is! Success<VerifyBranchQrCodeRes>) {
                        return const SizedBox.shrink();
                      }
                      final res = s.data;
                      if (res == null) return const SizedBox.shrink();
                      final color = res.valid
                          ? AppColors.contractorGreen
                          : AppColors.primaryActionRed;
                      return Container(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(AppSizes.r10),
                          border: Border.all(color: color),
                        ),
                        child: Row(
                          spacing: AppSizes.s12,
                          children: [
                            Icon(
                              res.valid
                                  ? Icons.check_circle_rounded
                                  : Icons.cancel_rounded,
                              color: color,
                              size: AppSizes.s28,
                            ),
                            Expanded(
                              child: Text(
                                res.reason,
                                style: AppTextStyles.font14SemiBold
                                    .copyWith(color: color),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.label,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.s6,
      children: [
        Text(
          label,
          style: AppTextStyles.font14Regular.copyWith(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
              vertical: AppPadding.p10,
            ),
          ),
        ),
      ],
    );
  }
}
