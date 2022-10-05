import 'package:debug_screen_example/router.dart';
import 'package:debug_screen_example/theme/app_theme.dart';
import 'package:debug_screen_example/theme/theme_mode_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';
import 'generated/locale_keys.g.dart';

const langEn = Locale('en');
const langRu = Locale('ru');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
      supportedLocales: const [langEn, langRu],
      path: 'assets/translations',
      saveLocale: false,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      fallbackLocale: langEn,
      child: const DemoApp(),
    ),
  );
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeConsumer = Consumer<ThemeModeProvider>(
      builder: (context, themeProvider, _) {
        return _buildApp(context, themeProvider);
      },
    );
    return _buildRootProviders(themeConsumer);
  }

  Widget _buildApp(BuildContext context, ThemeModeProvider provider) {
    return MaterialApp.router(
      title: LocaleKeys.app_name.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: provider.themeMode,
      routerConfig: buildMainRoutes(),
    );
  }

  Widget _buildRootProviders(Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModeProvider>(
          create: (_) => ThemeModeProvider(),
        ),
      ],
      child: child,
    );
  }
}
