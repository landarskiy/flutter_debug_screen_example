import 'package:debug_bricks_ui/debug_bricks_ui.dart';
import 'package:debug_screen_example/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/locale_keys.g.dart';
import '../theme/theme_mode_provider.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/$subRoute';
  static const subRoute = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Column(
                children: [
                  _buildThemeButton(context),
                  TextBrick(
                    title: LocaleKeys.settings_profile.tr(),
                    infoIconData: Icons.account_circle,
                  ),
                  TextBrick(
                    title: LocaleKeys.settings_account.tr(),
                    infoIconData: Icons.account_balance,
                  ),
                  TextBrick(
                    title: LocaleKeys.settings_documents.tr(),
                    infoIconData: Icons.file_present_sharp,
                  ),
                ],
              ),
            ),
            if (kDebugMode)
              Card(
                child: Column(
                  children: [
                    TextBrick(
                      title: LocaleKeys.settings_debug.tr(),
                      infoIconData: Icons.bug_report,
                      onTap: () {
                        context.goDebugSettings();
                      },
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeButton(BuildContext context) {
    final themeProvider = Provider.of<ThemeModeProvider>(context);
    final brightness = themeProvider.getBrightness(context);
    if (brightness == Brightness.light) {
      return TextBrick(
        infoIconData: Icons.dark_mode,
        title: LocaleKeys.settings_theme_to_dark.tr(),
        onTap: () {
          themeProvider.themeMode = ThemeMode.dark;
        },
      );
    } else {
      return TextBrick(
        infoIconData: Icons.light_mode,
        title: LocaleKeys.settings_theme_to_light.tr(),
        onTap: () {
          themeProvider.themeMode = ThemeMode.light;
        },
      );
    }
  }
}
