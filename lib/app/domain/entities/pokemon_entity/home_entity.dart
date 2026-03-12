import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  const HomeEntity({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory HomeEntity.empty() {
    return HomeEntity(
      frontDefault: '',
      frontFemale: null,
      frontShiny: '',
      frontShinyFemale: null,
    );
  }

  @override
  List<Object?> get props => [
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale,
  ];
}
