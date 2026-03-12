import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:pokemon_app/app/core/network/network_info.dart';
import 'package:pokemon_app/app/core/network/network_info_impl.dart';
import 'package:pokemon_app/app/data/datasources/pokemon_local_datasources.dart';
import 'package:pokemon_app/app/data/repositories/pokemon_repositoriy_impl.dart';
import 'package:pokemon_app/app/data/services/pokemon_api_services.dart';
import 'package:pokemon_app/app/domain/repositories/pokemon_repositories.dart';
import 'package:pokemon_app/app/domain/usecase/get_detail_pokemon_usecase.dart';
import 'package:pokemon_app/app/domain/usecase/get_list_pokemon_usecase.dart';

import '../../data/datasources/pokemon_remote_datasources.dart';

class Injection {
  Injection._();

  static void init() {
    /// Services
    Get.lazyPut<PokemonApiService>(() => PokemonApiService(), fenix: true);

    /// Data sources
    Get.put<Box>(Hive.box('pokemon_cache_box'));
    Get.lazyPut<PokemonRemoteDatasources>(
      () => PokemonRemoteDatasourcesImpl(
        apiService: Get.find<PokemonApiService>(),
      ),
      fenix: true,
    );
    Get.lazyPut<PokemonLocalDatasources>(
      () => PokemonLocalDatasourcesImpl(box: Get.find<Box>()),
      fenix: true,
    );

    /// Repositories
    Get.lazyPut<PokemonRepository>(
      () => PokemonRepositoryImpl(
        remoteDatasources: Get.find<PokemonRemoteDatasources>(),
        localDatasources: Get.find<PokemonLocalDatasources>(),
        networkInfo: Get.find<NetworkInfo>(),
      ),
      fenix: true,
    );

    /// Usecases
    Get.lazyPut<GetListPokemonUsecase>(
      () => GetListPokemonUsecase(repository: Get.find<PokemonRepository>()),
      fenix: true,
    );

    Get.lazyPut<GetPokemonDetailUseCase>(
      () => GetPokemonDetailUseCase(repository: Get.find<PokemonRepository>()),
      fenix: true,
    );

    Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(
        internetChecker: () async {
          // real checker implementation here
          return true;
        },
        connectivityStream: const Stream<bool>.empty(),
      ),
      fenix: true,
    );
  }
}
