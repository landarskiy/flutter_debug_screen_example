import 'package:debug_screen_example/screen/debug/debug_settings_screen.dart';
import 'package:debug_screen_example/screen/debug/localizations_screen.dart';
import 'package:debug_screen_example/screen/main_screen.dart';
import 'package:debug_screen_example/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        builder: (context, state) => const MainScreen(title: "Demo"),
        routes: [
          GoRoute(
            path: SettingsScreen.subRoute,
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: DebugSettingsScreen.subRoute,
                builder: (context, state) => const DebugSettingsScreen(),
                routes: [
                  GoRoute(
                    path: LocalizationsScreen.subRoute,
                    builder: (context, state) => const LocalizationsScreen(),
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
}
