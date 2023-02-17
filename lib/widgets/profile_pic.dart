import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String picUrl;
  final String name;
  final double radius;

  ProfilePic({Key? key, required this.picUrl, required this.name, this.radius = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        picUrl,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
