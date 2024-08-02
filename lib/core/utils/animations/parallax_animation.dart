import 'package:flutter/material.dart';
import 'dart:math' as math;

enum ParallaxAnimationType { translate, scale }

enum Direction { upToDown, downToUp, leftToRight, rightToLeft }

class ParallaxAnimation extends StatefulWidget {
  final PageController pageController;
  final int index;
  final Widget child;
  final bool enableGaussAnimation;
  final double from;
  final ParallaxAnimationType animationType;
  final Direction direction;
  const ParallaxAnimation(
      {super.key,
      required this.pageController,
      required this.index,
      this.enableGaussAnimation = false,
      this.from = -1000,
      required this.child,
      this.animationType = ParallaxAnimationType.translate,
      required this.direction});

  @override
  State<ParallaxAnimation> createState() => _ParallaxAnimationState();
}

class _ParallaxAnimationState extends State<ParallaxAnimation> {
  double pageOffset = 0;
  late double gauss;

  @override
  void initState() {
    gauss = widget.enableGaussAnimation == false
        ? 1
        : math.exp(-(math.pow((pageOffset - 0.5), 2) / 0.08));

    widget.pageController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageController.position.haveDimensions) {
      pageOffset = widget.pageController.page! - widget.index;
    }

    return widget.animationType == ParallaxAnimationType.translate
        ? Transform.translate(
            offset: direction(widget.direction), child: widget.child)
        : Transform.scale(
            scale: math.exp(-(math.pow((pageOffset - 0), 2) / 0.08)),
            child: widget.child,
          );
  }

  Offset direction(Direction direction) {
    if (direction == Direction.upToDown) {
      return Offset(0, widget.from * gauss * pageOffset);
    } else if (direction == Direction.downToUp) {
      return Offset(0, -widget.from * gauss * pageOffset);
    } else if (direction == Direction.leftToRight) {
      return Offset(-widget.from * gauss * pageOffset, 0);
    } else {
      return Offset(widget.from * gauss * pageOffset, 0);
    }
  }
}
