import 'package:pokemon_app/app/data/models/pokemon_model/dream_world_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/dream_world_entity.dart';

extension DreamWorldModelMapper on DreamWorldModel {
  DreamWorldEntity toEntity() {
    return DreamWorldEntity(
      frontDefault: frontDefault ?? '',
      frontFemale: frontFemale,
    );
  }
}
