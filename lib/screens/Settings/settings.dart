import 'package:flutter/material.dart';
import 'package:news_time/screens/Onboarding/splash_screen.dart';
import 'package:news_time/screens/Profile/edit_profile.dart';
import 'package:provider/provider.dart';

import '../../Theme/app_colors.dart';
import '../../stores/user_store.dart';
import '../../widgets/profile_pic.dart';

class Settings extends StatefulWidget {
  static const String id = '/settings';
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List iconList = [
    const Icon(Icons.language, size: 24, color: Colors.black),
    const Icon(Icons.interests_outlined, size: 24, color: Colors.black),
    const Icon(Icons.feedback_outlined, size: 24, color: Colors.black),
    const Icon(Icons.mail_outline, size: 24, color: Colors.black),
    const Icon(Icons.insert_chart, size: 24, color: Colors.black),
    const Icon(Icons.dock_outlined, size: 24, color: Colors.black),
    const Icon(Icons.lock_clock_outlined, size: 24, color: Colors.black),
    const Icon(Icons.logout, size: 24, color: Colors.black),
  ];

  Widget box(String title, Icon iconData) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 80,
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(color: Colors.black, fontSize: 20)),
          // Icon(iconData, size: 70, color: Colors.black),
          iconData,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            // color: AppColors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer<UserStore>(builder: (_, userStore, __) {
                                return ProfilePic(
                                  picUrl: "https://jugaad-sahi-hai.mustansirg.in/static/" + UserStore().token['profile_photo'].toString(),
                                  name: UserStore().token['username'].toString(),);
                              }),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<UserStore>(builder: (_, userStore, __) {
                    return Text(
                      'sdv',
                      style: Theme.of(context).textTheme.headlineLarge,
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: AppColors.grey)),
                      onPressed: () {
                        Navigator.pushNamed(context, EditProfile.id);
                      },
                      child: Text(
                        'Edit Profile',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.merge(const TextStyle()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Added space between text and icon, divider and padding.
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: [
                  // SettingsOption(
                  //   title: 'Language',
                  //   icon: Icons.language_outlined,
                  //   onPress: () async {},
                  // ),
                  // const Divider(thickness: 1.0),
                  // SettingsOption(
                  //   title: 'Change your interests',
                  //   icon: Icons.interests_outlined,
                  //   onPress: () async {},
                  // ),
                  // const Divider(thickness: 1.0),
                  // SettingsOption(
                  //   title: 'Feedbacks',
                  //   icon: Icons.feedback_outlined,
                  //   onPress: () async {},
                  // ),
                  // const Divider(thickness: 1.0),
                  SettingsOption(
                    title: 'Contact us',
                    icon: Icons.mail_outline,
                    onPress: () async {},
                  ),
                  const Divider(thickness: 1.0),
                  // SettingsOption(
                  //   title: 'Insights',
                  //   icon: Icons.insights_outlined,
                  //   onPress: () async {},
                  // ),
                  // const Divider(thickness: 1.0),
                  SettingsOption(
                    title: 'Terms & Conditions',
                    icon: Icons.document_scanner,
                    onPress: () {
                      // _navigationService.navigateTo(RoutePath.TermsCondition);
                    },
                  ),
                  const Divider(thickness: 1.0),
                  SettingsOption(
                    title: 'Privacy Policy',
                    icon: Icons.lock_outline,
                    onPress: () {
                      // _navigationService.navigateTo(RoutePath.Privacy);
                    },
                  ),
                  const Divider(thickness: 1.0),
                  // SettingsOption(
                  //   title: 'Change Theme',
                  //   icon: Icons.color_lens_sharp,
                  //   onPress: () {
                  //     _navigationService.navigateTo(RoutePath.ChangeTheme);
                  //   },
                  // ),
                  // const Divider(thickness: 1.0),
                  SettingsOption(
                    title: 'Logout',
                    icon: Icons.logout,
                    onPress: () async {
                      await UserStore().logout();
                      Navigator.popAndPushNamed(context, SplashScreen.id);
                    },
                  ),
                  const Divider(thickness: 1.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const SettingsOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 24),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.merge(const TextStyle()),
          ),
        ],
      ),
    );
  }
}
