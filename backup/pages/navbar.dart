import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  NavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            backgroundColor: Colors.grey[600],
            icon: Icons.home,
            text: 'shop',
            iconSize: 30,
          ),
          GButton(
            backgroundColor: Colors.grey[600],
            icon: Icons.shopping_bag,
            text: 'shop',
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
