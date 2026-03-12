import 'package:get/get.dart';

import '../../../domain/entities/pokemon_entity/pokemon_response_entity.dart';
import '../../../domain/usecase/get_detail_pokemon_usecase.dart';

class DetailPokemonController extends GetxController {
  DetailPokemonController({required this.getDetailPokemonUsecase});

  final GetPokemonDetailUseCase getDetailPokemonUsecase;

  final Rxn<PokemonResponseEntity> pokemonDetail = Rxn<PokemonResponseEntity>();

  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;
  final RxString errorMessage = ''.obs;

  late final String pokemonName;

  @override
  void onInit() {
    super.onInit();

    pokemonName = Get.arguments as String;
    fetchPokemonDetail();
  }

  Future<void> fetchPokemonDetail() async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';

    final result = await getDetailPokemonUsecase(name: pokemonName);

    if (result.isSuccess) {
      pokemonDetail.value = result.data;
    } else {
      isError.value = true;
      errorMessage.value = result.failure?.message ?? 'Unknown error';
    }

    isLoading.value = false;
  }

  Future<void> onRefresh() async {
    await fetchPokemonDetail();
  }
}
