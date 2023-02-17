import 'package:flutter/material.dart';

import 'package:news_time/screens/home_screen.dart';
import 'package:news_time/screens/search_feed_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 30),
              child: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.homescreenRoute);
                },
              ),
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, SearchFeed.feedRoute);
              },
            ),
            label: "Search"),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
            label: "Settings")
      ],
    );
  }
}
