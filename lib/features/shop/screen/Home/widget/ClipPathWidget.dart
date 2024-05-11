import 'package:flutter/material.dart';

class ClipPathWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.lineTo(0, h);
    path.quadraticBezierTo(0, h - 20, 30, h - 20);
    path.quadraticBezierTo(30, h - 20, w - 30, h - 20);
    path.quadraticBezierTo(w, h - 20, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
