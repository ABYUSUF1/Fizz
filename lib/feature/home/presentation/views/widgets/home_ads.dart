import 'package:flutter/material.dart';

import '../../../../../app_assets.dart';
import '../../../../../core/utils/constants.dart';

class HomeAds extends StatelessWidget {
  const HomeAds({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(20),
              color: whiteColor,
              child: Text('Buy One Get One Free !',
                  style: TextStyle(
                    fontSize: 30,
                  ))),
          Image.asset(
            Assets.imagesGirlModel2,
            alignment: Alignment.topRight,
          )
        ],
      ),
    );
  }
}
