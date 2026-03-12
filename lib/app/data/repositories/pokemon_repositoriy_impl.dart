import 'package:pokemon_app/app/core/network/network_info.dart';
import 'package:pokemon_app/app/data/datasources/pokemon_local_datasources.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/error/result.dart';
import '../../domain/entities/pokemon_entity/pokemon_response_entity.dart';
import '../../domain/entities/pokemon_list_entity/pokemon_list_item_entity.dart';
import '../../domain/repositories/pokemon_repositories.dart';
import '../datasources/pokemon_remote_datasources.dart';
import '../mappers/pokemon_list_item_mappers.dart';
import '../mappers/pokemon_response_mapper.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDatasources remoteDatasources;
  final PokemonLocalDatasources localDatasources;
  final NetworkInfo networkInfo;

  PokemonRepositoryImpl({
    required this.remoteDatasources,
    required this.localDatasources,
    required this.networkInfo,
  });

  @override
  Future<Result<List<PokemonListItemEntity>>> getListPokemon({
    required int offset,
    required int limit,
  }) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await remoteDatasources.getListPokemon(
          offset: offset,
          limit: limit,
        );

        final models = response.results ?? [];

        await localDatasources.cachePokemonList(models);

        final entities = models.map((e) => e.toEntity()).toList();

        return Result.success(entities);
      } on NetworkException catch (e) {
        return await _getCachedPokemonList(
          fallbackFailure: NetworkFailure(e.message),
        );
      } on UnauthorizedException catch (e) {
        return Result.failure(UnauthorizedFailure(e.message));
      } on NotFoundException catch (e) {
        return Result.failure(NotFoundFailure(e.message));
      } on ServerException catch (e) {
        return await _getCachedPokemonList(
          fallbackFailure: ServerFailure(e.message),
        );
      } on CacheException catch (e) {
        return Result.failure(CacheFailure(e.message));
      } catch (e) {
        return Result.failure(UnknownFailure('Unexpected error: $e'));
      }
    } else {
      return await _getCachedPokemonList(
        fallbackFailure: NetworkFailure('No internet connection'),
      );
    }
  }

  @override
  Future<Result<PokemonResponseEntity>> getDetailPokemon({
    required String name,
  }) async {
    try {
      final response = await remoteDatasources.getDetailPokemon(name: name);

      final entity = response.toEntity();

      return Result.success(entity);
    } on NetworkException catch (e) {
      return Result.failure(NetworkFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Result.failure(UnauthorizedFailure(e.message));
    } on NotFoundException catch (e) {
      return Result.failure(NotFoundFailure(e.message));
    } on CacheException catch (e) {
      return Result.failure(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(e.message));
    } catch (e) {
      return Result.failure(UnknownFailure('Unexpected error: $e'));
    }
  }

  Future<Result<List<PokemonListItemEntity>>> _getCachedPokemonList({
    required Failure fallbackFailure,
  }) async {
    try {
      final cachedModels = await localDatasources.getCachedPokemonList();

      if (cachedModels.isEmpty) {
        return Result.failure(fallbackFailure);
      }

      final entities = cachedModels.map((e) => e.toEntity()).toList();

      return Result.success(entities);
    } on CacheException catch (e) {
      return Result.failure(CacheFailure(e.message));
    } catch (e) {
      return Result.failure(UnknownFailure('Unexpected error: $e'));
    }
  }
}
