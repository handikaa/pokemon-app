import 'dart:convert';

import 'package:equatable/equatable.dart';

class DreamWorldModel extends Equatable {
  final String? frontDefault;
  final dynamic frontFemale;

  const DreamWorldModel({this.frontDefault, this.frontFemale});

  factory DreamWorldModel.empty() {
    return const DreamWorldModel(frontDefault: '', frontFemale: null);
  }

  factory DreamWorldModel.fromRawJson(String str) =>
      DreamWorldModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory DreamWorldModel.fromJson(Map<String, dynamic> json) =>
      DreamWorldModel(
        frontDefault: json['front_default'] as String?,
        frontFemale: json['front_female'],
      );

  Map<String, dynamic> toJson() => {
    'front_default': frontDefault,
    'front_female': frontFemale,
  };

  @override
  List<Object?> get props => [frontDefault, frontFemale];
}
