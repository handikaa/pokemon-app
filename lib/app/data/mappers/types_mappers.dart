import 'package:pokemon_app/app/data/mappers/ability_mapper.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/ability_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/type_element_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/type_element_entity.dart';

extension TypesMappers on TypeElementModel {
  TypeElementEntity toEntity() {
    return TypeElementEntity(
      type: (type ?? AbilityModel.empty()).toEntity(),
      slot: slot ?? 0,
    );
  }
}
