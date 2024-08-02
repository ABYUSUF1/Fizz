import 'package:flutter/material.dart';

import 'custom_home_drawer.dart';
import 'home_desktop_view_body.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: CustomHomeDrawer()),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: HomeDesktopViewBody(),
          ),
        )
      ],
    );
  }
}
