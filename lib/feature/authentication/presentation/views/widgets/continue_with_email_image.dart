import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../app_assets.dart';
import '../../../../../core/utils/constants.dart';

class ContinueWithEmailImage extends StatelessWidget {
  final TabController tabController;
  const ContinueWithEmailImage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
          height: 520,
          color: darkGrey,
          child: TabBarView(controller: tabController, children: [
            FadeIn(
              delay: const Duration(milliseconds: 700),
              curve: Curves.ease,
              child: Image.asset(
                Assets.imagesManModel,
                fit: BoxFit.cover,
              ),
            ),
            FadeIn(
              delay: const Duration(milliseconds: 700),
              curve: Curves.ease,
              child: Image.asset(
                Assets.imagesChildModel,
              ),
            ),
          ])),
    );
  }
}
