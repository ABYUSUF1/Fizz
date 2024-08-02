import 'package:flutter/material.dart';

import 'home_appbar.dart';
import 'home_collections.dart';
import 'home_products.dart';

class HomeDesktopViewBody extends StatelessWidget {
  const HomeDesktopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(),
            SizedBox(height: 10),
            // HomeAds(),
            HomeCollections(),
            SizedBox(height: 10),
            HomeProducts(),
          ],
        ),
      ),
    );
  }
}
