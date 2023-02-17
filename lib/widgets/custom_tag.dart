import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({super.key, required this.bg, required this.children});
  final Color bg;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
