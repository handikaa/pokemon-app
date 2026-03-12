import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({
    super.key,
    this.height = 250,
    this.child,
    required this.bgColor,
  });

  final double height;
  final Color bgColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _BottomCurveClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(color: bgColor),
        child: child,
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
