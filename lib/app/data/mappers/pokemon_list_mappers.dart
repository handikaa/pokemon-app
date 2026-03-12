import '../../domain/entities/pokemon_list_entity/pokemon_list_response_entity.dart';
import '../models/pokemon_list_model/pokemon_list_response_model.dart';
import 'pokemon_list_item_mappers.dart';

extension PokemonListResponseModelMapper on PokemonListResponseModel {
  PokemonListResponseEntity toEntity() {
    return PokemonListResponseEntity(
      count: count ?? 0,
      next: next ?? '',
      previous: previous ?? '',
      results: results?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
