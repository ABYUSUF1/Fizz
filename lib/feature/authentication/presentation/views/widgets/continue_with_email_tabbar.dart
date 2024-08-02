import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class ContinueWithEmailTabBar extends StatelessWidget {
  final TabController tabController;
  const ContinueWithEmailTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100,
        height: 430,
        color: whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Fizz',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
              flex: 10,
              child: RotatedBox(
                quarterTurns: 1,
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,
                    unselectedLabelStyle: const TextStyle(
                        color: lightGrey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceMono'),
                    labelStyle: const TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceMono'),
                    indicatorColor: lightGrey,
                    indicatorWeight: 7,
                    controller: tabController,
                    tabs: const [
                      Center(
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: Tab(
                                  text: 'Sign In', icon: Icon(Icons.login)))),
                      Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Tab(
                            text: 'Sign Up',
                            icon: Icon(
                              Icons.person_add,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
