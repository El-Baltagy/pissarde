import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/features/screens/home/controller/home_cubit.dart';
import 'package:newf/features/screens/home/ui/home/widgets/attendance_action_section_widget.dart';

part 'home_base_state.dart';

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

              Semantics(
                label: 'Check Out Action Section',
                child: const AttendanceActionSectionWidget(),
              ),
              /// extract --ListOptionsAttendance
              SizedBox.shrink(),



              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
