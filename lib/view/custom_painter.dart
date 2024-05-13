import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    double radius = 50;
    var center = Offset(0, 0);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
