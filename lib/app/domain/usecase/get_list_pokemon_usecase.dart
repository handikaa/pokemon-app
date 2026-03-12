import 'package:pokemon_app/app/core/error/result.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_list_entity/pokemon_list_item_entity.dart';
import 'package:pokemon_app/app/domain/repositories/pokemon_repositories.dart';

class GetListPokemonUsecase {
  final PokemonRepository repository;

  GetListPokemonUsecase({required this.repository});

  Future<Result<List<PokemonListItemEntity>>> call({
    required int offset,
    required int limit,
  }) {
    return repository.getListPokemon(offset: offset, limit: limit);
  }
}
