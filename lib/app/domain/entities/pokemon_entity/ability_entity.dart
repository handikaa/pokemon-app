import 'package:equatable/equatable.dart';

class AbilityEntity extends Equatable {
  final String name;
  final String url;

  const AbilityEntity({required this.name, required this.url});

  factory AbilityEntity.empty() {
    return AbilityEntity(name: '', url: '');
  }

  @override
  List<Object?> get props => [name, url];
}
