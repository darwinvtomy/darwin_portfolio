import 'package:flutter/material.dart';

class NavigationItem {
  final String text;
  final GlobalKey key;
  NavigationItem({required this.text, required this.key});

  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}
