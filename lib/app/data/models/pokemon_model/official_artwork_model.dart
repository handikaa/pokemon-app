import 'dart:convert';

import 'package:equatable/equatable.dart';

class OfficialArtworkModel extends Equatable {
  final String? frontDefault;
  final String? frontShiny;

  const OfficialArtworkModel({this.frontDefault, this.frontShiny});

  factory OfficialArtworkModel.empty() {
    return const OfficialArtworkModel(frontDefault: '', frontShiny: '');
  }

  factory OfficialArtworkModel.fromRawJson(String str) =>
      OfficialArtworkModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkModel(
        frontDefault: json['front_default'] as String?,
        frontShiny: json['front_shiny'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'front_default': frontDefault,
    'front_shiny': frontShiny,
  };

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
