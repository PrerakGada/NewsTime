import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:news_time/screens/Explore/article_screen.dart';
import 'package:news_time/screens/Explore/business_screen.dart';
import 'package:news_time/widgets/bottom_nav_bar.dart';
import 'package:news_time/widgets/image_container.dart';

import '../../Theme/app_colors.dart';
import '../../stores/user_store.dart';
import 'discover_news.dart';

class SearchFeedScreen extends StatefulWidget {
  SearchFeedScreen({super.key});

  static const id = '/feed';

  @override
  State<SearchFeedScreen> createState() => _SearchFeedScreenState();
}

class _SearchFeedScreenState extends State<SearchFeedScreen> {
  bool _showFirstScreen = true;
  final PageController _pageController = PageController();

  void _toggleScreen() {
    setState(() {
      _showFirstScreen = !_showFirstScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      "Business",
      "Entertainment",
      "General",
      "Coronavirus",
      "Science",
      "Cricket",
      "Football",
      "Technology",
      "Artificial Intelligence",
      "Tennis",
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          // onPressed: _toggleScreen,
          backgroundColor: Colors.black,
          onPressed: () {
            _toggleScreen();
            // callApis();
            UserStore().RefreshToken;
            _pageController.animateToPage(_showFirstScreen ? 0 : 1,
                duration: Duration(milliseconds: 100), curve: Curves.linear);
            // _showFirstScreen ? Navigator.pushReplacement(context, BusinessScreen()) :
          },
          child: Icon(
            Icons.swap_horiz,
            color: Colors.white,
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            DiscoverNews(),
            BusinessScreen(),
          ],
        ),
        // body: _showFirstScreen ? FirstScreen(tabs: tabs) : BusinessScreen(),
      ),
    );
  }
}
