import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

/// Configuration for a single onboarding step rendered by [OnBoardingSlideWidget].
class OnBoardingSlideConfig {
  final String imagePath;
  final String titleKey;
  final String descriptionKey;
  final Interval? enterInterval;
  final Interval exitInterval;
  final Offset? enterOffsetOverride;
  final Offset? exitOffsetOverride;
  final double imageEnterMultiplier;
  final double imageExitMultiplier;
  final Offset? titleEnterOffsetOverride;
  final double titleEnterMultiplier;
  final double titleExitMultiplier;
  final double descriptionExitMultiplier;
  final bool isSplash;

  const OnBoardingSlideConfig({
    required this.imagePath,
    required this.titleKey,
    required this.descriptionKey,
    this.enterInterval,
    required this.exitInterval,
    this.enterOffsetOverride,
    this.exitOffsetOverride,
    this.imageEnterMultiplier = 0,
    this.imageExitMultiplier = 0,
    this.titleEnterOffsetOverride,
    this.titleEnterMultiplier = 0,
    this.titleExitMultiplier = 0,
    this.descriptionExitMultiplier = 0,
    this.isSplash = false,
  });
}

/// Reusable onboarding step widget supporting both the initial splash step
/// and animated feature slides with configurable parallax transitions.
class OnBoardingSlideWidget extends StatelessWidget {
  final AnimationController animationController;
  final OnBoardingSlideConfig config;

  const OnBoardingSlideWidget({
    super.key,
    required this.animationController,
    required this.config,
  });

  Animation<Offset> _buildOffsetAnimation({
    required Offset begin,
    required Offset end,
    required Interval interval,
  }) {
    return Tween<Offset>(begin: begin, end: end).animate(
      CurvedAnimation(parent: animationController, curve: interval),
    );
  }

  Widget _wrapWithSlides({
    required Widget child,
    Offset? enterBegin,
    Interval? enterInterval,
    Offset? exitEnd,
    Interval? exitInterval,
  }) {
    var result = child;
    if (exitEnd != null && exitInterval != null) {
      result = SlideTransition(
        position: _buildOffsetAnimation(
          begin: Offset.zero,
          end: exitEnd,
          interval: exitInterval,
        ),
        child: result,
      );
    }
    if (enterBegin != null && enterInterval != null) {
      result = SlideTransition(
        position: _buildOffsetAnimation(
          begin: enterBegin,
          end: Offset.zero,
          interval: enterInterval,
        ),
        child: result,
      );
    }
    return result;
  }

  Widget _buildImage() {
    if (config.isSplash) {
      return Container(
        width: 140,
        height: 140,
        padding: const EdgeInsets.all(AppPadding.p20),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryLightColor.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Image.asset(
          config.imagePath,
          fit: BoxFit.contain,
        ),
      );
    }

    return Container(
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Image.asset(
        config.imagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitle() {
    final text = Text(
      config.titleKey.tr(),
      textAlign: TextAlign.center,
      style: AppTextStyles.font24Bold.copyWith(
        color: AppColors.primaryLightColor,
      ),
    );

    if (config.isSplash) {
      return text;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: text,
    );
  }

  Widget _buildDescription() {
    final text = Text(
      config.descriptionKey.tr(),
      textAlign: TextAlign.center,
      style: AppTextStyles.font14Regular.copyWith(
        color: AppColors.lightTextSecondary,
        height: 1.6,
      ),
    );

    if (config.isSplash) {
      return text;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
      child: text,
    );
  }

  Widget _buildSplashButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p32),
      child: SizedBox(
        width: double.infinity,
        height: AppSizes.s56,
        child: ElevatedButton(
          onPressed: () {
            animationController.animateTo(
              0.2,
              duration: const Duration(milliseconds: 600),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryLightColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.r30),
            ),
          ),
          child: Text(
            'onboarding_lets_begin'.tr(),
            style: AppTextStyles.font16SemiBold.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  bool _isSlideVisible(double value) {
    if (config.isSplash) {
      return value < config.exitInterval.end;
    }
    final enterBegin = config.enterInterval?.begin ?? 0.0;
    return value > enterBegin && value < config.exitInterval.end;
  }

  Widget _visibilityGate(Widget child) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, builtChild) {
        if (!_isSlideVisible(animationController.value)) {
          return const SizedBox.shrink();
        }
        return builtChild!;
      },
      child: SizedBox.expand(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = context.locale.languageCode == 'ar';
    final defaultEnterOffset = isRtl ? const Offset(-1, 0) : const Offset(1, 0);
    final defaultExitOffset = isRtl ? const Offset(1, 0) : const Offset(-1, 0);

    final enterOffset = config.enterOffsetOverride ?? defaultEnterOffset;
    final exitOffset = config.exitOffsetOverride ?? defaultExitOffset;

    if (config.isSplash) {
      return _visibilityGate(
        _wrapWithSlides(
          exitEnd: exitOffset,
          exitInterval: config.exitInterval,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  _buildImage(),
                  AppSizes.s32.verticalSpace,
                  _buildTitle(),
                  AppSizes.s12.verticalSpace,
                  _buildDescription(),
                  const Spacer(),
                  _buildSplashButton(),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final imageWidget = _wrapWithSlides(
      enterBegin: config.imageEnterMultiplier > 0
          ? defaultEnterOffset * config.imageEnterMultiplier
          : null,
      enterInterval: config.enterInterval,
      exitEnd: config.imageExitMultiplier > 0
          ? exitOffset * config.imageExitMultiplier
          : null,
      exitInterval: config.exitInterval,
      child: _buildImage(),
    );

    final titleEnterBegin = config.titleEnterOffsetOverride ??
        (config.titleEnterMultiplier > 0
            ? defaultEnterOffset * config.titleEnterMultiplier
            : null);

    final titleWidget = _wrapWithSlides(
      enterBegin: titleEnterBegin,
      enterInterval: config.enterInterval,
      exitEnd: config.titleExitMultiplier > 0
          ? exitOffset * config.titleExitMultiplier
          : null,
      exitInterval: config.exitInterval,
      child: _buildTitle(),
    );

    final descriptionWidget = _wrapWithSlides(
      exitEnd: config.descriptionExitMultiplier > 0
          ? exitOffset * config.descriptionExitMultiplier
          : null,
      exitInterval: config.exitInterval,
      child: _buildDescription(),
    );

    return _visibilityGate(
      _wrapWithSlides(
        enterBegin: enterOffset,
        enterInterval: config.enterInterval,
        exitEnd: exitOffset,
        exitInterval: config.exitInterval,
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.s100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageWidget,
              AppSizes.s32.verticalSpace,
              titleWidget,
              AppSizes.s12.verticalSpace,
              descriptionWidget,
            ],
          ),
        ),
      ),
    );
  }
}
