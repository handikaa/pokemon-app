import 'package:pokemon_app/app/data/models/pokemon_list_model/pokemon_list_model.dart';

import 'package:pokemon_app/app/domain/entities/pokemon_list_entity/pokemon_list_item_entity.dart';

extension PokemonListItemModelMapper on PokemonListItemModel {
  PokemonListItemEntity toEntity() {
    final pokemonId = _extractPokemonIdFromUrl(url ?? '');

    return PokemonListItemEntity(
      id: pokemonId,
      name: name ?? '',
      url: url ?? '',
      imageUrl: _buildOfficialArtworkUrl(pokemonId),
    );
  }
}

int _extractPokemonIdFromUrl(String url) {
  final uri = Uri.tryParse(url);

  if (uri == null) return 0;

  final segments = uri.pathSegments
      .where((segment) => segment.isNotEmpty)
      .toList();

  if (segments.isEmpty) return 0;

  return int.tryParse(segments.last) ?? 0;
}

String _buildOfficialArtworkUrl(int id) {
  if (id <= 0) return '';

  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
