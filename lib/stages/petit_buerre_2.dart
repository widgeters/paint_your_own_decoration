import 'dart:math';

import 'package:flutter/material.dart';

class PetitBuerre extends Decoration {
  final double radius;

  PetitBuerre({this.radius = 16.0});

  @override
  BoxPainter createBoxPainter([void Function() onChanged]) {
    return PetitBuerrePainter(radius);
  }

  @override
  EdgeInsetsGeometry get padding => EdgeInsets.all(radius);
}

class PetitBuerrePainter extends BoxPainter {
  final double radius;

  PetitBuerrePainter(this.radius);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..color = Colors.yellow[700]
      ..strokeWidth = 4;

    final path = Path();

    final size = configuration.size;
    final numberOfCirclesHorizontal = (size.width / (radius * 2)).ceil();
    final numberOfCirclesVertical = (size.height / (radius * 2)).ceil();
    final radiusHorizontal = size.width / (numberOfCirclesHorizontal * 2);
    final radiusVertical = size.height / (numberOfCirclesVertical * 2);

    path.moveTo(radiusHorizontal * 2, radiusVertical);

    for (int i = 2; i < numberOfCirclesHorizontal; i++) {
      path.arcToPoint(
        Offset(2 * radiusHorizontal * i, radiusVertical),
        radius: Radius.elliptical(radiusHorizontal, radiusVertical),
        rotation: pi,
      );
    }

    path.arcToPoint(
      Offset(size.width - radiusHorizontal, radiusVertical * 2),
      radius: Radius.elliptical(radiusHorizontal, radiusVertical),
      rotation: 3 / 2 * pi,
      largeArc: true,
    );

    for (int i = 2; i < numberOfCirclesVertical; i++) {
      path.arcToPoint(
        Offset(size.width - radiusHorizontal, 2 * radiusVertical * i),
        radius: Radius.elliptical(radiusHorizontal, radiusVertical),
        rotation: pi,
      );
    }

    path.arcToPoint(
      Offset(size.width - radiusHorizontal * 2, size.height - radiusVertical),
      radius: Radius.elliptical(radiusHorizontal, radiusVertical),
      rotation: 3 / 2 * pi,
      largeArc: true,
    );

    for (int i = numberOfCirclesHorizontal - 2; i >= 1; i--) {
      path.arcToPoint(
        Offset(2 * radiusHorizontal * i, size.height - radiusVertical),
        radius: Radius.elliptical(radiusHorizontal, radiusVertical),
        rotation: pi,
      );
    }

    path.arcToPoint(
      Offset(radiusHorizontal, size.height - radiusVertical * 2),
      radius: Radius.elliptical(radiusHorizontal, radiusVertical),
      rotation: 3 / 2 * pi,
      largeArc: true,
    );

    for (int i = numberOfCirclesVertical - 2; i >= 1; i--) {
      path.arcToPoint(
        Offset(radiusHorizontal, 2 * radiusVertical * i),
        radius: Radius.elliptical(radiusHorizontal, radiusVertical),
        rotation: pi,
      );
    }

    path.arcToPoint(
      Offset(radiusHorizontal * 2, radiusVertical),
      radius: Radius.elliptical(radiusHorizontal, radiusVertical),
      rotation: 3 / 2 * pi,
      largeArc: true,
    );

    canvas.drawPath(path.shift(offset), paint);

    final path2 = Path();

    path2.lineTo(size.width - 2 * radius, size.height - radius);

    for (int i = numberOfCirclesHorizontal - 1; i >= 0; i--) {
      path2.arcToPoint(
        Offset(2 * (radius + radiusHorizontal * i), size.height - radius),
        radius: Radius.elliptical(radiusHorizontal, radiusVertical),
        rotation: pi,
      );
    }

    path2.lineTo(radius, size.height - 2 * radius);

    for (int i = numberOfCirclesVertical - 1; i >= 0; i--) {
      path2.arcToPoint(
        Offset(radius, 2 * (radius + radiusVertical * i)),
        radius: Radius.elliptical(radiusHorizontal, radiusVertical),
        rotation: pi,
      );
    }
  }
}
