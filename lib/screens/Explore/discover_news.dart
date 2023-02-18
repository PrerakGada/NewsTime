import 'package:flutter/material.dart';
import 'package:news_time/stores/user_store.dart';
import 'package:provider/provider.dart';

import '../../Theme/app_colors.dart';
import '../../widgets/discover_item.dart';

class DiscoverNews extends StatefulWidget {
  DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverNews> createState() => _DiscoverNewsState();
}

class _DiscoverNewsState extends State<DiscoverNews>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  final List<String> tabs = [
    "Recommended",
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    // _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              'Discover',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
            Text('News from all over the world',
                style: Theme.of(context).textTheme.bodySmall!),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _searchController,
                      onEditingComplete: () {
                        UserStore().search(searchText: _searchController.text);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        fillColor: AppColors.greyLight,
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
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: InkWell(
                              onTap: () async {
                                UserStore().selectedChip =
                                    tabs[index].toString();
                                await UserStore()
                                    .search(searchText: tabs[index].toString());
                              },
                              child: Chip(
                                backgroundColor: (UserStore().selectedChip ==
                                        tabs[index].toString())
                                    ? AppColors.primary
                                    : AppColors.greyLight,
                                label: Text(
                                  tabs[index].toString(),
                                  style: TextStyle(
                                      color: (UserStore().selectedChip ==
                                              tabs[index].toString())
                                          ? AppColors.white
                                          : AppColors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Consumer<UserStore>(builder: (_, userStore, __) {
                  final List<dynamic> searchPosts = userStore.searchPosts;
                  return (searchPosts.isNotEmpty)
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchPosts.length,
                          itemBuilder: (context, index) {
                            final currPost = searchPosts[index];
                            // print(currPost);
                            return DiscoverItem(currPost: currPost);
                          })
                      : Center(
                          child: Text('No NewsFeed'),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
