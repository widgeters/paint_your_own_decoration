import 'dart:math';

import 'package:flutter/material.dart';

class PetitBuerre extends Decoration {
  static const radius = 16.0;

  @override
  BoxPainter createBoxPainter([void Function() onChanged]) {
    return PetitBuerrePainter();
  }

  @override
  EdgeInsetsGeometry get padding => EdgeInsets.all(radius);
}

class PetitBuerrePainter extends BoxPainter {
  get radius => PetitBuerre.radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..color = Colors.yellow[700]
      ..strokeWidth = 4;
    final size = configuration.size;

    final path = Path();

    path
      ..moveTo(radius * 2, radius)
      ..lineTo(size.width - radius * 2, radius)
      ..arcToPoint(
        Offset(size.width - radius, radius * 2),
        radius: Radius.circular(radius),
        rotation: 3 / 2 * pi,
        largeArc: true,
      )
      ..lineTo(size.width - radius, size.height - radius * 2)
      ..arcToPoint(
        Offset(size.width - radius * 2, size.height - radius),
        radius: Radius.circular(radius),
        rotation: 3 / 2 * pi,
        largeArc: true,
      )
      ..lineTo(radius * 2, size.height - radius)
      ..arcToPoint(
        Offset(radius, size.height - radius * 2),
        radius: Radius.circular(radius),
        rotation: 3 / 2 * pi,
        largeArc: true,
      )
      ..lineTo(radius, radius * 2)
      ..arcToPoint(
        Offset(radius * 2, radius),
        radius: Radius.circular(radius),
        rotation: 3 / 2 * pi,
        largeArc: true,
      )
      ..close();

    canvas.drawPath(path.shift(offset), paint);
  }
}
