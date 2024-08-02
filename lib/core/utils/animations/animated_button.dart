import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final double width;
  final double height;
  final Color buttonColor;
  final Widget? childWidget;
  final void Function() onTap;
  final int delay;
  const CustomAnimatedButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.buttonColor,
    required this.childWidget,
    this.delay = 0,
  });

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));

    _scale = Tween<double>(
      begin: 1,
      end: 0.9,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: GestureDetector(
        onTap: () {
          _animationController.forward();
          _animationController.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Call onTap after animation completes
              _animationController.reverse();
            }
          });
          Future.delayed(Duration(milliseconds: widget.delay), () {
            widget.onTap();
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: widget.width,
              height: widget.height,
              color: widget.buttonColor,
              padding: const EdgeInsets.all(10),
              constraints:
                  const BoxConstraints(maxWidth: 350), // Important Note !
              alignment: Alignment.center,
              child: widget.childWidget),
        ),
      ),
    );
  }
}
