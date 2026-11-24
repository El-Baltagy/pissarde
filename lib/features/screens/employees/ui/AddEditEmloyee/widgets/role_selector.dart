part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [RoleSelector]
class RoleSelector extends StatelessWidget {
  const RoleSelector({super.key, required this.selectedNotifier, this.field});
  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  @override
  Widget build(BuildContext context) {
    List<UIApiKeys<String>> list = [
      UIApiKeys('admin'.tr(), 'admin'),
      UIApiKeys('hr'.tr(), 'hr'),
      UIApiKeys('supervisor'.tr(), 'supervisor'),
      UIApiKeys('sales_employee'.tr(), 'sales_employee'),
      UIApiKeys('admin_employee'.tr(), 'admin_employee'),
      UIApiKeys('duty_employee'.tr(), 'duty_employee'),

    ];
    return BottomSheetSelector(
      listChoices: list,
      selectedNotifier: selectedNotifier,
      isMultiSelect: false,

      title: 'role'.tr(),
      field: field,
    );
  }
}

