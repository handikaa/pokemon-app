import 'package:pokemon_app/app/data/models/pokemon_model/pokemon_model.dart';

import '../../core/error/exceptions.dart';
import '../models/pokemon_list_model/pokemon_list_response_model.dart';
import '../services/pokemon_api_services.dart';

abstract class PokemonRemoteDatasources {
  Future<PokemonListResponseModel> getListPokemon({
    required int offset,
    required int limit,
  });
  Future<PokemonResponseModel> getDetailPokemon({required String name});
}

class PokemonRemoteDatasourcesImpl implements PokemonRemoteDatasources {
  PokemonRemoteDatasourcesImpl({required this.apiService});

  final PokemonApiService apiService;

  @override
  Future<PokemonListResponseModel> getListPokemon({
    required int offset,
    required int limit,
  }) async {
    try {
      final response = await apiService.getPokemonList(
        offset: offset,
        limit: limit,
      );

      return PokemonListResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on ServerException {
      rethrow;
    } on NetworkException {
      rethrow;
    } on UnauthorizedException {
      rethrow;
    } on NotFoundException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to parse pokemon list: $e');
    }
  }

  @override
  Future<PokemonResponseModel> getDetailPokemon({required String name}) async {
    try {
      final response = await apiService.getPokemonDetail(name: name);

      return PokemonResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on ServerException {
      rethrow;
    } on NetworkException {
      rethrow;
    } on UnauthorizedException {
      rethrow;
    } on NotFoundException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to parse pokemon list: $e');
    }
  }
}
