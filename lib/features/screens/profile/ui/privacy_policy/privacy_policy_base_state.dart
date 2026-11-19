part of 'privacy_policy_screen.dart';

abstract class PrivacyPolicyPageBaseState extends State<PrivacyPolicyPage> {
  /// Localized policy sections displayed as individual cards.
  List<({String title, String body})> get sections => [
        (
          title: 'about_this_policy'.tr(),
          body: 'this_policy_explains_how_we_collect_use_and_protect_your_personal_data_when_you_use_the_attendance_app'
              .tr(),
        ),
        (
          title: 'information_we_collect'.tr(),
          body: 'we_collect_your_name_employee_code_phone_number_attendance_records_and_branch_location'.tr(),
        ),
        (
          title: 'how_we_use_information'.tr(),
          body: 'your_data_is_used_to_manage_shifts_record_check_in_and_check_out_times_and_generate_attendance_reports'
              .tr(),
        ),
        (
          title: 'data_security'.tr(),
          body: 'your_data_is_stored_securely_encrypted_in_transit_and_accessible_only_to_authorized_personnel'.tr(),
        ),
        (
          title: 'your_rights'.tr(),
          body: 'you_may_request_access_correction_or_deletion_of_your_personal_data_by_contacting_your_administrator'
              .tr(),
        ),
        (
          title: 'contact_us'.tr(),
          body: 'for_questions_about_this_policy_please_contact_your_branch_manager_or_system_administrator'.tr(),
        ),
      ];
}
