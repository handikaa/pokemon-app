import 'dart:convert';

import 'package:pokemon_app/app/data/models/pokemon_model/ability_model.dart';

class StatsElementModel {
  final int? baseStat;
  final int? effort;
  final AbilityModel? stat;

  StatsElementModel({this.baseStat, this.effort, this.stat});

  factory StatsElementModel.fromRawJson(String str) =>
      StatsElementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatsElementModel.empty() {
    return StatsElementModel(
      baseStat: 0,
      effort: 0,
      stat: AbilityModel.empty(),
    );
  }

  factory StatsElementModel.fromJson(Map<String, dynamic> json) =>
      StatsElementModel(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null ? null : AbilityModel.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat?.toJson(),
  };
}
