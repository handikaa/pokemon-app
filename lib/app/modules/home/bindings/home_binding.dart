import 'package:get/get.dart';
import 'package:pokemon_app/app/core/network/network_info.dart';

import '../../../domain/usecase/get_list_pokemon_usecase.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        getListPokemonUsecase: Get.find<GetListPokemonUsecase>(),
        networkInfo: Get.find<NetworkInfo>(),
      ),
    );
  }
}
