import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Theme/app_colors.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    initMessaging();
    super.initState();
  }

  void initMessaging() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FlutterLocalNotificationsPlugin fltNotification =
        FlutterLocalNotificationsPlugin();
    var androiInit = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInit = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit);

    fltNotification.initialize(initSetting);
    var androidDetails =
        const AndroidNotificationDetails("default", "channel name");
    var iosDetails = const DarwinNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              // Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/Onboarding1.png'))),)
              Container(
                  child:
                      Image.asset('assets/Onboarding1.png', fit: BoxFit.fill)),
              Container(
                  child:
                      Image.asset('assets/Onboarding2.png', fit: BoxFit.fill)),
              Container(
                  child:
                      Image.asset('assets/Onboarding3.png', fit: BoxFit.fill)),
            ],
          ),
          Positioned(
            // alignment: Alignment.center,
            bottom: 60,
            left: MediaQuery.of(context).size.width * 0.5 - 32,
            child: Column(
              children: [
                SmoothPageIndicator(
                  count: 3,
                  controller: _pageController,
                  effect: const WormEffect(
                    dotWidth: 16,
                    dotHeight: 4,
                    activeDotColor: AppColors.primaryAccent,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  color: AppColors.primaryAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    setState(() {
                      currentPage != 2
                          ? _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            )
                          : Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                // pageBuilder: (_, __, ___) => AdminDashBoard(),
                                pageBuilder: (_, __, ___) => LoginScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            );
                    });
                  },
                  child: currentPage != 2
                      ? const Text('Next',
                          style: TextStyle(color: AppColors.white))
                      : const Text('Get Started',
                          style: TextStyle(color: AppColors.white)),
                ),
                SizedBox(height: 24)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
