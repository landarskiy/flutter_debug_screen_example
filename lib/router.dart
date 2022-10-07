import 'package:debug_screen_example/main.dart';
import 'package:debug_screen_example/screen/debug/debug_settings_screen.dart';
import 'package:debug_screen_example/screen/debug/localizations_screen.dart';
import 'package:debug_screen_example/screen/debug/logs_screen.dart';
import 'package:debug_screen_example/screen/main_screen.dart';
import 'package:debug_screen_example/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

GoRouter? _router;

GoRouter buildMainRoutes() {
  var router = _router;
  if (router != null) {
    return router;
  }
  router = GoRouter(
    routes: [
      GoRoute(
        path: MainScreen.route,
        builder: (context, state) {
          _logNavigation(MainScreen.route);
          return const MainScreen(title: "Demo");
        },
        routes: [
          GoRoute(
            path: SettingsScreen.subRoute,
            builder: (context, state) {
              _logNavigation(SettingsScreen.route);
              return const SettingsScreen();
            },
            routes: [
              GoRoute(
                path: DebugSettingsScreen.subRoute,
                builder: (context, state) {
                  _logNavigation(DebugSettingsScreen.route);
                  return const DebugSettingsScreen();
                },
                routes: [
                  GoRoute(
                    path: LocalizationsScreen.subRoute,
                    builder: (context, state) {
                      _logNavigation(LocalizationsScreen.route);
                      return const LocalizationsScreen();
                    },
                  ),
                  GoRoute(
                    path: LogsScreen.subRoute,
                    builder: (context, state) {
                      _logNavigation(LogsScreen.route);
                      final theme = Theme.of(context);
                      return LogsScreen(
                        theme: TalkerScreenTheme(
                          backgroudColor: theme.colorScheme.background,
                          textColor: theme.colorScheme.onBackground,
                          iconsColor: theme.colorScheme.primary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );
  _router = router;
  return router;
}

_logNavigation(String destination) {
  logger.info("Navigate to $destination");
}

extension GoRouterExtension on BuildContext {
  goSettings() {
    go(SettingsScreen.route);
  }

  goDebugSettings() {
    go(SettingsScreen.route + DebugSettingsScreen.route);
  }

  goLocalizationsScreen() {
    go(SettingsScreen.route +
        DebugSettingsScreen.route +
        LocalizationsScreen.route);
  }

  goLogsScreen() {
    go(SettingsScreen.route + DebugSettingsScreen.route + LogsScreen.route);
  }
}
