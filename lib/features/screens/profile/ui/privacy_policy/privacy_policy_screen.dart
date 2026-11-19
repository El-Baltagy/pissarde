import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_values.dart';

import 'package:newf/features/screens/profile/ui/privacy_policy/widgets/policy_header_card.dart';
import 'package:newf/features/screens/profile/ui/privacy_policy/widgets/policy_section_card.dart';

part 'privacy_policy_base_state.dart';

@RoutePage()
class PrivacyPolicyPage extends StatefulWidget implements AutoRouteWrapper {
  const PrivacyPolicyPage({super.key, required this.args});

  final PrivacyPolicyRouteArgs args;

  /// Static content page — no cubit is required.
  @override
  Widget wrappedRoute(BuildContext context) => this;

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends PrivacyPolicyPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'privacy_policy'.tr()),
      body: Semantics(
        label: 'Privacy Policy',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.s16,
            children: [
              const PolicyHeaderCard(),
              ...sections.map((section) => PolicySectionCard(
                    title: section.title,
                    body: section.body,
                  )),
              AppSizes.s8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
