import 'package:flutter/material.dart';
import 'package:jovajovajova/screens/main_screen.dart';
import '../../screens/job_screen.dart';
import '../../screens/myprofile_screen.dart';
class ButtonAnimation{
  static AnimationController createController(TickerProvider vsync, {Duration duration = const Duration(seconds: 1)}) {
    return AnimationController(
      duration: const Duration(seconds: 1),
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
class ButtonActions {
  static void jobOfferButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const JobScreen()),
    );
  }

  static void myprofileButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyprofileScreen()),
    );
  }

  static void backmainbutton(BuildContext context){
    Navigator.push(
        context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }
}
