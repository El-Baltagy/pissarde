part of '../profile_screen.dart';

/// Extracted mini widget: [LogoutButtonWidget]
class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LogoutState && state.baseEmit is Success) {
                        context.router.replaceAll([const LoginRoute()]);
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is LogoutState && state.baseEmit is Loading;
                      if (isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return _buildLogoutButton(() => LoginCubit.get(context: context).logoutFunc());
                    },
                  );
  }
  Widget _buildLogoutButton(void Function()? logout) {
    return OutlinedButton.icon(
      onPressed: logout,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.notificationRed,
        side: const BorderSide(color: AppColors.notificationRed),
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
      ),
      icon: const Icon(Icons.logout_rounded, size: AppSizes.s18),
      label: Text(
        'logout'.tr(),
        style: AppTextStyles.font14Bold.copyWith(
          color: AppColors.notificationRed,
        ),
      ),
    );
  }
}

