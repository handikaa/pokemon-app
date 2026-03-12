import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';

class PokemonColorUtils {
  const PokemonColorUtils._();

  static const Color fallbackColor = Color(0xFFD1D5DB);

  static Future<Color> generateCardColorFromImage(
    ImageProvider imageProvider,
  ) async {
    try {
      final palette = await PaletteGeneratorMaster.fromImageProvider(
        imageProvider,
      );

      final dominantColor = palette.dominantColor?.color;
      if (dominantColor == null) return fallbackColor;

      return _brightenForCard(dominantColor);
    } catch (_) {
      return fallbackColor;
    }
  }

  static Color _brightenForCard(Color color) {
    final hsl = HSLColor.fromColor(color);

    final adjusted = hsl
        .withLightness((hsl.lightness + 0.08).clamp(0.0, 1.0))
        .withSaturation((hsl.saturation * 0.9).clamp(0.0, 1.0));

    return adjusted.toColor();
  }
}
