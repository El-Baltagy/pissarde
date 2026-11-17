import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/features/screens/profile/controller/profile_cubit.dart';
import 'package:newf/features/screens/profile/ui/official_holidays/widgets/holidays_list_widget.dart';

import '../../../../../core/app/route.dart';
import 'package:newf/core/extension/context.dart';

part 'official_holidays_base_state.dart';

@RoutePage()
class OfficialHolidaysPage extends StatefulWidget implements AutoRouteWrapper {
  const OfficialHolidaysPage({super.key, required this.args});
  final OfficialHolidaysRouteArgs args;
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value:args .profileCubit, child: this);
  }

  @override
  State<OfficialHolidaysPage> createState() => _OfficialHolidaysPageState();
}

class _OfficialHolidaysPageState extends OfficialHolidaysPageBaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme:
            const IconThemeData(color: AppColors.roleSwitchSelectedBg),
        title: Text(
          'official_holidays'.tr(),
          style: AppTextStyles.font18Bold
              .copyWith(color: AppColors.roleSwitchSelectedBg),
        ),
      ),
      body: Semantics(
        label: 'Official holidays list',
        child: BlocSelector<ProfileCubit, ProfileState, BaseEmit?>(
          selector: (state) =>
              state is ProfileLoaded ? state.getListHolidaysState : null,
          builder: (context, emit) => HolidaysListWidget(emit: emit),
        ),
      ),
    );
  }
}
