import 'package:flutter/material.dart';
import 'package:news_time/Theme/app_colors.dart';
import 'package:news_time/screens/Profile/profile_screen.dart';
import 'package:news_time/screens/Explore/search_feed_screen.dart';

import 'Explore/news_feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const id = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: [
          NewsFeedScreen(),
          SearchFeedScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: AppColors.primary),
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.black,
        onTap: (index) {
          _pageController.animateToPage(
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
      ),
    );
  }
}
