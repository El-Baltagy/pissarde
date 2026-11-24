import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/shared/widgets/entrance_fader.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/branches/controller/branches_cubit.dart';
import 'package:newf/features/screens/branches/ui/branches/widgets/branches_list_widget.dart';
import 'package:newf/core/extension/context.dart';

import '../../../../../core/constants/app_locator.dart';
import '../../../shifts/controller/shifts_cubit.dart';

part 'branches_base_state.dart';

@RoutePage()
class BranchesPage extends StatefulWidget implements AutoRouteWrapper {
  const BranchesPage({super.key, required this.args});
  final BranchesRouteArgs args;
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<BranchesCubit>(create: (context) =>AppLocator()()(), child: this);
  }

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends BranchesPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchesCubit, BranchesState>(
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
        floatingActionButton: FloatingActionButton(heroTag: null, 
          backgroundColor: context.theme.primaryColor,
          onPressed: () async {
            final res = await context.push(
              AddEditBranchRoute(
                args: AddEditBranchRouteArgs(branchesCubit: branchesCubit),
              ),
            );
            if (res == true) {
              await branchesCubit.getListBranchesFunc(Reload());
            }
          },
          child: const Icon(Icons.add,
              color: AppColors.roleSwitchSelectedBg),
        ),
        body: Semantics(
          label: 'Branches list',
          child: BlocSelector<BranchesCubit, BranchesState, BaseEmit?>(
            selector: (state) =>
                state is BranchesLoaded ? state.getListBranchesState : null,
            builder: (context, emit) => EntranceFader(
              dx: context.isLTR?-30:30,
              child: BranchesListWidget(
                emit: emit,
                branchesCubit: branchesCubit,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
