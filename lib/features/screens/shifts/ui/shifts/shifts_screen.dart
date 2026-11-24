import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/widgets/entrance_fader.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/shifts/controller/shifts_cubit.dart';
import 'package:newf/features/screens/shifts/ui/shifts/widgets/shifts_list_widget.dart';

import '../../../../../core/constants/app_locator.dart';
part 'shifts_base_state.dart';

@RoutePage()
class ShiftsPage extends StatefulWidget implements AutoRouteWrapper {
  const ShiftsPage({super.key, required this.args});
  final ShiftsRouteArgs args;
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ShiftsCubit>(create: (context) =>AppLocator()()(), child: this);
  }

  @override
  State<ShiftsPage> createState() => _ShiftsPageState();
}

class _ShiftsPageState extends ShiftsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShiftsCubit, ShiftsState>(
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
            'shifts'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        floatingActionButton: FloatingActionButton(heroTag: null, 
          backgroundColor: context.theme.primaryColor,
          onPressed: () async {
            final res = await context.push(
              AddEditShiftRoute(
                args: AddEditShiftRouteArgs(shiftsCubit: shiftsCubit),
              ),
            );
            if (res == true) {
              await shiftsCubit.getListShiftsFunc(Reload());
            }
          },
          child: const Icon(Icons.add,
              color: AppColors.roleSwitchSelectedBg),
        ),
        body: Semantics(
          label: 'Shifts list',
          child: BlocSelector<ShiftsCubit, ShiftsState, BaseEmit?>(
            selector: (state) =>
                state is ShiftsLoaded ? state.getListShiftsState : null,
            builder: (context, emit) => EntranceFader(
              dx: context.isLTR?-20:20,
              child: ShiftsListWidget(
                emit: emit,
                shiftsCubit: shiftsCubit,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
