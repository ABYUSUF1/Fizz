import 'package:fizz/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'widgets/home_desktop_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //   // Get the current user from Firebase Auth
    //   final User? user = FirebaseAuth.instance.currentUser;

    //   // Create an instance of UserInfoService with the current user
    //   final userInfo = UserAuthInfoModel(user: user!);

    return Scaffold(
      backgroundColor: lightGrey2,
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: Container(),
          desktop: const HomeDesktopView(),
        ),
      ),
    );
  }
}
