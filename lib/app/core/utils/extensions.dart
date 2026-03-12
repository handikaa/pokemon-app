import 'dart:ui';

import 'package:pokemon_app/app/domain/entities/pokemon_entity/stats_element_entity.dart';

extension StringExt on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension StringCasingExtension on String {
  String toCamelCaseWords() {
    if (trim().isEmpty) return this;

    return split(RegExp(r'[_\-\s]+'))
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }
}

extension IterableExt<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

extension PokemonStatsExtension on StatsElementEntity {
  String get displayName {
    switch (stat.name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      case 'special-attack':
        return 'Sp. Atk';
      case 'special-defense':
        return 'Sp. Def';
      case 'speed':
        return 'Speed';
      default:
        return stat.name;
    }
  }

  int get displayValue => baseStat;

  double get progressValue {
    final value = baseStat / 100;
    return value.clamp(0.0, 1.0);
  }

  Color get progressColor {
    return baseStat < 50 ? const Color(0xFFE57373) : const Color(0xFF66D36E);
  }
}

extension PokemonStatsListExtension on List<StatsElementEntity> {
  List<StatsElementEntity> get sortedForDisplay {
    const order = {
      'hp': 0,
      'attack': 1,
      'defense': 2,
      'special-attack': 3,
      'special-defense': 4,
      'speed': 5,
    };

    final items = [...this];
    items.sort((a, b) {
      final aOrder = order[a.stat.name] ?? 999;
      final bOrder = order[b.stat.name] ?? 999;
      return aOrder.compareTo(bOrder);
    });
    return items;
  }
}
