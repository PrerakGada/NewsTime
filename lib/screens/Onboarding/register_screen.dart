import 'package:flutter/material.dart';
import 'package:news_time/Theme/app_colors.dart';
import 'package:news_time/screens/Onboarding/splash_screen.dart';
import 'package:news_time/stores/user_store.dart';

import '../../repositories/auth_repo.dart';
import '../../widgets/LabeledTextFormField.dart';
import '../onboarding/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register';

  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Text Editing Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabeledTextFormField(
                  controller: _nameController,
                  title: "Name",
                  hintTitle: "Enter your name"),
              SizedBox(height: 18.0),
              LabeledTextFormField(
                  controller: _emailController,
                  title: "Email",
                  hintTitle: "Enter your Email ID"),
              SizedBox(height: 18.0),
              LabeledTextFormField(
                  controller: _passwordController,
                  title: "Password",
                  hintTitle: "Enter your Password"),
              SizedBox(height: 18.0),
              LabeledTextFormField(
                  controller: _confirmPasswordController,
                  title: "Confirm Password",
                  hintTitle: "Confirm your password"),
              SizedBox(height: 30.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    bool success = await UserStore().register(
                        password1: _passwordController.text,
                        password2: _confirmPasswordController.text,
                        email: _emailController.text,
                        username: _nameController.text);
                    if (success) Navigator.pushReplacementNamed(context, SplashScreen.id);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
