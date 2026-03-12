import 'dart:convert';
import 'package:pokemon_app/app/data/models/pokemon_list_model/pokemon_list_model.dart';
import 'package:equatable/equatable.dart';

class PokemonListResponseModel extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonListItemModel>? results;

  const PokemonListResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonListResponseModel.empty() {
    return const PokemonListResponseModel(
      count: 0,
      next: '',
      previous: '',
      results: [],
    );
  }

  factory PokemonListResponseModel.fromRawJson(String str) =>
      PokemonListResponseModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonListResponseModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: json['results'] == null
          ? []
          : List<PokemonListItemModel>.from(
              (json['results'] as List).map(
                (e) => PokemonListItemModel.fromJson(e as Map<String, dynamic>),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'next': next,
    'previous': previous,
    'results': results?.map((e) => e.toJson()).toList() ?? [],
  };

  @override
  List<Object?> get props => [count, next, previous, results];
}
