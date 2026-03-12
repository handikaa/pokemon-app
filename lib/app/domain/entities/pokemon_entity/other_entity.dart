import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/dream_world_entity.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/home_entity.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/official_artwork_entity.dart';

import 'package:pokemon_app/app/domain/entities/pokemon_entity/sprites_entity.dart';

class OtherEntity extends Equatable {
  final DreamWorldEntity dreamWorld;
  final HomeEntity home;
  final OfficialArtworkEntity officialArtwork;
  final SpritesEntity showdown;

  const OtherEntity({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
    required this.showdown,
  });

  factory OtherEntity.empty() {
    return OtherEntity(
      dreamWorld: DreamWorldEntity.empty(),
      home: HomeEntity.empty(),
      officialArtwork: OfficialArtworkEntity.empty(),
      showdown: SpritesEntity.empty(withOther: false),
    );
  }

  @override
  List<Object?> get props => [dreamWorld, home, officialArtwork, showdown];
}
