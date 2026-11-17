import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/ui/shifts/widgets/shifts_list_widget.dart';
part 'shifts_base_state.dart';

@RoutePage()
class ShiftsPage extends StatefulWidget implements AutoRouteWrapper {
  const ShiftsPage({super.key, required this.args});
  final ShiftsRouteArgs args;
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value:args .profileCubit, child: this);
  }

  @override
  State<ShiftsPage> createState() => _ShiftsPageState();
}

class _ShiftsPageState extends ShiftsPageBaseState {
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
            'shifts'.tr(),
            style: AppTextStyles.font18Bold
                .copyWith(color: AppColors.roleSwitchSelectedBg),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.primaryColor,
          onPressed: () async {
            final res = await context.push(
              AddEditShiftRoute(
                args: AddEditShiftRouteArgs(profileCubit: profileCubit),
              ),
            );
            if (res == true) {
              await profileCubit.getListShiftsFunc(Reload());
            }
          },
          child: const Icon(Icons.add,
              color: AppColors.roleSwitchSelectedBg),
        ),
        body: Semantics(
          label: 'Shifts list',
          child: BlocSelector<ProfileCubit, ProfileState, BaseEmit?>(
            selector: (state) =>
                state is ProfileLoaded ? state.getListShiftsState : null,
            builder: (context, emit) => ShiftsListWidget(
              emit: emit,
              profileCubit: profileCubit,
            ),
          ),
        ),
      ),
    );
  }
}
