// import 'package:eat_easy/repositories/auth_repo.dart';
// import 'package:eat_easy/screens/login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../Theme/app_colors.dart';
// import '../widgets/LabeledTextFormField.dart';
//
// import 'package:flutter/gestures.dart';
//
// class SignUpScreen extends StatefulWidget {
//   static const String id = '/signup';
//
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Sign Up',
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 24),
//                 Container(
//                   height: 400,
//                   width: 300,
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: AppColors.grey,
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     // mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       LabeledTextFormField(
//                           controller: _nameController,
//                           title: 'Name',
//                           hintTitle: 'Enter your name'),
//                       const SizedBox(height: 16),
//                       LabeledTextFormField(
//                           controller: _emailController,
//                           title: 'Email',
//                           hintTitle: 'Enter your email'),
//                       const SizedBox(height: 16),
//                       LabeledTextFormField(
//                           controller: _passwordController,
//                           title: 'Password',
//                           hintTitle: 'Enter your password'),
//                       const SizedBox(height: 24),
//                       MaterialButton(
//                         color: AppColors.primaryAccent,
//                         minWidth: 200,
//                         padding: const EdgeInsets.all(16),
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(8),
//                           ),
//                         ),
//                         onPressed: () async {
//                           if (await AuthRepo().login(_emailController.text,
//                               _passwordController.text)) {
//                             Navigator.popAndPushNamed(context, LoginScreen.id);
//                           } else {
//                             print('Error in login');
//                           }
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: AppColors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Already have an account?',
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: AppColors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: ' Click here!',
//                                 style:̉̉̉̉̉̉ const TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xff06e357),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () => Navigator.popAndPushNamed(
//                                       context, LoginScreen.id)),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
