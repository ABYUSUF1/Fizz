import 'package:fizz/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'widgets/welcome_to_fizz_desktop_view.dart';
import 'widgets/welcome_to_fizz_mobile_view.dart';

class WelcomeToFizzView extends StatelessWidget {
  const WelcomeToFizzView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: lightGrey2,
      body: ResponsiveLayout(
        mobile: WelcomeToFizzMobileView(),
        tablet: WelcomeToFizzMobileView(),
        desktop: WelcomeToFizzDesktopView(),
      ),
    );
  }
}
