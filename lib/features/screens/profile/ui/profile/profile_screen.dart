import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/storage/storage_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/ui/profile/widgets/container_list.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/theming/app_values.dart';
import '../../../login/controller/login_cubit.dart';
import '../../../login/controller/login_state.dart';
import 'package:newf/core/extension/context.dart' as c;

part 'profile_base_state.dart';

part 'widgets/list_options.dart';

part 'widgets/logout_button_widget.dart';

part 'widgets/language_selector_widget.dart';

part 'widgets/profile_card_widget.dart';

@RoutePage()
class ProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const ProfilePage({super.key, required this.args});

  final ProfileRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(create: (context) => AppLocator()()()),
        BlocProvider.value(value: args.loginCubit),
      ],
      child: this,
    );
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ProfilePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          title: Text(
            'nav_my_account'.tr(),
            style: AppTextStyles.font18Bold.copyWith(
              color: AppColors.roleSwitchSelectedBg,
            ),
          ),
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Semantics(
            label: 'User Profile and Account Settings',
            child: Padding(
              padding: const EdgeInsets.all(
                AppPadding.p16,
              ).copyWith(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppSizes.s16,
                children: [

                  ProfileCardWidget(),
                  LanguageSelectorWidget(),
                  ListOptionsWidget(
                    profileCubit: profileCubit
                  ),
                  LogoutButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
