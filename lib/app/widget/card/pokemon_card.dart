import 'package:flutter/material.dart';

import '../../core/utils/pokemon_color_utils.dart';
import '../../domain/entities/pokemon_list_entity/pokemon_list_item_entity.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
    this.backgroundColor,
  });

  final PokemonListItemEntity pokemon;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late Future<Color> _cardColorFuture;

  @override
  void initState() {
    super.initState();
    _cardColorFuture = _resolveCardColor();
  }

  @override
  void didUpdateWidget(covariant PokemonCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    final isImageChanged =
        oldWidget.pokemon.imageUrl != widget.pokemon.imageUrl;
    final isBackgroundChanged =
        oldWidget.backgroundColor != widget.backgroundColor;

    if (isImageChanged || isBackgroundChanged) {
      _cardColorFuture = _resolveCardColor();
    }
  }

  Future<Color> _resolveCardColor() async {
    if (widget.backgroundColor != null) {
      return widget.backgroundColor!;
    }

    return PokemonColorUtils.generateCardColorFromImage(
      NetworkImage(widget.pokemon.imageUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color>(
      future: _cardColorFuture,
      builder: (context, snapshot) {
        final cardColor =
            snapshot.data ?? widget.backgroundColor ?? Colors.grey.shade300;

        return Padding(
          padding: const EdgeInsets.only(top: 36),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -2,
                          left: -90,
                          child: _CardGlowCircle(size: 300),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 120, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                widget.pokemon.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${widget.pokemon.id}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: cardColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: -62,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.network(
                        widget.pokemon.imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            size: 48,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CardGlowCircle extends StatelessWidget {
  const _CardGlowCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Colors.white, Color(0x1AFFFFFF), Colors.transparent],
            stops: [0.05, 0.4, 3.0],
          ),
        ),
      ),
    );
  }
}
