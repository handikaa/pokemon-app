import 'package:equatable/equatable.dart';

class OfficialArtworkEntity extends Equatable {
  final String frontDefault;
  final String frontShiny;

  const OfficialArtworkEntity({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtworkEntity.empty() {
    return OfficialArtworkEntity(frontDefault: '', frontShiny: '');
  }

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
