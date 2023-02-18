import 'package:flutter/material.dart';
import 'package:news_time/screens/Profile/edit_profile.dart';
import 'package:news_time/screens/Settings/settings.dart';
import 'package:news_time/screens/categories_drawer.dart';
import 'package:news_time/screens/liked_news_screen.dart';

import 'package:provider/provider.dart';

import '../../../Theme/app_colors.dart';
import '../../stores/user_store.dart';
import '../../widgets/profile_pic.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;
  var pageController = PageController();
  int currentindex = -1;
  List itemList = ['Add Preferences', 'Liked News', 'Bookmarks', 'Remove Post'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(username);
    return Scaffold(
      appBar: AppBar(
        leading: ProfilePic(
          // picUrl: "",
          picUrl: "https://jugaad-sahi-hai.mustansirg.in/static/" +
              UserStore().token['profile_photo'].toString(),
          name: UserStore().token['username'].toString(),
        ),
        title:
            Text("Welcome " + UserStore().token['username'].toString() + "!"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.pushNamed(context, Settings.id);
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfilePic(
                    // picUrl: "",
                    picUrl: "https://jugaad-sahi-hai.mustansirg.in/static/" +
                        UserStore().token['profile_photo'].toString(),
                    name: UserStore().token['username'].toString(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileStatItem(title: 'Posts', count: 0),
                        ProfileStatItem(title: 'Subscribers', count: 0),
                        ProfileStatItem(title: 'Subscribed', count: 0),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(context.watch<UserStore>().getUser()),
                  Consumer<UserStore>(builder: (_, userStore, __) {
                    // userStore.fetchCurrentUser();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prerak',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    );
                  }),

                  MaterialButton(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: AppColors.grey)),
                    onPressed: () {
                      Navigator.pushNamed(context, EditProfile.id);
                    },
                    child: Text('Edit Profile',
                        style: Theme.of(context).textTheme.headlineSmall
                        // ?.merge(const TextStyle(color: AppColors.grey)),
                        ),
                  ),
                ],
              ),
              Divider(thickness: 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // ProfileContentNavButton(
                    //   currentIndex: currentIndex,
                    //   index: 0,
                    //   icon: Icons.copy_rounded,
                    //   title: 'Posts',
                    //   onPress: () {
                    //     setState(() {
                    //       currentIndex = 0;
                    //       pageController.animateToPage(
                    //         0,
                    //         duration: const Duration(milliseconds: 200),
                    //         curve: Curves.linear,
                    //       );
                    //     });
                    //   },
                    // ),
                    // ProfileContentNavButton(
                    //   currentIndex: currentIndex,
                    //   index: 1,
                    //   icon: Icons.ios_share_rounded,
                    //   title: 'Activity',
                    //   onPress: () {
                    //     setState(() {
                    //       pageController.animateToPage(
                    //         1,
                    //         duration: const Duration(milliseconds: 200),
                    //         curve: Curves.linear,
                    //       );
                    //     });
                    //   },
                    // ),

                    // ProfileContentNavButton(
                    //   currentIndex: currentIndex,
                    //   index: 1,
                    //   icon: Icons.bookmark_border,
                    //   title: 'Saved',
                    //   onPress: () {
                    //     setState(() {
                    //       currentIndex = 1;
                    //       pageController.animateToPage(
                    //         1,
                    //         duration: const Duration(milliseconds: 200),
                    //         curve: Curves.linear,
                    //       );
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentindex = index;
                            });
                            currentindex == 0
                                ? Navigator.pushNamed(context, Categories.id)
                                : Navigator.pushNamed(context, LikedScreen.id);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text("${itemList[index]}  >"),
                          ),
                        ),
                      );
                    },
                    itemCount: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContentNavButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final String title;
  final int index;

  const ProfileContentNavButton({
    Key? key,
    required this.currentIndex,
    required this.onPress,
    required this.icon,
    required this.title,
    required this.index,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          currentIndex == index
              ? Icon(
                  icon,
                  color: AppColors.primary,
                )
              : Icon(
                  icon,
                ),
          currentIndex == index
              ? Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.greyDark,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ],
      ),
    );
  }
}

class ProfileStatItem extends StatelessWidget {
  final int count;
  final String title;

  const ProfileStatItem({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(count.toString(),
              style: Theme.of(context).textTheme.headlineSmall),
          Text(title, style: Theme.of(context).textTheme.headlineSmall
              // ?.merge(const TextStyle(color: AppColors.greyDark)),
              ),
        ],
      ),
    );
  }
}
