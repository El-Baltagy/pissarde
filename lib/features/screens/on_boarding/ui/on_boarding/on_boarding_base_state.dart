part of 'on_boarding_screen.dart';

abstract class OnBoardingPageBaseState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    animationController.animateTo(0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onSkipClick() {
    animationController.animateTo(
      0.8,
      duration: const Duration(milliseconds: 800),
    );
  }

  void onBackClick() {
    final val = animationController.value;
    if (val > 0.8) {
      animationController.animateTo(0.6, duration: const Duration(milliseconds: 600));
    } else if (val > 0.6) {
      animationController.animateTo(0.4, duration: const Duration(milliseconds: 600));
    } else if (val > 0.4) {
      animationController.animateTo(0.2, duration: const Duration(milliseconds: 600));
    } else if (val > 0.2) {
      animationController.animateTo(0.0, duration: const Duration(milliseconds: 600));
    }
  }

  void onNextClick() {
    final val = animationController.value;
    if (val >= 0.0 && val <= 0.2) {
      animationController.animateTo(0.4, duration: const Duration(milliseconds: 600));
    } else if (val > 0.2 && val <= 0.4) {
      animationController.animateTo(0.6, duration: const Duration(milliseconds: 600));
    } else if (val > 0.4 && val <= 0.6) {
      animationController.animateTo(0.8, duration: const Duration(milliseconds: 600));
    } else if (val > 0.6) {
      onCompleteOnBoarding();
    }
  }

  Future<void> onCompleteOnBoarding() async {
    try {
      await HiveStorage().writeData(AppConstant.onboardingKeyCash, true,
      boxName: HiveStorage().secBoxName
      );
    } catch (_) {}

    if (mounted) {
      appRouter.replaceAll([const LoginRoute()]);
    }
  }
}
