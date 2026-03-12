import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_list_entity/pokemon_list_item_entity.dart';

class PokemonListResponseEntity extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<PokemonListItemEntity> results;

  const PokemonListResponseEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonListResponseEntity.empty() {
    return const PokemonListResponseEntity(
      count: 0,
      next: '',
      previous: '',
      results: [],
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}
