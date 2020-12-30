import 'package:flutter/cupertino.dart';

class TopRightClipper extends CustomClipper<Path> {
  final double clipAngle;

  TopRightClipper([this.clipAngle = 30.0]);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - clipAngle, 0);
    path.lineTo(size.width, clipAngle);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopClipper extends CustomClipper<Path> {
  final double clipAngle;

  TopClipper([this.clipAngle = 30.0]);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(clipAngle, 0);
    path.lineTo(size.width - clipAngle, 0);
    path.lineTo(size.width, clipAngle);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, clipAngle);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
