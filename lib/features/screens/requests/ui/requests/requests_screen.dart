import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';
import 'package:newf/features/screens/requests/ui/requests/widgets/requests_list_content_widget.dart';

part 'requests_base_state.dart';

@RoutePage()
class RequestsPage extends StatefulWidget implements AutoRouteWrapper {
  const RequestsPage({super.key, required this.args});
  final RequestsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RequestsCubit>(
      create: (context) => AppLocator()()(),
      child: this,
    );
  }

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends RequestsPageBaseState {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestsCubit, RequestsState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          title: Text(
            'nav_requests'.tr(),
            style: AppTextStyles.font18Bold.copyWith(
              color: AppColors.roleSwitchSelectedBg,
            ),
          ),
          backgroundColor: AppColors.headerBackground,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Semantics(
                label: 'Requests and Approvals List',
                child: const RequestsListContentWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
