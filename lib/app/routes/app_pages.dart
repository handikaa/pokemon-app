import 'package:get/get.dart';

import '../modules/detail_pokemon/bindings/detail_pokemon_binding.dart';
import '../modules/detail_pokemon/views/detail_pokemon_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POKEMON,
      page: () => const DetailPokemonView(),
      binding: DetailPokemonBinding(),
    ),
  ];
}
