import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';
import '../../../core/utils/pokemon_type_color.dart';
import '../../../domain/entities/pokemon_entity/pokemon_response_entity.dart';
import '../../../widget/card/curved_container.dart';
import '../../../widget/card/pokemon_ability_card.dart';
import '../../../widget/card/pokemon_type_chip.dart';
import '../../../widget/card/stats_item.dart';
import '../../../widget/view/detail_pokemon_loading.dart';
import '../controllers/detail_pokemon_controller.dart';

class DetailPokemonView extends GetView<DetailPokemonController> {
  const DetailPokemonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pokemon = controller.pokemonDetail.value;

      final bgColor = PokemonTypeColor.fromType(
        pokemon?.typesEntity.isNotEmpty == true
            ? pokemon!.typesEntity.first.type.name
            : '',
      );

      final typeColor = PokemonTypeColor.fromType(
        pokemon?.typesEntity.isNotEmpty == true
            ? pokemon!.typesEntity.first.type.name
            : '',
      );

      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            final fadeAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            );

            final slideAnimation = Tween<Offset>(
              begin: const Offset(0, 0.04),
              end: Offset.zero,
            ).animate(fadeAnimation);

            return FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(position: slideAnimation, child: child),
            );
          },
          child: _buildBody(bgColor, typeColor),
        ),
      );
    });
  }

  Widget _buildBody(Color bgColorContainer, Color typeColor) {
    if (controller.isLoading.value) {
      return const DetailPokemonLoadingView(key: ValueKey('detail-loading'));
    }

    if (controller.isError.value) {
      return Center(
        key: const ValueKey('detail-error'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(controller.errorMessage.value),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: controller.fetchPokemonDetail,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final pokemon = controller.pokemonDetail.value;

    if (pokemon == null) {
      return const Center(
        key: ValueKey('detail-empty'),
        child: Text('No detail data found'),
      );
    }

    return RefreshIndicator(
      key: const ValueKey('detail-success'),
      onRefresh: controller.onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImagePokemon(pokemon, bgColorContainer),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildTitleName(pokemon),
                  const SizedBox(height: 12),

                  _buildTypesRow(pokemon),
                  const SizedBox(height: 12),

                  _buildSectionTitle('Abilities'),
                  const SizedBox(height: 12),
                  _buildListAbilityCard(pokemon, typeColor),
                  const SizedBox(height: 12),

                  _buildSectionTitle('Stats'),
                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.statsEntity.sortedForDisplay
                        .map((stat) => PokemonStatItem(stat: stat))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Column _buildListAbilityCard(PokemonResponseEntity pokemon, Color typeColor) {
    return Column(
      children: pokemon.abilities.map<Widget>((abilityElement) {
        return PokemonAbilityCard(
          name: abilityElement.ability.name,
          isHidden: abilityElement.isHidden,
          slot: abilityElement.slot,
          typeColor: typeColor,
        );
      }).toList(),
    );
  }

  Row _buildTitleName(PokemonResponseEntity pokemon) {
    return Row(
      children: [
        Text(
          pokemon.name,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Row _buildTypesRow(PokemonResponseEntity pokemon) {
    return Row(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: pokemon.typesEntity.map<Widget>((typeElement) {
            return PokemonTypeChip(type: typeElement.type.name);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildImagePokemon(
    PokemonResponseEntity pokemon,
    Color bgColorContainer,
  ) {
    return SizedBox(
      height: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CurvedContainer(bgColor: bgColorContainer),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Align(
                alignment: Alignment.topLeft,
                child: _buildAppBarButtonBack(),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: -50,
            child: Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  pokemon.sprites.other!.showdown.frontDefault,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported_outlined,
                      size: 64,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarButtonBack() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),

              child: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
