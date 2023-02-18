import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.width,
    this.height = 125,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.child,
    this.decide,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;
  final bool? decide;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: decide == true
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
      child: child,
    );
  }
}
