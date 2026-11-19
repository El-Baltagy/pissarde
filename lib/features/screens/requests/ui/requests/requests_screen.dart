import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/requests/controller/requests_cubit.dart';
import 'package:newf/features/screens/requests/data/model/get_leaves_types_res/get_leaves_types_res.dart';
import 'package:newf/features/screens/requests/data/model/leave_balances_req_param.dart';
import 'package:newf/features/screens/requests/ui/requests/widgets/leave_balance_list_widget.dart';
import 'package:newf/features/screens/requests/ui/requests/widgets/my_requests_list_widget.dart';

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
      listener: _listener,
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: CustomAppBar(
          title: 'nav_requests'.tr(),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.pending_actions_outlined,
                color: AppColors.roleSwitchSelectedBg,
              ),
              tooltip: 'pending_approvals'.tr(),
              onPressed: () => context.push(
                PendingApprovalsRoute(
                  args: PendingApprovalsRouteArgs(requestsCubit: requestsCubit),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            controller: tabController,
            labelColor: AppColors.roleSwitchSelectedBg,
            unselectedLabelColor: AppColors.contractorGreyText,
            indicatorColor: AppColors.roleSwitchSelectedBg,
            labelStyle: AppTextStyles.font14Bold,
            unselectedLabelStyle: AppTextStyles.font14Regular,
            tabs: [
              Tab(text: 'my_leave_requests'.tr()),
              Tab(text: 'leave_balance'.tr()),
            ],
          ),
        ),
        floatingActionButton: BlocSelector<RequestsCubit, RequestsState, BaseEmit?>(
          selector: (state) =>
              state is RequestsLoaded ? state.getLeaveTypesState : null,
          builder: (context, typeState) {
            return FloatingActionButton(
              backgroundColor: context.theme.primaryColor,
              onPressed: () async {
                final types = typeState is Success
                    ? (typeState.data as GetLeavesTypesRes).leave_types
                    : <LeaveTypeItem>[];
                final res = await context.push(
                  AddLeaveRequestRoute(
                    args: AddLeaveRequestRouteArgs(
                      requestsCubit: requestsCubit,
                      leaveTypes: types,
                    ),
                  ),
                );
                if (res == true) {
                  requestsCubit.getMyLeaveRequestsFunc(Reload());
                  requestsCubit.getLeaveBalancesFunc(
                    Reload(),
                    parameter: LeaveBalancesReqParam(
                      year: DateTime.now().year.toString(),
                    ),
                  );
                }
              },
              child: const Icon(
                Icons.add,
                color: AppColors.roleSwitchSelectedBg,
              ),
            );
          },
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            // Tab 1: My Requests
            BlocSelector<RequestsCubit, RequestsState, BaseEmit?>(
              selector: (state) =>
                  state is RequestsLoaded ? state.getMyLeaveRequestsState : null,
              builder: (context, emit) => MyRequestsListWidget(
                emit: emit,
                requestsCubit: requestsCubit,
              ),
            ),
            // Tab 2: Leave Balance
            BlocSelector<RequestsCubit, RequestsState, BaseEmit?>(
              selector: (state) =>
                  state is RequestsLoaded ? state.getLeaveBalancesState : null,
              builder: (context, emit) => LeaveBalanceListWidget(emit: emit),
            ),
          ],
        ),
      ),
    );
  }
}
