import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../configs/app_settings.dart';

class ColorPalette {
  Color primary;
  Color onPrimary;
  Color secondary;
  Color onSecondary;
  Color background;
  Color onBackground;
  Color surface;
  Color onSurface;
  Color scaffold;
  Color card;
  Color active;
  Color inactive;
  Color shadow;
  Color icon;
  Color headline;
  Color paragraph;
  Color subtitle;
  Color hint;
  Color outline;
  Color divider;
  Color disable;
  Color error;
  Color onError;

  ColorPalette({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.scaffold,
    required this.card,
    required this.active,
    required this.inactive,
    required this.shadow,
    required this.icon,
    required this.headline,
    required this.paragraph,
    required this.subtitle,
    required this.hint,
    required this.outline,
    required this.divider,
    required this.disable,
    required this.error,
    required this.onError,
  });

  factory ColorPalette.light() => ColorPalette(
        primary: const Color(0xFF6200EE),
        onPrimary: const Color(0xFFFFFFFF),
        secondary: const Color(0xFF03DAC6),
        onSecondary: const Color(0xFF000000),
        background: const Color(0xFFFFFFFF),
        onBackground: const Color(0xFF000000),
        surface: const Color(0xFFFFFFFF),
        onSurface: const Color(0xFF000000),
        scaffold: const Color(0xFFFAFAFB),
        card: const Color(0xFFFFFFFF),
        active: const Color(0xFF12B76A),
        inactive: const Color(0xFFF79009),
        shadow: const Color(0x1A101828),
        icon: const Color(0xFF342E5E),
        headline: const Color(0xFF07003B),
        paragraph: const Color(0xFF342E5E),
        subtitle: const Color(0xFF6A6689),
        hint: const Color(0xFF797595),
        outline: const Color(0xFFC1BFCE),
        divider: const Color(0xFFEBEBEF),
        disable: const Color(0xFFC1BFCE),
        error: const Color(0xFFDC3545),
        onError: const Color(0xFFFFFFFF),
      );

  factory ColorPalette.dark() => ColorPalette(
        primary: const Color(0xFF08D9D6),
        onPrimary: const Color(0xFF000000),
        secondary: const Color(0xFF03DAC6),
        onSecondary: const Color(0xFF000000),
        background: const Color(0xFF1C1C1E),
        onBackground: const Color(0xFFFFFFFF),
        surface: const Color(0xFF121212),
        onSurface: const Color(0xFFFFFFFF),
        scaffold: const Color(0xFF000000),
        card: const Color(0xFF1C1C1E),
        active: const Color(0xFF12B76A),
        inactive: const Color(0xFFF79009),
        shadow: const Color(0x1AFFFFFF),
        icon: const Color(0xFFFFFFFF),
        headline: const Color(0xFFFFFFFF),
        paragraph: const Color(0xFFC1BFCE),
        subtitle: const Color(0xFFB2B0C2),
        hint: const Color(0xFF797595),
        outline: const Color(0xFF797595),
        divider: const Color(0xFFFFFFFF),
        disable: const Color(0xFF535353),
        error: const Color(0xFFDC3545),
        onError: const Color(0xFFFFFFFF),
      );

  static Color? alert(String? of,
      {Color? orElse, bool allowDefaultColor = true}) {
    switch (of) {
      case 'danger':
        return const Color(0xFFDC3545);
      case 'warning':
        return const Color(0xFFFF8F00);
      case 'success':
        return const Color(0xFF4BB543);
      default:
        return orElse ?? (allowDefaultColor ? const Color(0xFF9E9E9E) : null);
    }
  }

  static Color? field(String? of) {
    switch (of) {
      case 'activity':
      case 'steps':
        return const Color(0xFF8F00FF);
      case 'pills':
      case 'bolus':
        return const Color(0xFF3ABFC9);
      case 'basal':
        return const Color(0xFF12B76A);
      case 'bp':
        return const Color(0xFF4169E1);
      case 'weight':
        return const Color(0xFF800080);
      case 'carbs':
      case 'food':
        return const Color(0xFFE1B173);
      default:
        return null;
    }
  }

  factory ColorPalette.current() =>
      appSettings.isDarkTheme ? ColorPalette.dark() : ColorPalette.light();
}
