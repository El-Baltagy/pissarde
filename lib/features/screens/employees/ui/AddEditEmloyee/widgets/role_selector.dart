part of '../AddEditEmloyee_screen.dart';

/// Extracted mini widget: [RoleSelector]
class RoleSelector extends StatelessWidget {
  const RoleSelector({
    super.key,
    required this.selectedNotifier,
    this.field,
    this.preselectValue,
  });

  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  final String? preselectValue;

  static List<(bool ,UIApiKeys<String>)> options = [

    // (false,UIApiKeys('admin'.tr(), 'admin', secUiTxt: 'admin_hint'.tr())),

    (false,UIApiKeys('hr'.tr(), 'hr', secUiTxt: 'hr_hint'.tr())),
    (false,UIApiKeys('supervisor'.tr(), 'supervisor', secUiTxt: 'supervisor_hint'.tr())),
    (true,UIApiKeys('sales_employee'.tr(), 'sales_employee', secUiTxt: 'sales_employee_hint'.tr())),
    (true,UIApiKeys('admin_employee'.tr(), 'admin_employee', secUiTxt: 'admin_employee_hint'.tr())),
    (true,UIApiKeys('duty_employee'.tr(), 'duty_employee', secUiTxt: 'duty_employee_hint'.tr())),

    (true,UIApiKeys('warehouse'.tr(), 'warehouse' )),
    (true,UIApiKeys('laboratory'.tr(), 'laboratory' )),
    (true,UIApiKeys('driver'.tr(), 'driver' )),
  ];
  static List<int> selectedIndexes = options
      .asMap()
      .entries
      .where((entry) => !entry.value.$1)
      .map((entry) => entry.key)
      .toList();

  @override
  Widget build(BuildContext context) {
    if (preselectValue != null &&
        selectedNotifier.value.isEmpty &&
        options.isNotEmpty) {
      final idx = options.indexWhere((e) => e.$2.apiValue == preselectValue);
      if (idx != -1) {
        selectedNotifier.value = [idx];
      }
    }

    return BottomSheetSelector(
      listChoices: options.map((e) => e.$2).toList(),
      selectedNotifier: selectedNotifier,
      isMultiSelect: false,

      title: 'role'.tr(),
      field: field,
    );
  }
}
