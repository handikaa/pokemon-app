import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonListItemModel extends Equatable {
  final String? name;
  final String? url;

  const PokemonListItemModel({this.name, this.url});

  factory PokemonListItemModel.empty() {
    return const PokemonListItemModel(name: '', url: '');
  }

  factory PokemonListItemModel.fromRawJson(String str) =>
      PokemonListItemModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory PokemonListItemModel.fromJson(Map<String, dynamic> json) {
    return PokemonListItemModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'url': url};

  @override
  List<Object?> get props => [name, url];
}
