import 'package:pokemon_app/app/data/models/pokemon_model/home_model.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_entity/home_entity.dart';

extension HomeModelMapper on HomeModel {
  HomeEntity toEntity() {
    return HomeEntity(
      frontDefault: frontDefault ?? '',
      frontFemale: frontFemale,
      frontShiny: frontShiny ?? '',
      frontShinyFemale: frontShinyFemale,
    );
  }
}
