import 'package:hive_ce/hive.dart';
import 'package:pokemon_app/app/core/error/exceptions.dart';
import 'package:pokemon_app/app/data/models/pokemon_list_model/pokemon_list_model.dart';

abstract class PokemonLocalDatasources {
  Future<void> cachePokemonList(List<PokemonListItemModel> pokemons);

  Future<List<PokemonListItemModel>> getCachedPokemonList();

  Future<void> clearPokemonListCache();
}

class PokemonLocalDatasourcesImpl implements PokemonLocalDatasources {
  PokemonLocalDatasourcesImpl({required this.box});

  final Box box;

  static const String pokemonListKey = 'pokemon_list_cache';

  @override
  Future<void> cachePokemonList(List<PokemonListItemModel> pokemons) async {
    try {
      final jsonList = pokemons.map((e) => e.toJson()).toList();
      await box.put(pokemonListKey, jsonList);
    } catch (e) {
      throw CacheException('Failed to cache pokemon list: $e');
    }
  }

  @override
  Future<List<PokemonListItemModel>> getCachedPokemonList() async {
    try {
      final cachedData = box.get(pokemonListKey);

      if (cachedData == null) {
        return [];
      }

      final list = List<Map<String, dynamic>>.from(
        (cachedData as List).map(
          (item) => Map<String, dynamic>.from(item as Map),
        ),
      );

      return list.map((json) => PokemonListItemModel.fromJson(json)).toList();
    } catch (e) {
      throw CacheException('Failed to get cached pokemon list: $e');
    }
  }

  @override
  Future<void> clearPokemonListCache() async {
    try {
      await box.delete(pokemonListKey);
    } catch (e) {
      throw CacheException('Failed to clear pokemon list cache: $e');
    }
  }
}
