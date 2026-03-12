import 'package:flutter/material.dart';

import '../../core/utils/extensions.dart';
import '../../core/utils/pokemon_ability_color.dart';

class PokemonAbilityCard extends StatelessWidget {
  const PokemonAbilityCard({
    super.key,
    required this.name,
    required this.isHidden,
    required this.slot,
    this.typeColor,
  });

  final String name;
  final bool isHidden;
  final int slot;
  final Color? typeColor;

  @override
  Widget build(BuildContext context) {
    final badgeColor = PokemonAbilityColor.badgeColor(
      isHidden: isHidden,
      typeColor: typeColor,
    );

    final primaryTextColor = PokemonAbilityColor.primaryTextColor(typeColor);
    final secondaryTextColor = PokemonAbilityColor.secondaryTextColor(
      typeColor,
    );
    final badgeTextColor = PokemonAbilityColor.badgeTextColor(badgeColor);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: PokemonAbilityColor.backgroundGradient(typeColor),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: PokemonAbilityColor.borderColor(typeColor)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toCamelCaseWords(),
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Slot $slot',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.92),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              isHidden ? 'Hidden' : 'Normal',
              style: TextStyle(
                color: badgeTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
