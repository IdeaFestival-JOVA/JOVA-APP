import 'package:flutter/material.dart';

class MyAnimations {
  static AnimationController createController(TickerProvider vsync, {Duration duration = const Duration(seconds: 1)}) {
    return AnimationController(
      duration: duration,
      vsync: vsync,
    );
  }

  static Animation<double> createScaleAnimation(AnimationController controller, {double begin = 1.0, double end = 1.5}) {
    return Tween<double>(begin: begin, end: end).animate(controller);
  }

  static void startAnimation(AnimationController controller) {
    controller.forward();
  }

  static void reverseAnimation(AnimationController controller) {
    controller.reverse();
  }
}