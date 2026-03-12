import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/data/models/pokemon_model/ability_model.dart';

class AbilityElementModel extends Equatable {
  final AbilityModel? ability;
  final bool? isHidden;
  final int? slot;

  const AbilityElementModel({this.ability, this.isHidden, this.slot});

  factory AbilityElementModel.empty() {
    return const AbilityElementModel(ability: null, isHidden: false, slot: 0);
  }

  factory AbilityElementModel.fromRawJson(String str) =>
      AbilityElementModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory AbilityElementModel.fromJson(Map<String, dynamic> json) =>
      AbilityElementModel(
        ability: json['ability'] == null
            ? null
            : AbilityModel.fromJson(json['ability'] as Map<String, dynamic>),
        isHidden: json['is_hidden'] as bool?,
        slot: json['slot'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'ability': ability?.toJson(),
    'is_hidden': isHidden,
    'slot': slot,
  };

  @override
  List<Object?> get props => [ability, isHidden, slot];
}
