import 'package:newf/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
 
part 'AddEditShift_base_state.dart';

@RoutePage()
class AddEditShiftPage extends StatefulWidget implements AutoRouteWrapper {
  const AddEditShiftPage({super.key, required this.args});
  final AddEditShiftRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) =>  AppLocator()()() ,
      child: this,
    );
  }

  @override
  State<AddEditShiftPage> createState() => _AddEditShiftPageState();
}

class _AddEditShiftPageState extends AddEditShiftPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(

      ),
    );
  }
}
