import 'dart:convert';

import 'ability_model.dart';

class TypeElementModel {
  final int? slot;
  final AbilityModel? type;

  TypeElementModel({this.slot, this.type});

  factory TypeElementModel.fromRawJson(String str) =>
      TypeElementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeElementModel.fromJson(Map<String, dynamic> json) =>
      TypeElementModel(
        slot: json["slot"],
        type: json["type"] == null ? null : AbilityModel.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {"slot": slot, "type": type?.toJson()};
}
