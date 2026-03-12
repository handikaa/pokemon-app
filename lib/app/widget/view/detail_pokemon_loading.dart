import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailPokemonLoadingView extends StatelessWidget {
  const DetailPokemonLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderShimmer(),
          const SizedBox(height: 80),
          _buildTitleShimmer(),
          const SizedBox(height: 16),
          _buildTypeChipShimmer(),
          const SizedBox(height: 28),
          _buildSectionTitleShimmer(),
          const SizedBox(height: 16),
          _buildAbilityListShimmer(),
          const SizedBox(height: 28),
          _buildSectionTitleShimmer(width: 100),
          const SizedBox(height: 16),
          _buildStatsListShimmer(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeaderShimmer() {
    return SizedBox(
      height: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const _CurvedHeaderShimmer(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Shimmer.fromColors(
                  baseColor: const Color(0xFFE3DCE8),
                  highlightColor: const Color(0xFFF6F3F8),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: -50,
            child: Center(
              child: Shimmer.fromColors(
                baseColor: const Color(0xFFE3DCE8),
                highlightColor: const Color(0xFFF6F3F8),
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE3DCE8),
        highlightColor: const Color(0xFFF6F3F8),
        child: Container(
          width: 220,
          height: 34,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeChipShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE3DCE8),
        highlightColor: const Color(0xFFF6F3F8),
        child: Container(
          width: 120,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitleShimmer({double width = 140}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE3DCE8),
        highlightColor: const Color(0xFFF6F3F8),
        child: Container(
          width: width,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildAbilityListShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          _AbilityCardShimmer(),
          SizedBox(height: 12),
          _AbilityCardShimmer(),
          SizedBox(height: 12),
          _AbilityCardShimmer(),
        ],
      ),
    );
  }

  Widget _buildStatsListShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          _StatItemShimmer(),
          SizedBox(height: 14),
          _StatItemShimmer(),
          SizedBox(height: 14),
          _StatItemShimmer(),
          SizedBox(height: 14),
          _StatItemShimmer(),
          SizedBox(height: 14),
          _StatItemShimmer(),
          SizedBox(height: 14),
          _StatItemShimmer(),
        ],
      ),
    );
  }
}

class _CurvedHeaderShimmer extends StatelessWidget {
  const _CurvedHeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _BottomCurveClipper(),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFD8B7DF),
        highlightColor: const Color(0xFFE8D4EC),
        child: Container(
          height: 260,
          width: double.infinity,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _AbilityCardShimmer extends StatelessWidget {
  const _AbilityCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE3DCE8),
      highlightColor: const Color(0xFFF6F3F8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 160,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 72,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 110,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItemShimmer extends StatelessWidget {
  const _StatItemShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE3DCE8),
      highlightColor: const Color(0xFFF6F3F8),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 30,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 90);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 90,
      size.width,
      size.height - 90,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
