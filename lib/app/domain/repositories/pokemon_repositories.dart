import 'package:pokemon_app/app/core/error/result.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/pokemon_response_entity.dart';

import '../entities/pokemon_list_entity/pokemon_list_item_entity.dart';

abstract class PokemonRepository {
  Future<Result<List<PokemonListItemEntity>>> getListPokemon({
    required int offset,
    required int limit,
  });

  Future<Result<PokemonResponseEntity>> getDetailPokemon({
    required String name,
  });
}
