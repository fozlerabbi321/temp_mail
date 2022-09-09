import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/constants.dart';
import '../utils/lang/bn_bd.dart';
import '../utils/lang/en_us.dart';

class LocalizationHelper extends Translations {
  /// flag start here ///
  static const String bdFlag = '${Constants.kImageDir}bangladesh.png';
  static const String usaFlag = '${Constants.kImageDir}us.png';

  /// flag start end here ///
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final List<Map> langs = [
    {
      'name': 'English',
      'flag': usaFlag,
    },
    {
      'name': 'Bangla',
      'flag': bdFlag,
    }
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('bn', 'BD'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // language/en_us.dart
        'bn_BD': bnBD, // language/bn_bd.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang)!;

    final box = GetStorage();
    box.write('lng', lang);

    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? getLocaleFromLanguage(String? lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]['name']) return locales[i];
    }
    return Get.locale;
  }

  Locale? getCurrentLocale() {
    final box = GetStorage();
    Locale? defaultLocale;

    if (box.read('lng') != null) {
      final locale = LocalizationHelper().getLocaleFromLanguage(box.read('lng'));
      defaultLocale = locale;
    } else {
      defaultLocale = const Locale(
        'en',
        'US',
      );
    }

    return defaultLocale;
  }

  String? getCurrentLang() {
    final box = GetStorage();

    return box.read('lng') ?? 'English';
  }
}
