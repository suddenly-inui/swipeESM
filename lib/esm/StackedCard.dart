import 'package:flutter/material.dart';

/// カードがスワイプされる際の方向を定義しておきます。
enum SlideDirection {
  Left,
  Right,
  Up,
}

class StackedCard extends ChangeNotifier {
  final String title;
  final String text;
  final int id;

  SlideDirection? direction;

  StackedCard({
    required this.id,
    required this.title,
    required this.text,
  });

  void slideLeft() {
    direction = SlideDirection.Left;
    notifyListeners();
  }

  void slideRight() {
    direction = SlideDirection.Right;
    notifyListeners();
  }

  void slideUp() {
    direction = SlideDirection.Up;
    notifyListeners();
  }
}
