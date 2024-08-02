import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/animations/animated_button.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/custom_page_transition.dart';
import '../../../../home/presentation/views/home_view.dart';

class CustomAuthButton extends StatelessWidget {
  final Widget child;
  final bool loadingState;
  final bool successState;
  final bool failureState;
  final String? failureText;
  final void Function() onTap;

  const CustomAuthButton({
    super.key,
    required this.child,
    required this.loadingState,
    required this.successState,
    required this.failureState,
    required this.onTap,
    required this.failureText,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Schedule navigation after the current build frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (successState) {
        Navigator.pushAndRemoveUntil(
            context,
            customPageTransition(
                page: const HomeView(), direction: SlideDirection.right),
            (route) => false);
      }
    });

    return Column(
      children: <Widget>[
        if (failureState)
          Row(
            children: <Widget>[
              const Icon(Icons.error_outline, color: errorColor),
              Text(' $failureText', style: const TextStyle(color: errorColor)),
            ],
          ),
        const SizedBox(height: 10),
        CustomAnimatedButton(
          width: size.width / 3.5,
          height: size.width >= 1100 ? 60 : 70,
          childWidget: loadingState
              ? ZoomIn(
                  curve: Curves.ease,
                  animate: loadingState,
                  delay: const Duration(milliseconds: 200),
                  child: const Center(
                    child: SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(color: whiteColor),
                    ),
                  ),
                )
              : SlideInUp(
                  curve: Curves.ease,
                  delay: const Duration(milliseconds: 200),
                  child: FittedBox(child: child),
                ),
          buttonColor: darkGrey,
          onTap: onTap,
        ),
      ],
    );
  }
}
