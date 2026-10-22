import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/ui/profile/widgets/profile_content_widget.dart';

part 'profile_base_state.dart';

@RoutePage()
class ProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const ProfilePage({super.key, required this.args});
  final ProfileRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => AppLocator()()(),
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
          backgroundColor: AppColors.headerBackground,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Semantics(
                label: 'User Profile and Account Settings',
                child: const ProfileContentWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
