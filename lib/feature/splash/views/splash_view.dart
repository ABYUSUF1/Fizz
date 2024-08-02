import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../authentication/presentation/views/welcome_to_fizz.dart';
import '../../home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    // Simulate a delay to show the splash screen
    await Future.delayed(const Duration(seconds: 2));

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // Navigate to SignInPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeToFizzView()),
        );
      } else {
        // Navigate to HomePage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fizz',
              style: TextStyle(
                  fontSize: size.width / 40, fontWeight: FontWeight.w900),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              curve: Curves.ease,
              child: SizedBox.square(
                dimension: size.width / 15,
                child: Lottie.asset(
                  'assets/lotties/loading_indicator.json',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
