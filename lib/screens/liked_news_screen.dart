import 'package:flutter/material.dart';

class LikedNews extends StatefulWidget {
  const LikedNews({super.key});
  static const id = '/likedNewsRoute';

  @override
  State<LikedNews> createState() => _LikedNewsState();
}

class _LikedNewsState extends State<LikedNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
    );
  }
}
