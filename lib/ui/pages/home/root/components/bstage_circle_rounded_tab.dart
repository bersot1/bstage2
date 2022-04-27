import 'package:flutter/material.dart';

class CircleRoundedTab extends CustomPainter {
  final Color color;
  final double animValue1, animValue2, animValue3;

  CircleRoundedTab({
    required this.animValue1,
    required this.animValue2,
    required this.animValue3,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    double round = 90; // can change
    double width = 88, space = round / 2, curve = 20, set = 75; // not change

    /// => without animations
    // animValue1 == 'round'
    // animValue2 == 'set'
    // animValue3 == 'space'

    // top curve
    path.moveTo(width, 0);
    path.quadraticBezierTo(width, curve, animValue3, curve);
    path.lineTo(animValue1, 20);
    path.quadraticBezierTo(animValue2, curve, animValue2, curve + 20);
    path.lineTo(width, curve + 20);
    path.close();

    // bottom curve
    path.moveTo(width, 80);
    path.quadraticBezierTo(width, curve + 40, animValue3, curve + 40);
    path.lineTo(animValue1, 60);
    path.quadraticBezierTo(animValue2, curve + 40, animValue2, curve + 20);
    path.lineTo(width, curve + 20);
    path.close();

    // style
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
