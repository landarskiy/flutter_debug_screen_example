// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "app_name": "Пример Debug экрана",
  "language": "Язык",
  "settings": "Настройки",
  "settings_theme_to_dark": "Переключиться на тёмную",
  "settings_theme_to_light": "Переключиться на светлую",
  "settings_profile": "Профиль",
  "settings_account": "Счёт",
  "settings_documents": "Документы",
  "settings_debug": "Debug настройки",
  "localizations_title": "Ключи",
  "localizations_table_column_key": "Ключ",
  "localizations_table_column_value": "Значение"
};
static const Map<String,dynamic> en = {
  "app_name": "Debug Screen Demo",
  "language": "Language",
  "settings": "Settings",
  "settings_theme_to_dark": "Switch to dark",
  "settings_theme_to_light": "Switch to light",
  "settings_profile": "Profile",
  "settings_account": "Account",
  "settings_documents": "Documents",
  "settings_debug": "Debug settings",
  "localizations_title": "Keys",
  "localizations_table_column_key": "Key",
  "localizations_table_column_value": "Value"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
