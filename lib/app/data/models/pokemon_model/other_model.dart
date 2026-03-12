import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/dream_world_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/home_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/official_artwork_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/sprites_model.dart';

class OtherModel extends Equatable {
  final DreamWorldModel? dreamWorld;
  final HomeModel? home;
  final OfficialArtworkModel? officialArtwork;
  final SpritesModel? showdown;

  const OtherModel({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
    this.showdown,
  });

  factory OtherModel.empty() {
    return const OtherModel(
      dreamWorld: null,
      home: null,
      officialArtwork: null,
      showdown: null,
    );
  }

  factory OtherModel.fromRawJson(String str) =>
      OtherModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
    dreamWorld: json['dream_world'] == null
        ? null
        : DreamWorldModel.fromJson(json['dream_world'] as Map<String, dynamic>),
    home: json['home'] == null
        ? null
        : HomeModel.fromJson(json['home'] as Map<String, dynamic>),
    officialArtwork: json['official-artwork'] == null
        ? null
        : OfficialArtworkModel.fromJson(
            json['official-artwork'] as Map<String, dynamic>,
          ),
    showdown: json['showdown'] == null
        ? null
        : SpritesModel.fromJson(json['showdown'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'dream_world': dreamWorld?.toJson(),
    'home': home?.toJson(),
    'official-artwork': officialArtwork?.toJson(),
    'showdown': showdown?.toJson(),
  };

  @override
  List<Object?> get props => [dreamWorld, home, officialArtwork, showdown];
}
