import 'package:pokemon_app/app/data/mappers/ability_mapper.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/ability_element_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/ability_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/ability_element_entity.dart';

extension AbilityElementModelMapper on AbilityElementModel {
  AbilityElementEntity toEntity() {
    return AbilityElementEntity(
      ability: (ability ?? AbilityModel.empty()).toEntity(),
      isHidden: isHidden ?? false,
      slot: slot ?? 0,
    );
  }
}
