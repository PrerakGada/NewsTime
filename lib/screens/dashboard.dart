import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = 'dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Dashboard Screen'),
      ),
    );
  }
}
