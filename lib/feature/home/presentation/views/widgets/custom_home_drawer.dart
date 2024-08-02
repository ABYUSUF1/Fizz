import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Fizz',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            _DrawerListTile(icon: Icons.home, text: 'Home', onTap: () {}),
            _DrawerListTile(
                icon: Icons.favorite, text: 'Favorite', onTap: () {}),
            _DrawerListTile(
                icon: Icons.shopping_cart, text: 'Cart', onTap: () {}),
            _DrawerListTile(icon: Icons.person, text: 'Profile', onTap: () {}),
            _DrawerListTile(icon: Icons.history, text: 'History', onTap: () {}),
            _DrawerListTile(
                icon: Icons.message, text: 'Contact us', onTap: () {}),
            _DrawerListTile(
                icon: Icons.settings, text: 'Settings', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const _DrawerListTile(
      {required this.icon, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
