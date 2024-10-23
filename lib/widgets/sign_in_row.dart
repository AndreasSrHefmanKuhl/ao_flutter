import 'package:flutter/material.dart';

class SignInRow extends StatelessWidget {
  final double width;
  final double radius;

  const SignInRow({super.key, required this.width, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: width),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          height: 60,
          width: 60,
          child: const Icon(Icons.android_rounded)),
      const SizedBox(width: 10),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: width),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          height: 60,
          width: 60,
          child: const Icon(Icons.insert_emoticon)),
      const SizedBox(width: 10),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: width),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          height: 60,
          width: 60,
          child: const Icon(Icons.apple)),
    ]);
  }
}
