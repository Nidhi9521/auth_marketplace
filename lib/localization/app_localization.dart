import 'dart:convert';

import 'package:auth_marketplace/core/utils/localization_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auth_marketplace/localization/localization_constants.dart';
import 'package:auth_marketplace/core/utils/failure.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static AppLocalizations? get instance => _AppLocalizationsDelegate.instance;

  Future<bool> load() async {
    final jsonString = await rootBundle
        .loadString("assets/locals/${locale.languageCode}.json");
    final Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  String getErrorMessage(
    APIErrorCode errorCode,
  ) {
    switch (errorCode) {
      case APIErrorCode.noInternetError:
        return translate(LocalizationKey.internetFailure);

      default:
        return translate(LocalizationKey.somethingWentWrong);
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  static AppLocalizations? instance;

  @override
  bool isSupported(Locale locale) =>
      LocalizationConstants.languages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    instance = localizations;
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
