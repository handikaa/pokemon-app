import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/ability_element_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/sprites_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/stats_element_model.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/type_element_model.dart';

class PokemonResponseModel extends Equatable {
  final int? id;
  final String? name;
  final List<AbilityElementModel>? abilities;
  final List<StatsElementModel>? statElement;
  final List<TypeElementModel>? typeModel;
  final SpritesModel? sprites;

  const PokemonResponseModel({
    this.id,
    this.name,
    this.abilities,
    this.sprites,
    this.statElement,
    this.typeModel,
  });

  factory PokemonResponseModel.empty() {
    return const PokemonResponseModel(
      id: 0,
      name: '',
      abilities: [],
      statElement: [],
      typeModel: [],
      sprites: null,
    );
  }

  factory PokemonResponseModel.fromRawJson(String str) =>
      PokemonResponseModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) =>
      PokemonResponseModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        abilities: json['abilities'] == null
            ? []
            : List<AbilityElementModel>.from(
                (json['abilities'] as List).map(
                  (x) =>
                      AbilityElementModel.fromJson(x as Map<String, dynamic>),
                ),
              ),
        statElement: json['stats'] == null
            ? []
            : List<StatsElementModel>.from(
                (json['stats'] as List).map(
                  (x) => StatsElementModel.fromJson(x as Map<String, dynamic>),
                ),
              ),
        typeModel: json['types'] == null
            ? []
            : List<TypeElementModel>.from(
                (json['types'] as List).map(
                  (x) => TypeElementModel.fromJson(x as Map<String, dynamic>),
                ),
              ),
        sprites: json['sprites'] == null
            ? null
            : SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'abilities': abilities == null
        ? []
        : List<dynamic>.from(abilities!.map((x) => x.toJson())),
    'stats': statElement == null
        ? []
        : List<dynamic>.from(statElement!.map((x) => x.toJson())),
    'types': typeModel == null
        ? []
        : List<dynamic>.from(typeModel!.map((x) => x.toJson())),
    'sprites': sprites?.toJson(),
  };

  @override
  List<Object?> get props => [
    id,
    name,
    abilities,
    sprites,
    statElement,
    typeModel,
  ];
}
