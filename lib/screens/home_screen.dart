import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_time/Theme/app_colors.dart';
import 'package:news_time/screens/Profile/profile_screen.dart';
import 'package:news_time/screens/Explore/search_feed_screen.dart';
import 'package:news_time/widgets/custom_tag.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

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

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          )),
      extendBodyBehindAppBar: true,
      body: ListView(
          padding: EdgeInsets.zero,
          children: [_NewsOftheDay(), _BreakingNews()]),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    Key? key,
  }) : super(key: key);

  Future<List<dynamic>> callApis() async {
    var dio = Dio();
    dio.options.baseUrl = 'https://jugaad-sahi-hai.mustansirg.in/';

    final response = await dio.get('/news/');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'For You',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'More',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 400,
            child: FutureBuilder(
              future: callApis(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 230,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                        "${snapshot.data![index]["urlToImage"]}",
                                      ))),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: -1,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 90,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${snapshot.data![index]["title"]}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        // color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.5),
                                              ),
                                              Text(
                                                '${snapshot.data![index]["description"]}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        // color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      '${snapshot.data![index]["source"]}',
                                                      maxLines: 2,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!),
                                                  Spacer(),
                                                  Text(
                                                      '${DateTime.now().hour} hours ago',
                                                      maxLines: 2,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              )
                              // child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [

                              //     ]),
                              );
                          // return Container(
                          //   width: size.width * 0.1,
                          //   height: 100,
                          //   padding: EdgeInsets.only(right: 10),
                          //   child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         ImageContainer(
                          //             width: size.width * 0.4,
                          //             imageUrl:
                          //                 "${snapshot.data![index]["urlToImage"]}",
                          //             decide: true),
                          //         const SizedBox(
                          //           height: 10,
                          //         ),
                          //         Text(
                          //           '${snapshot.data![index]["title"]}',
                          //           maxLines: 2,
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .bodyLarge!
                          //               .copyWith(
                          //                   // color: AppColors.black,
                          //                   fontWeight: FontWeight.bold,
                          //                   height: 1.5),
                          //         ),
                          //         const SizedBox(
                          //           height: 5,
                          //         ),
                          //         Text('${DateTime.now().hour} hours ago',
                          //             maxLines: 2,
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .bodySmall!),
                          //         Text(
                          //             '${snapshot.data![index]["source"]["name"]}',
                          //             maxLines: 2,
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .bodySmall!),
                          //       ]),
                          // );
                        },
                        itemCount: 20,
                      );
                    } else {
                      return const Text("No data yet");
                    }
                }
              },
            ),
            // child:
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near You',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'More',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 350,
            child: FutureBuilder(
              future: callApis(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        // gridDelegate:
                        //     const SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisCount: 2,
                        //         mainAxisExtent: 230,
                        //         crossAxisSpacing: 12,
                        //         mainAxisSpacing: 12,
                        //         childAspectRatio: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: size.width * 0.5,
                            height: 100,
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageContainer(
                                      width: size.width * 0.4,
                                      imageUrl:
                                          "${snapshot.data![index + 5]["urlToImage"]}",
                                      decide: true),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${snapshot.data![index + 5]["title"]}',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            // color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            height: 1.5),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('${DateTime.now().hour} hours ago',
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!),
                                  Text('${snapshot.data![index]["source"]}',
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!),
                                ]),
                          );
                          // return Container(
                          //   width: size.width * 0.1,
                          //   height: 100,
                          //   padding: EdgeInsets.only(right: 10),
                          //   child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         ImageContainer(
                          //             width: size.width * 0.4,
                          //             imageUrl:
                          //                 "${snapshot.data![index]["urlToImage"]}",
                          //             decide: true),
                          //         const SizedBox(
                          //           height: 10,
                          //         ),
                          //         Text(
                          //           '${snapshot.data![index]["title"]}',
                          //           maxLines: 2,
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .bodyLarge!
                          //               .copyWith(
                          //                   // color: AppColors.black,
                          //                   fontWeight: FontWeight.bold,
                          //                   height: 1.5),
                          //         ),
                          //         const SizedBox(
                          //           height: 5,
                          //         ),
                          //         Text('${DateTime.now().hour} hours ago',
                          //             maxLines: 2,
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .bodySmall!),
                          //         Text(
                          //             '${snapshot.data![index]["source"]["name"]}',
                          //             maxLines: 2,
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .bodySmall!),
                          //       ]),
                          // );
                        },
                        itemCount: 20,
                      );
                    } else {
                      return const Text("No data yet");
                    }
                }
              },
            ),
            // child:
          )
        ],
      ),
    );
  }
}

class _NewsOftheDay extends StatelessWidget {
  const _NewsOftheDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.50,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decide: true,
      imageUrl:
          "https://i.guim.co.uk/img/media/fdec7ccbac99e998401759127a3b0109266a91e7/0_372_8640_5184/master/8640.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctbGl2ZS5wbmc&enable=upscale&s=59e90f8c384dde8443cebb9292f5e4e9",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(bg: AppColors.grey.withAlpha(150), children: [
            Text(
              'News of the Day',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                  ),
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          Text('Heavy Seize Fire Reported Near Kashmir Loc.',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25)),
          TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Learn More",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_right_alt,
                    color: AppColors.white,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
