import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/storage/storage_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_values.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/ui/home/widgets/attendance_action_section_widget.dart';
import 'package:newf/features/screens/profile/ui/profile/widgets/container_list.dart';

import '../../../../../core/extension/context.dart';
import '../../../../../core/shared/widgets/ticker_text.dart';
import '../../../../../core/theming/app_text_styles.dart';

part 'home_base_state.dart';
part 'widgets/list_options_attendance.dart';
part 'widgets/current_shift_card_widget.dart';
part 'widgets/branch_status_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key, required this.args});
  final HomeRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => AppLocator()()(),
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
          // title: const Text('Home'),
          // centerTitle: true,
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
                label: 'Current Shift Details',
                child: const CurrentShiftCardWidget(),
              ),

              if(!StorageHelper.isAdmin)
              Semantics(
                label: 'Check Out Action Section',
                child: const AttendanceActionSectionWidget(),
              ),

              Semantics(
                label: 'Attendance Options List',
                child:   ListOptionsAttendance(
                  homeCubit: homeCubit,
                ),
              ),

             ],
          ),
        ),
      ),
    );
  }
}
