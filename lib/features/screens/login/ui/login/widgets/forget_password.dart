import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_assets.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/widgets/text_inputs/email_text_input_data.dart';
import 'package:newf/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/login/controller/login_cubit.dart';
import 'package:newf/features/screens/login/controller/login_state.dart';
import 'package:newf/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
import 'package:newf/features/screens/login/data/model/forget_password_parameter.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (
    GlobalKey<FormFieldState<dynamic>>(),
    FocusNode()
  );

  @override
  void dispose() {
    _emailController.dispose();
    field1.$2?.dispose();
    super.dispose();
  }

  void _onSend(LoginCubit cubit) {
    if (_formKey.currentState?.validate() ?? false) {
      cubit.sendResetPWLinkFunc(
        parameter: ForgetPasswordParameter(_emailController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AppLocator()()()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is ForgetPasswordLinkState) {
            if (state.baseEmit is Success<ForgetPasswordLink>) {
              final data =
                  (state.baseEmit as Success<ForgetPasswordLink>).data!;
              context.showToast(data.message);
              Navigator.pop(context);
            } else if (state.baseEmit is ErrorState) {
              final ErrorState data = state.baseEmit as ErrorState;
              context.showToast(data.failure.message, isSuccess: false);
            }
          }
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'do_you_forget_password'.tr(),
              style: AppTextStyles.font18SemiBold.copyWith(
                color: context.theme.textTheme.bodyLarge?.color,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: context.theme.iconTheme.color,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: Column(
                  spacing: AppSizes.s24,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSizes.r16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p32,
                          vertical: AppPadding.p24,
                        ),
                        child: Image.asset(
                          AppAssets.imagesLogoPng,
                          height: 80,
                        ),
                      ),
                    ),

                    // Title & subtitle
                    Column(
                      spacing: AppSizes.s8,
                      children: [
                        Text(
                          'do_you_forget_password'.tr(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font24Bold.copyWith(
                            color: context.theme.textTheme.bodyLarge?.color,
                          ),
                        ),
                        Text(
                          'enter_email_to_receive_reset_link'.tr(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font14Regular,
                        ),
                      ],
                    ),

                    // Email input
                    TextInputWidget(
                      data: EmailInputData(
                        controller: _emailController,
                        field: field1,
                      ),
                    ),

                    // Send button
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        final isLoading = state is ForgetPasswordLinkState &&
                            state.baseEmit is Loading;
                        return isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () =>
                                    _onSend(LoginCubit.get(context: context)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: context.theme.primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSizes.r12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'send'.tr(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
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
      ),
    );
  }
}
