import 'package:pokemon_app/app/data/models/pokemon_model/ability_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/stats_element_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/stats_element_entity.dart';
import 'package:pokemon_app/app/data/mappers/ability_mapper.dart';

extension StatsMappers on StatsElementModel {
  StatsElementEntity toEntity() {
    return StatsElementEntity(
      baseStat: baseStat ?? 0,
      effort: effort ?? 0,
      stat: (stat ?? AbilityModel.empty()).toEntity(),
    );
  }
}
