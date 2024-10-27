import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String text;

  const InputField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350,
        height: 25,
        child: TextField(
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
          decoration: InputDecoration(helperText: text),
        ));
  }
}
