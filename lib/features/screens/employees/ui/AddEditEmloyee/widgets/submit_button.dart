part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [SubmitButton]
class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onPress, required this.isAdd});

  final void Function(bool) onPress;

  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.s16),
      width: double.infinity,
      height: AppSizes.s48,
      child: BlocBuilder<EmployeesCubit, EmployeesState>(
        builder: (context, state) {
          final bool isLoading =
              state is EmployeesLoaded &&
              (state.addEditEmployeeState is Loading ||
                  state.addEditEmployeeState is Loading);
          return ElevatedButton(
                  onPressed: isLoading?null:() => onPress(isLoading),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.s8),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                    color: context.theme.scaffoldBackgroundColor,
                  )
                      : Text(
                    isAdd ? 'add'.tr() : 'save'.tr(),
                    style: AppTextStyles.font16SemiBold.copyWith(
                      color: context.theme.scaffoldBackgroundColor,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
