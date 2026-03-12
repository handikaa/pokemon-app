import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/ability_entity.dart';

class AbilityElementEntity extends Equatable {
  final AbilityEntity ability;
  final bool isHidden;
  final int slot;

  const AbilityElementEntity({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory AbilityElementEntity.empty() {
    return AbilityElementEntity(
      ability: AbilityEntity.empty(),
      isHidden: false,
      slot: 0,
    );
  }

  @override
  List<Object?> get props => [ability, isHidden, slot];
}
