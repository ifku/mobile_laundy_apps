import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final Color backgroundColor;
  final Color unselectedItemColor;
  final Color selectedItemColor;
  final int currentIndex;
  final bool showLabel;
  final ValueChanged<int> onTap;

  const CustomBottomNavbar({
    super.key,
    required this.items,
    this.backgroundColor = Colors.white,
    this.unselectedItemColor = Colors.grey,
    this.selectedItemColor = Colors.blue,
    this.currentIndex = 0,
    this.showLabel = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: showLabel,
      showSelectedLabels: showLabel,
      type: BottomNavigationBarType.fixed,
      iconSize: 26,
      backgroundColor: backgroundColor,
      unselectedItemColor: unselectedItemColor,
      selectedItemColor: selectedItemColor,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
    );
  }
}
