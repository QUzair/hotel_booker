import 'dart:ui';

import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    var firstEndpoint = Offset(size.width * 0.5, size.height - 25.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50.0);
    var secondEndpoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * 0.75, size.height - 10.0);

    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
