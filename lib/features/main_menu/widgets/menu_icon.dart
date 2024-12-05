import 'package:ao/config/sizes.dart';
import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const MenuIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 195, 245, 255),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(14))),
      height: 2 * bigDistance,
      width: bigDistance,
      child: Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Icon(
              icon,
              size: 60,
            ),
            Text(
              text,
              style: const TextStyle(fontStyle: FontStyle.italic),
            )
          ])),
    );
  }
}
