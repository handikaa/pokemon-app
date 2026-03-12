import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokemon_app/app/routes/app_pages.dart';
import 'package:pokemon_app/app/widget/card/home_header_shimmer.dart';

import '../../../widget/card/pokemon_card.dart';
import '../../../widget/card/pokemon_card_shimmer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return HomeHeaderShimmer();
              }
              return Column(
                children: [
                  SizedBox(height: 12),
                  _builaAppbarTitle(),
                  _buildSearchSection(),
                ],
              );
            }),
            Obx(() {
              if (controller.isConnected.value) {
                return const SizedBox.shrink();
              }

              return Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Mode offline: menampilkan data dari cache lokal',
                  textAlign: TextAlign.center,
                ),
              );
            }),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 14,
                          childAspectRatio: 0.68,
                        ),
                    itemBuilder: (context, index) {
                      return PokemonCardShimmer(
                        backgroundColor:
                            controller.colors[index % controller.colors.length],
                      );
                    },
                  );
                }

                if (controller.isError.value) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(controller.errorMessage.value),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: controller.fetchInitialPokemon,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (controller.isEmpty.value) {
                  return RefreshIndicator(
                    onRefresh: controller.onRefresh,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 200),
                        Center(child: Text('No Pokémon found')),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: controller.onRefresh,
                  child: CustomScrollView(
                    controller: controller.scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final pokemon =
                                controller.filteredPokemonList[index];

                            return PokemonCard(
                              pokemon: pokemon,
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_POKEMON,
                                  arguments: pokemon.name,
                                );
                              },
                            );
                          }, childCount: controller.filteredPokemonList.length),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 23,
                                childAspectRatio: 0.6,
                              ),
                        ),
                      ),

                      /// pagination loader
                      SliverToBoxAdapter(
                        child: Obx(() {
                          if (!controller.isLoadMore.value) {
                            return const SizedBox(height: 16);
                          }

                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBFAFD6).withValues(alpha: 0.12),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: TextField(
          onChanged: controller.onSearchChanged,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3B3B3B),
          ),
          decoration: InputDecoration(
            hintText: 'Search Pokémon',
            hintStyle: const TextStyle(color: Color(0xFF8E8AA2), fontSize: 16),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Color(0xFF7C7890),
            ),
            filled: true,
            fillColor: const Color(0xFFF3EEF8),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(
                color: Color(0xFFE1D9EC),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(
                color: Color(0xFFC9B6E4),
                width: 1.4,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _builaAppbarTitle() {
    return Row(
      mainAxisAlignment: .center,
      children: [Text("Pokemon", style: TextStyle(fontSize: 24))],
    );
  }
}
