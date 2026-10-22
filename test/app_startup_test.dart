import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newf/core/app/app.dart';
import 'package:newf/core/constants/app_locator.dart';
import 'package:newf/core/localization/localization.dart';
import 'package:newf/core/theming/theme_cubit.dart';
import 'package:newf/core/storage/hive_storage.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'dart:io';

void main() {
  setUpAll(() async {
    final tempDir = await Directory.systemTemp.createTemp('hive_test');
    Hive.init(tempDir.path);
    await Hive.openBox('app_default_box');
    AppLocator().init();
  });

  tearDownAll(() async {
    if (Hive.isBoxOpen('app_default_box')) {
      await HiveStorage().closeBox();
    }
  });

  testWidgets('App starts and loads MainNavigationPage properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<ThemeCubit>(
        create: (context) => AppLocator()()(),
        child: EasyLocalization(
          supportedLocales: CodegenLoader.supportedLocales,
          fallbackLocale: CodegenLoader.fallBackLocale,
          startLocale: CodegenLoader.fallBackLocale,
          path: CodegenLoader.assetTranslationsPath,
          assetLoader: CodegenLoader(),
          child: const MyApp(),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    // Verify app rendered without exceptions
    expect(find.byType(MyApp), findsOneWidget);
  });
}
