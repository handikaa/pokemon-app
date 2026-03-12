import 'package:pokemon_app/app/data/mappers/dream_world_mappers.dart';
import 'package:pokemon_app/app/data/mappers/home_mappers.dart';
import 'package:pokemon_app/app/data/mappers/official_artwork_entity.dart';
import 'package:pokemon_app/app/data/mappers/sprites_mapper.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/dream_world_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/home_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/official_artwork_model.dart';

import 'package:pokemon_app/app/data/models/pokemon_model/other_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/sprites_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/other_entity.dart';

extension OtherModelMapper on OtherModel {
  OtherEntity toEntity() {
    return OtherEntity(
      dreamWorld: (dreamWorld ?? DreamWorldModel.empty()).toEntity(),
      home: (home ?? HomeModel.empty()).toEntity(),
      officialArtwork: (officialArtwork ?? OfficialArtworkModel.empty())
          .toEntity(),
      showdown: (showdown ?? SpritesModel.empty()).toEntityWithoutOther(),
    );
  }
}
