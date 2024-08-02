import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import 'widgets/continue_with_email_image.dart';
import 'widgets/continue_with_email_tabbar.dart';
import 'widgets/continue_with_email_tabbar_body.dart';

class ContinueWithEmailView extends StatefulWidget {
  const ContinueWithEmailView({super.key});

  @override
  State<ContinueWithEmailView> createState() => _ContinueWithEmailViewState();
}

class _ContinueWithEmailViewState extends State<ContinueWithEmailView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        length: 2, vsync: this, animationDuration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightGrey2,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width / 1.3,
                height: 600,
                child: Row(children: [
                  ContinueWithEmailTabBar(tabController: tabController),
                  size.width < 900
                      ? const SizedBox(width: 20)
                      : ContinueWithEmailImage(tabController: tabController),
                  ContinueWithEmailTabBarBody(tabController: tabController),
                ]),
              ),
              const Text(
                  'By signing in you agree to our Privacy Policy, for more information please contact us',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
