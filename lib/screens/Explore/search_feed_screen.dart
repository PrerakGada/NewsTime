import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:news_time/screens/article_screen.dart';
import 'package:news_time/widgets/bottom_nav_bar.dart';
import 'package:news_time/widgets/image_container.dart';

import '../../Theme/app_colors.dart';

class SearchFeedScreen extends StatefulWidget {
  const SearchFeedScreen({super.key});

  static const id = '/feed';

  @override
  State<SearchFeedScreen> createState() => _SearchFeedScreenState();
}

class _SearchFeedScreenState extends State<SearchFeedScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ["Health", "Politics", "Art", "Food", "Science"];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            )),
        body: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            children: [const _DiscoverNews(), _CustomTabs(tabs: tabs)]),
      ),
    );
  }
}

class _CustomTabs extends StatelessWidget {
  const _CustomTabs({
    Key? key,
    required this.tabs,
  }) : super(key: key);
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: tabs
              .map((e) => Tab(
                    icon: Text(
                      e,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ))
              .toList(),
          indicatorColor: Colors.black,
          isScrollable: true,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: tabs
                  .map((e) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ArticleScreen.id);
                            },
                            child: Row(children: [
                              const ImageContainer(
                                width: 80,
                                imageUrl: "assets/gradient.png",
                                height: 80,
                                decide: false,
                                margin: EdgeInsets.all(10),
                                borderRadius: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Voluptua sit est sit sed accusam elitr eos amet voluptua. Dolor dolores dolor lorem labore.",
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.schedule,
                                          size: 18,
                                          // color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text('${DateTime.now().hour} hours ago',
                                            maxLines: 2,
                                            style:
                                                const TextStyle(fontSize: 12)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Icon(
                                          Icons.visibility,
                                          // color: Colors.grey,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text('300 views',
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                          );
                        },
                      ))
                  .toList()),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
          ),
          Text('News from all over the world',
              style: Theme.of(context).textTheme.bodySmall!),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.grey,
                ),
                suffixIcon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune,
                    color: AppColors.grey,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
