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
    final size = configuration.size;

    final paint = Paint()
      ..color = Colors.yellow[600]
      ..strokeWidth = 4;

    canvas.drawRect(
      Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height).deflate(radius),
      paint,
    );

    canvas.drawCircle(offset + Offset(radius, radius), radius, paint);
    canvas.drawCircle(offset + Offset(size.width - radius, radius), radius, paint);
    canvas.drawCircle(offset + Offset(size.width - radius, size.height - radius), radius, paint);
    canvas.drawCircle(offset + Offset(radius, size.height - radius), radius, paint);

  }
}
