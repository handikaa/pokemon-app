import 'package:pokemon_app/app/domain/entities/pokemon_entity/ability_entity.dart';

class StatsElementEntity {
  final int baseStat;
  final int effort;
  final AbilityEntity stat;

  StatsElementEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}
