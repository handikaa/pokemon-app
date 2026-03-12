import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  const HomeModel({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory HomeModel.empty() {
    return const HomeModel(
      frontDefault: '',
      frontFemale: null,
      frontShiny: '',
      frontShinyFemale: null,
    );
  }

  factory HomeModel.fromRawJson(String str) =>
      HomeModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    frontDefault: json['front_default'] as String?,
    frontFemale: json['front_female'],
    frontShiny: json['front_shiny'] as String?,
    frontShinyFemale: json['front_shiny_female'],
  );

  Map<String, dynamic> toJson() => {
    'front_default': frontDefault,
    'front_female': frontFemale,
    'front_shiny': frontShiny,
    'front_shiny_female': frontShinyFemale,
  };

  @override
  List<Object?> get props => [
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale,
  ];
}
