import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/other_entity.dart';

class SpritesEntity extends Equatable {
  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final OtherEntity? other;

  const SpritesEntity({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
  });

  factory SpritesEntity.empty({bool withOther = true}) {
    return SpritesEntity(
      backDefault: '',
      backFemale: null,
      backShiny: '',
      backShinyFemale: null,
      frontDefault: '',
      frontFemale: null,
      frontShiny: '',
      frontShinyFemale: null,
      other: withOther ? OtherEntity.empty() : null,
    );
  }

  @override
  List<Object?> get props => [
    backDefault,
    backFemale,
    backShiny,
    backShinyFemale,
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale,
    other,
  ];
}
