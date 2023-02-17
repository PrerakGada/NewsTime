import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:news_time/screens/Explore/article_screen.dart';
import 'package:news_time/screens/Explore/business_screen.dart';
import 'package:news_time/widgets/bottom_nav_bar.dart';
import 'package:news_time/widgets/image_container.dart';

import '../../Theme/app_colors.dart';
import '../../stores/user_store.dart';
import 'first_feed_screen.dart';

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
      "Recommended",
      "Health",
      "Politics",
      "Art",
      "Food",
      "Science"
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          // onPressed: _toggleScreen,
          onPressed: () {
            _toggleScreen();
            // callApis();
            UserStore().RefreshToken;
            _pageController.animateToPage(_showFirstScreen ? 0 : 1,
                duration: Duration(milliseconds: 100), curve: Curves.linear);
            // _showFirstScreen ? Navigator.pushReplacement(context, BusinessScreen()) :
          },
          child: Icon(Icons.swap_horiz),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            FirstScreen(),
            BusinessScreen(),
          ],
        ),
        // body: _showFirstScreen ? FirstScreen(tabs: tabs) : BusinessScreen(),
      ),
    );
  }
}


