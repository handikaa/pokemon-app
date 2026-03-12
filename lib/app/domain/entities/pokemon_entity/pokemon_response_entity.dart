import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/ability_element_entity.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/sprites_entity.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/stats_element_entity.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/type_element_entity.dart';

class PokemonResponseEntity extends Equatable {
  final int id;
  final String name;
  final List<AbilityElementEntity> abilities;
  final List<StatsElementEntity> statsEntity;
  final List<TypeElementEntity> typesEntity;
  final SpritesEntity sprites;

  const PokemonResponseEntity({
    required this.id,
    required this.name,
    required this.abilities,
    required this.sprites,
    required this.statsEntity,
    required this.typesEntity,
  });

  factory PokemonResponseEntity.empty() {
    return PokemonResponseEntity(
      id: 0,
      name: '',
      abilities: const [],
      statsEntity: const [],
      typesEntity: const [],
      sprites: SpritesEntity.empty(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    abilities,
    sprites,
    statsEntity,
    typesEntity,
  ];
}
