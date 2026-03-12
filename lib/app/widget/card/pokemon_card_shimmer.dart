import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokemonCardShimmer extends StatelessWidget {
  const PokemonCardShimmer({
    super.key,
    this.backgroundColor = const Color(0xFFEAEAEA),
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  _shimmerRect(width: 120, height: 22),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _shimmerCircle(48),
                      const Spacer(),
                      _shimmerCircle(42),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -42,
            left: 0,
            right: 0,
            child: Center(child: _shimmerCircle(130)),
          ),
        ],
      ),
    );
  }

  Widget _shimmerRect({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFDADADA),
      highlightColor: const Color(0xFFF7F7F7),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _shimmerCircle(double size) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFDADADA),
      highlightColor: const Color(0xFFF7F7F7),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
