import 'package:flutter/material.dart';
import 'package:pokemon_app/app/core/utils/pokemon_type_color.dart';

import '../../core/utils/extensions.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: PokemonTypeColor.fromType(type),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        type.toCamelCaseWords(),
        style: TextStyle(
          color: PokemonTypeColor.foregroundFromType(type),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
