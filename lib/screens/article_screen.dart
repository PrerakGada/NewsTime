import 'package:flutter/material.dart';
import 'package:news_time/Theme/app_colors.dart';
import 'package:news_time/widgets/image_container.dart';

import '../widgets/custom_tag.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});
  static const articleRoute = "/articleRoute";

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      imageUrl: "assets/gradient.png",
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back_ios),
        ),
        body: ListView(children: [_NewsHeadline()]),
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomTag(bg: AppColors.grey.withAlpha(150), children: [
            Text(
              'Politics',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                  ),
            )
          ]),
        ],
      ),
    );
  }
}
