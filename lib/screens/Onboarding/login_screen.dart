import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_time/repositories/auth_repo.dart';
import 'package:news_time/screens/Onboarding/register_screen.dart';
import 'package:news_time/screens/Onboarding/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Theme/app_colors.dart';
import '../../stores/user_store.dart';
import '../../widgets/LabeledTextFormField.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final prefs = SharedPreferences.getInstance();

  // final LogInService _logInService = LogInService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // void logInUser() {
  //   _logInService.logIn(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //     context: context,
  //   );
  // }
  //
  // final NavigationService _navigationService =
  // get_it_instance_const<NavigationService>();

  final UserStore _userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
                Container(
                  // height: 300,
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16),
                    // color: AppColors.grey,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LabeledTextFormField(
                          controller: _emailController,
                          title: 'Email',
                          hintTitle: 'Enter your username'),
                      SizedBox(height: 16),
                      LabeledTextFormField(
                          controller: _passwordController,
                          title: 'Password',
                          hintTitle: 'Enter your password'),
                      SizedBox(height: 24),
                      MaterialButton(
                        color: AppColors.primaryAccent,
                        minWidth: 200,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        onPressed: () async {
                          final status = await UserStore().login(
                              email: _emailController.text,
                              password: _passwordController.text);
                          if (status) Navigator.popAndPushNamed(context, SplashScreen.id);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: 'New here?',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign Up!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff06e357),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.popAndPushNamed(
                                      context, RegisterScreen.id)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
