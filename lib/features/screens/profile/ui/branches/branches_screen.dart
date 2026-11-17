import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/ui/branches/widgets/branches_list_widget.dart';
import 'package:newf/features/screens/profile/ui/branches/widgets/add_branch_bottom_sheet.dart';
import 'package:newf/core/extension/context.dart';

part 'branches_base_state.dart';

@RoutePage()
class BranchesPage extends StatefulWidget implements AutoRouteWrapper {
  const BranchesPage({super.key, required this.args});
  final BranchesRouteArgs args;
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value:args .profileCubit, child: this);
  }

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends BranchesPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: _listener,
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme:
              const IconThemeData(color: AppColors.roleSwitchSelectedBg),
          title: Text(
            'branches'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.primaryColor,
          onPressed: () => _showAddBranchSheet(context),
          child: const Icon(Icons.add,
              color: AppColors.roleSwitchSelectedBg),
        ),
        body: Semantics(
          label: 'Branches list',
          child: BlocSelector<ProfileCubit, ProfileState, BaseEmit?>(
            selector: (state) =>
                state is ProfileLoaded ? state.getListBranchesState : null,
            builder: (context, emit) => BranchesListWidget(emit: emit),
          ),
        ),
      ),
    );
  }
}
