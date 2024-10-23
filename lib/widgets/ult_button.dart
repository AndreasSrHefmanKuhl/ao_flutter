import 'package:flutter/material.dart';

class UltButton extends StatelessWidget {
  const UltButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        height: 35,
        width: 250,
        child: const Text(
          ' register urself for membership',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          textAlign: TextAlign.center,
        ));
  }
}
