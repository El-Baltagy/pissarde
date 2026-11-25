import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/methods/qr_token_validator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/branches/controller/branches_cubit.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/rotate_branch_qr_code_res/rotate_branch_qr_code_res.dart';
import 'package:newf/features/screens/home/data/model/rotate_branch_qr_param.dart';
import 'package:newf/features/screens/home/ui/rotate_branch_qr/widgets/rotate_qr_branch_selector_widget.dart';
import 'package:newf/features/screens/home/ui/rotate_branch_qr/widgets/rotate_qr_button_widget.dart';
import 'package:newf/features/screens/home/ui/rotate_branch_qr/widgets/rotate_qr_display_widget.dart';
import 'package:newf/features/screens/home/ui/rotate_branch_qr/widgets/rotate_qr_header_card_widget.dart';

part 'rotate_branch_qr_base_state.dart';

@RoutePage()
class RotateBranchQrPage extends StatefulWidget implements AutoRouteWrapper {
  const RotateBranchQrPage({super.key, required this.args});
  final RotateBranchQrRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: args.homeCubit),
        BlocProvider<BranchesCubit>(create: (context) => AppLocator()()()),
      ],
      child: this,
    );
  }

  @override
  State<RotateBranchQrPage> createState() => _RotateBranchQrPageState();
}

class _RotateBranchQrPageState extends RotateBranchQrPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: _listener,
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.roleSwitchSelectedBg),
          title: Text(
            'rotate_branch_qr'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        body: Semantics(
          label: 'Rotate Branch QR Screen',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSizes.s16,
              children: [
                const RotateQrHeaderCardWidget(),
                RotateQrBranchSelectorWidget(
                  selectedNotifier: selectedBranchNotifier,
                ),
                RotateQrButtonWidget(onRotate: _onRotatePressed),
                const RotateQrDisplayWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
