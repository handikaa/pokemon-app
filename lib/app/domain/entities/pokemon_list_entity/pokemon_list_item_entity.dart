import 'package:equatable/equatable.dart';

class PokemonListItemEntity extends Equatable {
  final int id;
  final String name;
  final String url;
  final String imageUrl;

  const PokemonListItemEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.imageUrl,
  });

  factory PokemonListItemEntity.empty() {
    return const PokemonListItemEntity(id: 0, name: '', url: '', imageUrl: '');
  }

  @override
  List<Object?> get props => [id, name, url, imageUrl];
}
