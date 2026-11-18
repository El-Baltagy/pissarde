import 'package:newf/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/features/screens/notifications/controller/notifications_cubit.dart';
 
part 'notifications_base_state.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget implements AutoRouteWrapper {
  const NotificationsPage({super.key, required this.args});
  final NotificationsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      create: (context) =>  AppLocator()()() ,
      child: this,
    );
  }

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends NotificationsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCubit, NotificationsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(

      ),
    );
  }
}
