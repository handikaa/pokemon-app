import 'package:pokemon_app/app/data/models/pokemon_model/official_artwork_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/official_artwork_entity.dart';

extension OfficialArtworkModelMapper on OfficialArtworkModel {
  OfficialArtworkEntity toEntity() {
    return OfficialArtworkEntity(
      frontDefault: frontDefault ?? '',
      frontShiny: frontShiny ?? '',
    );
  }
}
