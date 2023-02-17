import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
    required this.index,
    required this.pageController,
  }) : super(key: key);

  final int index;
  final PageController pageController;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(color: AppColors.primary),
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
      onTap: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      },
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.flash_on, color: AppColors.primary),
          label: 'NewsFeed',
          icon: Icon(Icons.flash_on_outlined),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.explore, color: AppColors.primary),
          label: 'Explore',
          icon: Icon(Icons.explore_outlined),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.person, color: AppColors.primary),
          label: 'Profile',
          icon: Icon(Icons.person_outline),
        ),
      ],
    );
  }
}
