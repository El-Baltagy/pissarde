import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_assets.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/form_auto_scroll.dart';
import 'package:newf/core/shared/widgets/loading_widget_app.dart';
import 'package:newf/core/shared/widgets/text_inputs/email_text_input_data.dart';
import 'package:newf/core/shared/widgets/text_inputs/password_text_input_data.dart';
import 'package:newf/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/login/controller/login_cubit.dart';
import 'package:newf/features/screens/login/controller/login_state.dart';
import 'package:newf/features/screens/login/data/model/login_parameters.dart';
import 'package:newf/features/screens/login/data/model/login_res/login_res.dart';
import 'package:newf/features/screens/login/ui/login/widgets/forget_password.dart';

part 'login_base_state.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: loginCubitListener,
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: Column(
                  spacing: AppSizes.s16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Image.asset(AppAssets.imagesLogoPng, height: 120),
                    const SizedBox(height: AppSizes.s32),

                    TextInputWidget(
                      data: EmailInputData(
                        controller: emailController,
                        field: field1,
                      ),
                    ),

                    TextInputWidget(
                      data: PasswordInputData(
                        controller: passwordController,
                        field: field2,
                      ),
                    ),

                    forgetPasswordWidget(),

                    const SizedBox(height: AppSizes.s8),

                    // Login Button
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        final isLoading =
                            state is LoginResState && state.baseEmit is Loading;
                        return ElevatedButton(
                          onPressed: () async {
                            if (isLoading) return;
                            if (await formKey.validateAndScroll(
                              context,
                              listRecorder: [field1, field2],
                            )) {
                              await argData.login(
                                parameter: LoginParameters(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.r12),
                            ),
                            backgroundColor: context.theme.primaryColor,
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: LoadingWidgetApp(),
                                )
                              : Text(
                                  'login'.tr(),
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

  Widget forgetPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => context.pushNavigation(const ForgetPasswordScreen()),
          child: Text(
            "do_you_forget_password".tr(),
            style: TextStyle(
              color: context.theme.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
