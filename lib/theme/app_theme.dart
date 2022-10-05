import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color_schemes.dart';

ThemeData lightThemeData = buildThemeData(lightColorScheme);

ThemeData darkThemeData = buildThemeData(darkColorScheme);

ThemeData buildThemeData(ColorScheme colorScheme) {
  //https://m3.material.io/styles/color/the-color-system/color-roles
  //https://m3.material.io/styles/typography/type-scale-tokens
  const level2Elevation = 2.0;
  final surface2Color = ElevationOverlay.applySurfaceTint(
    colorScheme.surface,
    colorScheme.surfaceTint,
    level2Elevation,
  );
  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
  ).copyWith(
    appBarTheme: AppBarTheme(
      elevation: level2Elevation,
      backgroundColor: colorScheme.surface,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: colorScheme.brightness.inverse(),
        statusBarBrightness: colorScheme.brightness,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: level2Elevation,
      backgroundColor: surface2Color,
      type: BottomNavigationBarType.fixed,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimary;
        }
        return colorScheme.outline;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.surfaceVariant;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.surfaceVariant;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.surfaceVariant;
      }),
    ),
    listTileTheme: ListTileThemeData(iconColor: colorScheme.primary),
    chipTheme: ChipThemeData(
      backgroundColor: colorScheme.surfaceVariant,
      selectedColor: colorScheme.primary,
    ),
  );
}

extension BrightnessExtension on Brightness {
  Brightness inverse() {
    switch (this) {
      case Brightness.light:
        return Brightness.dark;
      case Brightness.dark:
        return Brightness.light;
    }
  }
}
