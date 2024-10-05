import 'package:flutter/material.dart';

class RoundedRectangleClipper extends CustomClipper<RRect> {
  final double radius;

  RoundedRectangleClipper({this.radius = 16.0});

  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return oldClipper is RoundedRectangleClipper && oldClipper.radius != radius;
  }
}
