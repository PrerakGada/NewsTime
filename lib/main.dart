
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:news_time/screens/article_screen.dart';
import 'package:news_time/screens/home_screen.dart';
import 'package:news_time/screens/search_feed_screen.dart';
import 'package:news_time/screens/Onboarding/register_screen.dart';
import 'package:news_time/screens/dashboard.dart';
import 'package:provider/provider.dart';

import 'Theme/dark_theme.dart';
import 'Theme/light_theme.dart';

import 'firebase_options.dart';
import 'screens/onboarding/login_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/onboarding/splash_screen.dart';
import 'stores/user_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  // final db = FirebaseFirestore.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserStore>(
          create: (_) => UserStore(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: light_theme(),
        darkTheme: dark_theme(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,

        // initialRoute: ProviderVerification.id,
        // initialRoute: ProviderVerification.id,
        // initialRoute: ExploreMap.id,
        initialRoute: SplashScreen.id,
        //initialRoute: AdminDashBoard.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          DashboardScreen.id: (context) => DashboardScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          SearchFeedScreen.feedRoute: (context) => SearchFeedScreen(),
          ArticleScreen.articleRoute: (context) => ArticleScreen()
        },
      ),
    );
  }
}
