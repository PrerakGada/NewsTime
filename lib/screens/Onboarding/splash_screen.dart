import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_time/screens/dashboard.dart';
import 'package:news_time/stores/user_store.dart';

import '../onboarding/login_screen.dart';
import 'register_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splashscreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool isLoggedIn = false;
  late bool isAdmin = false;
  late bool isProvider = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UserStore().refresh();
      await handleNavigation();
      // await UserStore().getCurrUser();
      // await UserStore().fetchPendingProviders();
      // await UserStore().fetchPendingOrders("");
      // await UserStore().fetchNearestRestros("");
    });
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn);
    _animationController.forward();
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => (UserStore().token != null)
              ? DashboardScreen()
              : LoginScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
    );
  }

  handleNavigation() async {
    print(UserStore().token);
    // if (UserStore().currUser)

    // if (FirebaseAuth.instance.currentUser != null) {
    //   print(UserStore().currUser);
    //   print(await UserStore().getCurrUser());
    //   isLoggedIn = true;
    //   if (UserStore().currUser['role'] == 'admin') isAdmin = true;
    //   print(isAdmin);
    //   if (UserStore().currUser['role'] == 'provider') isProvider = true;
    //   print(isProvider);
    //   print("-------------------------------------------->" +
    //       UserStore().currUser['role'].toString());
    // } else {
    //   print('NO LOGINS');
    //   isLoggedIn = false;
    // }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE81667),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image(
            image: const AssetImage(
              'assets/logo_nobg.png',
            ),
            // height: 480,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
