import '../../core/error/result.dart';
import '../entities/pokemon_entity/pokemon_response_entity.dart';
import '../repositories/pokemon_repositories.dart';

class GetPokemonDetailUseCase {
  final PokemonRepository repository;

  GetPokemonDetailUseCase({required this.repository});

  Future<Result<PokemonResponseEntity>> call({required String name}) {
    return repository.getDetailPokemon(name: name);
  }
}
