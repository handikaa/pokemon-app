import 'package:pokemon_app/app/data/models/pokemon_model/ability_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/ability_entity.dart';

extension AbilityModelMapper on AbilityModel {
  AbilityEntity toEntity() {
    return AbilityEntity(name: name ?? '', url: url ?? '');
  }
}
