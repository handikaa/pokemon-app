import 'package:equatable/equatable.dart';

class DreamWorldEntity extends Equatable {
  final String frontDefault;
  final dynamic frontFemale;

  const DreamWorldEntity({
    required this.frontDefault,
    required this.frontFemale,
  });

  factory DreamWorldEntity.empty() {
    return DreamWorldEntity(frontDefault: '', frontFemale: null);
  }

  @override
  List<Object?> get props => [frontDefault, frontFemale];
}
