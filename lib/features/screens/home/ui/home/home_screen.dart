import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/widgets/entrance_fader.dart';
import 'package:newf/core/storage/storage_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/branches/controller/branches_cubit.dart';
import 'package:newf/features/screens/branches/data/model/branches/get_branches_list/branches_list.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/data/model/daily_attendance_summary_res/daily_attendance_summary_res.dart';
import 'package:newf/features/screens/home/data/model/get_daily_summary_attendance_param.dart';
import 'package:newf/features/screens/home/ui/home/widgets/attendance_action_section_widget.dart';
import 'package:newf/features/screens/profile/ui/profile/widgets/container_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/extension/context.dart';
import '../../../../../core/shared/widgets/ticker_text.dart';
import '../../../../../core/theming/app_text_styles.dart';

part 'home_base_state.dart';
part 'widgets/list_options_attendance.dart';
part 'widgets/current_shift_card_widget.dart';
part 'widgets/branch_status_widget.dart';
part 'widgets/options_view_toggle_divider_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key, required this.args});
  final HomeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (context) => AppLocator()()()),
        BlocProvider<BranchesCubit>(create: (context) => AppLocator()()()),
      ],
      child: this,
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomePageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(

          leading:SizedBox.shrink(),
          toolbarHeight: 5,
        ),
        body: SingleChildScrollView(
          padding: .only(bottom: 100),
          child: Column(
            spacing:16 ,
            children: [
              SizedBox.shrink(),
              if( StorageHelper.isAdminOrHrOrSupervisor)
                 Semantics(
                  label: 'Branch Status Overview',
                  child: const BranchStatusCardWidget(),
                ),

              Semantics(
                label: 'Toggle Options View Mode',
                child: ValueListenableBuilder<bool>(
                  valueListenable: isGridOptionsNotifier,
                  builder: (context, isGrid, _) {
                    return OptionsViewToggleDividerWidget(
                      isGrid: isGrid,
                      onToggle: () =>
                          isGridOptionsNotifier.value = !isGrid,
                    );
                  },
                ),
              ),

              if(!StorageHelper.isAdmin)
              Semantics(
                label: 'Check Out Action Section',
                child: const AttendanceActionSectionWidget(),
              ),

              Semantics(
                label: 'Attendance Options List',
                child: ValueListenableBuilder<bool>(
                  valueListenable: isGridOptionsNotifier,
                  builder: (context, isGrid, _) {
                    return ListOptionsAttendance(
                      homeCubit: homeCubit,
                      isGrid: isGrid,
                    );
                  },
                ),
              ),

             ],
          ),
        ),
      ),
    );
  }
}
