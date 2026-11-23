part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [SupervisorSelectorWidget]
class SupervisorSelectorWidget extends StatelessWidget {

  const SupervisorSelectorWidget({super.key, required this.selectedNotifier, this.field, required this.selectedBranchNotifier});
  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  final ValueNotifier<List<int>>   selectedBranchNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: selectedBranchNotifier, builder: (context, value, child) {

      return   BlocSelector<EmployeesCubit, EmployeesState, BaseEmit?>(
        selector: (state) =>
        state is EmployeesLoaded ? state.getSupervisorsState : null,
        builder: (context, state) {
          final isLoading = state is! Success<GetSupervisorsList>;
          final branches = (state is Success<GetSupervisorsList>
              ? state.data!.data
              :  <Supervisortem>[]).where((element) =>element.branch.id==value.firstOrNull ).toList();
          List<UIApiKeys<String>> list = .generate(
            branches.length,
                (i) => UIApiKeys(branches[i].name, branches[i].id.toString()),
          );
          return Skeletonizer(
            enabled: isLoading,
            child: BottomSheetSelector(
              listChoices: list,
              selectedNotifier: selectedNotifier,
              isMultiSelect: false,

              onTap:() =>onTap(  context,  value.isEmpty,  list.isEmpty)  ,
              title: 'supervisor'.tr(),
              field: field,
            ),
          );
        },
      );
    },);
  }
  void Function()?    onTap(BuildContext context,bool emptyBranch,bool emptySupervisor){
    if(emptyBranch){
      context.showToast('please_select_branch_first'.tr(),
          isSuccess: false
      );
    } if(emptySupervisor){
      context.showToast('this_branch_has_no_supervisor'.tr(),
          isSuccess: false
      );
    }
    return null;
  }

}

