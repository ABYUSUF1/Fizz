import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: const [
        Spacer(),
        HomeSearchField(),
        SizedBox(width: 14),
        HomeProfileButton()
      ],
    );
  }
}

class HomeProfileButton extends StatelessWidget {
  const HomeProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: 150,
          height: 50,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: whiteColor),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi, Youssef',
                style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.expand_more, size: 20)
            ],
          )),
    );
  }
}

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
            hintText: 'Search for clothes, glasses, etc.',
            filled: true,
            fillColor: whiteColor,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: const BoxDecoration(
                    color: darkGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: whiteColor,
                  )),
            )),
      ),
    );
  }
}
