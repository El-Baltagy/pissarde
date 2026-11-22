import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newf/core/app/route.dart';
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/core/base/base_state.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/storage/storage_helper.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';
 import 'package:newf/features/screens/home/ui/home/home_screen.dart';
import 'package:newf/features/screens/login/controller/login_state.dart';
import 'package:newf/features/screens/main_navigation/controller/main_navigation_cubit.dart';
import 'package:newf/features/screens/main_navigation/ui/main_navigation/widgets/custom_bottom_nav_bar.dart';
import 'package:newf/features/screens/notifications/ui/notifications/notifications_screen.dart';
import 'package:newf/features/screens/notifications/controller/notifications_cubit.dart';
 import 'package:newf/features/screens/profile/ui/profile/profile_screen.dart';
import 'package:newf/features/screens/requests/ui/requests/requests_screen.dart';
 import '../../../../../core/notification_helper/fcm_handler.dart';
import '../../../login/controller/login_cubit.dart';
import '../../../notifications/data/model/send_fcm_parameter.dart';

part 'main_navigation_base_state.dart';

@RoutePage()
class MainNavigationPage extends StatefulWidget implements AutoRouteWrapper {
  const MainNavigationPage({super.key, required this.args});
  final MainNavigationRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainNavigationCubit>(
          create: (context) => AppLocator()()(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => AppLocator()()(),
        ),
        BlocProvider<NotificationsCubit>(
          create: (context) => AppLocator()()(),
        ),
      ],
      child: this,
    );
  }

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends MainNavigationPageBaseState {
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(args: HomeRouteArgs()).wrappedRoute(context),
        NotificationsPage(args: NotificationsRouteArgs(
          notificationsCubit
      )).wrappedRoute(context),
      const RequestsPage(args: RequestsRouteArgs()).wrappedRoute(context),
       ProfilePage(args: ProfileRouteArgs(
        LoginCubit.get(context: context),
      )).wrappedRoute(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => current is GetProfileState,
      builder: (context, loginState) {
        if (loginState is GetProfileState) {
          if (loginState.baseEmit is Loading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (loginState.baseEmit is ErrorState) {
            final failure = (loginState.baseEmit as ErrorState).failure;
            return Scaffold(

              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: AppSizes.s16,
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        color: AppColors.notificationRed,
                        size: AppSizes.s48,
                      ),
                      Text(
                        failure.message,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font14Regular,
                      ),
                      ElevatedButton(
                        onPressed: () => loginCubit.getProfileFunc(Reload()),
                        child: const Text('إعادة المحاولة'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }

        return BlocBuilder<MainNavigationCubit, MainNavigationState>(
          builder: (context, state) {
            final selectedIndex = state is MainNavigationLoaded ? state.selectedIndex : 0;
            // final isManagerTabSelected = selectedIndex == 3;

            return Scaffold(
              extendBody: true,
              floatingActionButton: kDebugMode?
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: FloatingActionButton(onPressed:() async {
                  notificationsCubit.setFcmTokenIntoDBFunc(
                      SendFcmParameter(userId: StorageHelper.userData!.id.toString(),
                          fcmToken:await FcmHandler.fcmToken()??''));
                },
                  child: Icon(Icons.add),
                ),
              ):null
              ,
              body: IndexedStack(
                index: selectedIndex,
                children: _pages,
              ) ,
              bottomNavigationBar: CustomBottomNavBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  mainNavigationCubit.changeTab(index);
                  if(index==1){
                    notificationsCubit.getNotificationFunc(Reload());
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
