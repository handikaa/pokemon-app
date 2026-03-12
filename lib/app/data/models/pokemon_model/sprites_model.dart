import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/other_model.dart';

class SpritesModel extends Equatable {
  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
  final OtherModel? other;

  const SpritesModel({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  factory SpritesModel.empty() {
    return const SpritesModel(
      backDefault: '',
      backFemale: null,
      backShiny: '',
      backShinyFemale: null,
      frontDefault: '',
      frontFemale: null,
      frontShiny: '',
      frontShinyFemale: null,
      other: null,
    );
  }

  factory SpritesModel.fromRawJson(String str) =>
      SpritesModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
    backDefault: json['back_default'] as String?,
    backFemale: json['back_female'],
    backShiny: json['back_shiny'] as String?,
    backShinyFemale: json['back_shiny_female'],
    frontDefault: json['front_default'] as String?,
    frontFemale: json['front_female'],
    frontShiny: json['front_shiny'] as String?,
    frontShinyFemale: json['front_shiny_female'],
    other: json['other'] == null
        ? null
        : OtherModel.fromJson(json['other'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'back_default': backDefault,
    'back_female': backFemale,
    'back_shiny': backShiny,
    'back_shiny_female': backShinyFemale,
    'front_default': frontDefault,
    'front_female': frontFemale,
    'front_shiny': frontShiny,
    'front_shiny_female': frontShinyFemale,
    'other': other?.toJson(),
  };

  @override
  List<Object?> get props => [
    backDefault,
    backFemale,
    backShiny,
    backShinyFemale,
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale,
    other,
  ];
}
