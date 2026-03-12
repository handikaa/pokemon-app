import 'package:pokemon_app/app/data/mappers/other_mappers.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/other_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/sprites_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/other_entity.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/sprites_entity.dart';

extension SpritesModelMapper on SpritesModel {
  SpritesEntity toEntity() {
    return SpritesEntity(
      backDefault: backDefault ?? '',
      backFemale: backFemale,
      backShiny: backShiny ?? '',
      backShinyFemale: backShinyFemale,
      frontDefault: frontDefault ?? '',
      frontFemale: frontFemale,
      frontShiny: frontShiny ?? '',
      frontShinyFemale: frontShinyFemale,
      other: (other ?? OtherModel.empty()).toEntity(),
    );
  }

  SpritesEntity toEntityWithoutOther() {
    return SpritesEntity(
      backDefault: backDefault ?? '',
      backFemale: backFemale,
      backShiny: backShiny ?? '',
      backShinyFemale: backShinyFemale,
      frontDefault: frontDefault ?? '',
      frontFemale: frontFemale,
      frontShiny: frontShiny ?? '',
      frontShinyFemale: frontShinyFemale,
      other: OtherEntity.empty(),
    );
  }
}
