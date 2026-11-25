import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/branches/controller/branches_cubit.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/verify_branch_qr_code_res/verify_branch_qr_code_res.dart';
import 'package:newf/features/screens/home/data/model/verify_branch_qr_param.dart';
import 'package:newf/features/screens/home/ui/qr_branch_validation/widgets/qr_branch_selector_widget.dart';
import 'package:newf/features/screens/home/ui/qr_branch_validation/widgets/qr_camera_scanner_widget.dart';
import 'package:newf/features/screens/home/ui/qr_branch_validation/widgets/qr_validation_header_card_widget.dart';
import 'package:newf/features/screens/home/ui/qr_branch_validation/widgets/qr_validation_result_card_widget.dart';
import 'package:newf/features/screens/home/ui/qr_branch_validation/widgets/qr_verify_button_widget.dart';

part 'qr_branch_validation_base_state.dart';

@RoutePage()
class QrBranchValidationPage extends StatefulWidget
    implements AutoRouteWrapper {
  const QrBranchValidationPage({super.key, required this.args});
  final QrBranchValidationRouteArgs args;

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
  State<QrBranchValidationPage> createState() =>
      _QrBranchValidationPageState();
}

class _QrBranchValidationPageState
    extends QrBranchValidationPageBaseState {
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
            'check_qr_branch_validation'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        body: Semantics(
          label: 'Check QR branch validation',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSizes.s16,
              children: [
                const QrValidationHeaderCardWidget(),
                QrBranchSelectorWidget(
                  selectedNotifier: selectedBranchNotifier,
                ),
                QrVerifyButtonWidget(onVerify: _onVerifyPressed),
                const QrValidationResultCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
