import 'package:flutter/material.dart';

class SignInRow extends StatelessWidget {
  final double width;
  final double radius;
  final Color color;

  const SignInRow(
      {super.key,
      required this.width,
      required this.radius,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: width, color: color),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          height: 60,
          width: 60,
          child: Icon(Icons.android_rounded, color: color)),
      const SizedBox(width: 10),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: width, color: color),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          height: 60,
          width: 60,
          child: Icon(Icons.insert_emoticon, color: color)),
      const SizedBox(width: 10),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: width, color: color),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          height: 60,
          width: 60,
          child: Icon(Icons.apple, color: color)),
    ]);
  }
}
