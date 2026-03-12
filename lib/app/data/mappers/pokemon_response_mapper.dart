import 'package:pokemon_app/app/data/mappers/ability_element_mapper.dart';
import 'package:pokemon_app/app/data/mappers/sprites_mapper.dart';
import 'package:pokemon_app/app/data/mappers/stats_mappers.dart';
import 'package:pokemon_app/app/data/mappers/types_mappers.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/pokemon_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/pokemon_response_entity.dart';

import '../models/pokemon_model/sprites_model.dart';

extension PokemonResponseModelMapper on PokemonResponseModel {
  PokemonResponseEntity toEntity() {
    return PokemonResponseEntity(
      id: id ?? 0,
      name: name ?? '',
      abilities: abilities?.map((e) => e.toEntity()).toList() ?? [],
      statsEntity: statElement?.map((e) => e.toEntity()).toList() ?? [],
      typesEntity: typeModel?.map((e) => e.toEntity()).toList() ?? [],
      sprites: (sprites ?? SpritesModel.empty()).toEntity(),
    );
  }
}
