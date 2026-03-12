import 'package:flutter/material.dart';

class PokemonTypeColor {
  PokemonTypeColor._();

  static Color fromType(String type) {
    switch (type.toLowerCase()) {
      case 'normal':
        return const Color(0xFFA8A77A);
      case 'fighting':
        return const Color(0xFFC22E28);
      case 'flying':
        return const Color(0xFFA98FF3);
      case 'poison':
        return const Color(0xFFA33EA1);
      case 'ground':
        return const Color(0xFFE2BF65);
      case 'rock':
        return const Color(0xFFB6A136);
      case 'bug':
        return const Color(0xFFA6B91A);
      case 'ghost':
        return const Color(0xFF735797);
      case 'steel':
        return const Color(0xFFB7B7CE);
      case 'fire':
        return const Color(0xFFEE8130);
      case 'water':
        return const Color(0xFF6390F0);
      case 'grass':
        return const Color(0xFF7AC74C);
      case 'electric':
        return const Color(0xFFF7D02C);
      case 'psychic':
        return const Color(0xFFF95587);
      case 'ice':
        return const Color(0xFF96D9D6);
      case 'dragon':
        return const Color(0xFF6F35FC);
      case 'dark':
        return const Color(0xFF705746);
      case 'fairy':
        return const Color(0xFFD685AD);
      case 'stellar':
        return const Color(0xFF446DFF);
      case 'unknown':
        return const Color(0xFF9E9E9E);
      default:
        return const Color(0xFFBDBDBD);
    }
  }

  static Color foregroundFromType(String type) {
    final background = fromType(type);
    final brightness = ThemeData.estimateBrightnessForColor(background);

    return brightness == Brightness.dark ? Colors.white : Colors.black87;
  }

  static LinearGradient gradientFromType(String type) {
    final base = fromType(type);

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [_lighten(base, 0.12), _darken(base, 0.08)],
    );
  }

  static Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  static Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return darkened.toColor();
  }
}
