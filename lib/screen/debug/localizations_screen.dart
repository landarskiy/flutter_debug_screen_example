import 'package:debug_bricks_easy_localization/debug_bricks_easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/codegen_loader.g.dart';
import '../../generated/locale_keys.g.dart';

class LocalizationsScreen extends StatelessWidget {

  static const route = '/$subRoute';
  static const subRoute = 'localizationsScreen';

  const LocalizationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.localizations_title.tr()),
      ),
      body: LocalizationsTable(
        mapLocales: CodegenLoader.mapLocales,
        resourcesProvider: AppResourcesProvider(),
      ),
    );
  }
}

class AppResourcesProvider extends ResourcesProvider {
  @override
  String get titleKey => LocaleKeys.localizations_table_column_key.tr();

  @override
  String get titleValue => LocaleKeys.localizations_table_column_value.tr();
}
