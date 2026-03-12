import 'package:flutter/material.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/stats_element_entity.dart';

import '../../core/utils/extensions.dart';

class PokemonStatItem extends StatelessWidget {
  const PokemonStatItem({super.key, required this.stat});

  final StatsElementEntity stat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              stat.stat.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              '${stat.baseStat}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: stat.progressValue,
                minHeight: 8,
                backgroundColor: const Color(0xFF2A2A2A),
                valueColor: AlwaysStoppedAnimation<Color>(stat.progressColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
