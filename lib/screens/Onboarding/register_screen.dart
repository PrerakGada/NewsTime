
import 'package:flutter/material.dart';

import '../../widgets/LabeledTextFormField.dart';
import '../onboarding/login_screen.dart';

class SignUpPage extends StatefulWidget {
  @override
  static const String id = '/SignUpPage';

  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Text Editing Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  static const primary = Color(0xffc0e0b2);
  static const primaryAccent = Color(0xff2e6836);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAccent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabeledTextFormField(
                  controller: nameController,
                  title: "Name",
                  hintTitle: "Enter your name"),
              SizedBox(height: 18.0),
              LabeledTextFormField(
                  controller: emailController,
                  title: "Email",
                  hintTitle: "Enter your Email ID"),
              SizedBox(height: 18.0),
              LabeledTextFormField(
                  controller: passwordController,
                  title: "Password",
                  hintTitle: "Enter your Password"),
              SizedBox(height: 18.0),
              LabeledTextFormField(
                  controller: confirmPasswordController,
                  title: "Confirm Password",
                  hintTitle: "Confirm your password"),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Aldready a user',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        textStyle: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  ElevatedButton(
                    child: Text(
                      'Register as a Provider',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // Navigator.popAndPushNamed(
                      //     context, ProviderVerification.id);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        textStyle: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    // if (await AuthRepo().signup(
                    //     nameController.text,
                    //     emailController.text,
                    //     passwordController.text,
                    //     'customer')) {
                    //   Navigator.popAndPushNamed(context, SplashScreen.id);
                    // }
                    //   try {
                    //     final credential = await FirebaseAuth.instance
                    //         .createUserWithEmailAndPassword(
                    //       email: emailController.text,
                    //       password: passwordController.text,
                    //     );
                    //   } on FirebaseAuthException catch (e) {
                    //     if (e.code == 'weak-password') {
                    //       print('The password provided is too weak.');
                    //     } else if (e.code == 'email-already-in-use') {
                    //       print(
                    //           'The account already exists for that email.');
                    //     }
                    //   } catch (e) {
                    //     print(e);
                    //   }
                    // Navigator.popAndPushNamed(context, LoginScreen.id);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        color: primaryAccent,
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
