import 'package:flutter/material.dart';

class SlideFadeAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final void Function()? onEnd;

  const SlideFadeAnimation({
    super.key,
    required this.child,
    this.delay = 0,
    this.onEnd,
  });

  @override
  State<SlideFadeAnimation> createState() => _SlideFadeAnimationState();
}

class _SlideFadeAnimationState extends State<SlideFadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    Future.delayed(
        Duration(milliseconds: widget.delay), () => _controller.forward());

    _controller.addListener(
      () {
        if (_controller.isCompleted) widget.onEnd;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
