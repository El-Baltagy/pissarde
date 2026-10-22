import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newf/core/shared/methods/print.dart';

class CodegenLoader extends RootBundleAssetLoader {
  CodegenLoader._internal();

  static final CodegenLoader _instance = CodegenLoader._internal();

  factory CodegenLoader() => _instance;

  final Map<String, Map<String, dynamic>> _cache = {};

  static const String assetTranslationsPath = 'assets/l10n';
  static Locale get fallBackLocale => const Locale('ar');
  static List<Locale> supportedLocales = [const Locale('ar'), const Locale('en')];

  Locale _currentLocale = const Locale('ar');
  Locale get currentLocale => _currentLocale;

  void setLocale(Locale locale) {
    _currentLocale = locale;
  }

  static Future<void> init() async {
    try {
      final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final localeFiles = assetManifest.listAssets()
          .where(
            (path) =>
                path.startsWith('$assetTranslationsPath/') &&
                path.endsWith('.json'),
          )
          .toList();

      if (localeFiles.isNotEmpty) {
        supportedLocales = localeFiles.map((filePath) {
          final fileName = filePath.split('/').last;
          final localeCode = fileName.split('_').last.replaceAll('.json', '');
          return Locale(localeCode);
        }).toList();
      }
    } catch (e) {
      PrintHelper().ordinaryPrint('Error loading asset manifest: $e');
    }
    if (!supportedLocales.any((l) => l.languageCode == 'ar')) {
      supportedLocales.add(const Locale('ar'));
    }
    if (!supportedLocales.any((l) => l.languageCode == 'en')) {
      supportedLocales.add(const Locale('en'));
    }
    
    // Set default locale via singleton instance
    _instance.setLocale(const Locale('ar'));
  }

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final localeKey = locale.languageCode;

    if (_cache.containsKey(localeKey)) {
      return _cache[localeKey]!;
    }

    final jsonString = await rootBundle.loadString(
      '$assetTranslationsPath/app_$localeKey.json',
    );

    final Map<String, dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _cache[localeKey] = jsonMap;
    return jsonMap;
  }
}
