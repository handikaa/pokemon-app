import 'package:flutter/material.dart';

class PokemonAbilityColor {
  PokemonAbilityColor._();

  static Color badgeColor({required bool isHidden, Color? typeColor}) {
    if (isHidden) {
      return const Color(0xFF7C4DFF);
    }

    return typeColor ?? const Color(0xFF607D8B);
  }

  static Color iconBackground(Color? typeColor) {
    final base = typeColor ?? const Color(0xFF78909C);
    return _lighten(base, 0.10).withValues(alpha: 0.22);
  }

  static Color borderColor(Color? typeColor) {
    final base = typeColor ?? Colors.white;
    return base.withValues(alpha: 0.22);
  }

  static Color cardBackground(Color? typeColor) {
    final base = typeColor ?? const Color(0xFF546E7A);
    return _darken(base, 0.28).withValues(alpha: 0.22);
  }

  static LinearGradient backgroundGradient(Color? typeColor) {
    final base = typeColor ?? const Color(0xFF546E7A);

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        _lighten(base, 0.04).withValues(alpha: 0.28),
        _darken(base, 0.18).withValues(alpha: 0.18),
      ],
    );
  }

  static Color primaryTextColor(Color? typeColor) {
    final base = typeColor ?? const Color(0xFF546E7A);
    final brightness = ThemeData.estimateBrightnessForColor(base);

    return brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF1A1A1A);
  }

  static Color secondaryTextColor(Color? typeColor) {
    final primary = primaryTextColor(typeColor);
    return primary.withValues(alpha: 0.72);
  }

  static Color badgeTextColor(Color badgeColor) {
    final brightness = ThemeData.estimateBrightnessForColor(badgeColor);

    return brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF1A1A1A);
  }

  static Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  static Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
