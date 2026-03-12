import 'package:get/get.dart';
import 'package:pokemon_app/app/domain/usecase/get_detail_pokemon_usecase.dart';

import '../controllers/detail_pokemon_controller.dart';

class DetailPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPokemonController>(
      () => DetailPokemonController(
        getDetailPokemonUsecase: Get.find<GetPokemonDetailUseCase>(),
      ),
    );
  }
}
