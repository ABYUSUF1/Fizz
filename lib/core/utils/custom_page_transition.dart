import 'package:flutter/material.dart';

enum SlideDirection { left, right, up, down }

PageRouteBuilder customPageTransition(
    {required Widget page, SlideDirection direction = SlideDirection.right}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin;
      switch (direction) {
        case SlideDirection.left:
          begin = const Offset(-1.0, 0.0);
          break;
        case SlideDirection.right:
          begin = const Offset(1.0, 0.0);
          break;
        case SlideDirection.up:
          begin = const Offset(0.0, -1.0);
          break;
        case SlideDirection.down:
          begin = const Offset(0.0, 1.0);
          break;
      }
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
