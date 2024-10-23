import 'package:flutter/material.dart';

class SignInRow extends StatelessWidget {
  const SignInRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          height: 60,
          width: 60,
          child: const Icon(Icons.android_rounded)),
      const SizedBox(width: 10),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          height: 60,
          width: 60,
          child: const Icon(Icons.insert_emoticon)),
      const SizedBox(width: 10),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          height: 60,
          width: 60,
          child: const Icon(Icons.apple)),
    ]);
  }
}
