import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../shared/constants.dart';

ThemeData theming(ThemeMode mode) {
  ColorPalette colorPalette;
  switch (mode) {
    case ThemeMode.light:
      colorPalette = ColorPalette.light();
      break;
    case ThemeMode.dark:
    default:
      colorPalette = ColorPalette.dark();
  }

  return ThemeData(
    fontFamily: kFontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    colorScheme: ColorScheme(
      brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
      primary: colorPalette.primary,
      onPrimary: colorPalette.onPrimary,
      secondary: colorPalette.secondary,
      onSecondary: colorPalette.onSecondary,
      tertiary: colorPalette.tertiary,
      onTertiary: colorPalette.onTertiary,
      surface: colorPalette.surface,
      onSurface: colorPalette.onSurface,
      error: colorPalette.error,
      onError: colorPalette.error,
      shadow: colorPalette.shadow,
      outline: colorPalette.outline,
      surfaceTint: Colors.transparent,
    ),
    dialogBackgroundColor: colorPalette.scaffold,
    canvasColor: colorPalette.surface,
    primaryColor: colorPalette.primary,
    dividerColor: colorPalette.divider,
    brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    shadowColor: colorPalette.shadow,
    scaffoldBackgroundColor: colorPalette.scaffold,
    cardColor: colorPalette.card,
    hintColor: colorPalette.hint,
    disabledColor: colorPalette.disable,
    iconTheme: IconThemeData(
      color: colorPalette.icon,
      size: 24,
    ),
    appBarTheme: const AppBarTheme().copyWith(
      color: colorPalette.scaffold,
      shadowColor: colorPalette.shadow,
      foregroundColor: colorPalette.icon,
      surfaceTintColor: Colors.transparent,
      elevation: 1,
      centerTitle: true,
      iconTheme: IconThemeData(color: colorPalette.icon),
      actionsIconTheme: IconThemeData(color: colorPalette.icon),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: colorPalette.headline,
      ),
    ),
    cardTheme: const CardTheme().copyWith(
      clipBehavior: Clip.antiAlias,
      color: colorPalette.card,
      surfaceTintColor: Colors.transparent,
      shadowColor: colorPalette.shadow,
      elevation: 8,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    snackBarTheme: const SnackBarThemeData().copyWith(
      backgroundColor: colorPalette.surface,
      contentTextStyle: TextStyle(
        fontSize: 14,
        height: 1.43,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      elevation: 2,
      actionTextColor: colorPalette.paragraph,
    ),
    chipTheme: const ChipThemeData().copyWith(
      backgroundColor: colorPalette.disable,
      selectedColor: colorPalette.primary,
      labelPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      labelStyle: TextStyle(
        fontSize: 14,
        color: colorPalette.headline,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorPalette.surface,
      elevation: 4,
      selectedIconTheme: IconThemeData(color: colorPalette.headline),
      unselectedIconTheme: IconThemeData(color: colorPalette.subtitle),
      unselectedItemColor: colorPalette.subtitle,
      selectedItemColor: colorPalette.headline,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        height: 1.8,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        height: 1.8,
      ),
    ),
    textTheme: const TextTheme().copyWith(
      headlineLarge: TextStyle(
        fontSize: 28,
        height: 1.29,
        color: colorPalette.headline,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        height: 1.33,
        color: colorPalette.headline,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        height: 1,
        color: colorPalette.headline,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        color: colorPalette.headline,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 1,
        color: colorPalette.headline,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        height: 1.43,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 13,
        height: 1.5,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        height: 1.33,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        height: 1.4,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.5,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.43,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        height: 1.33,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
