import 'package:ao/config/sizes.dart';
import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const MenuIcon(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 195, 245, 255),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(14))),
      height: 2 * bigDistance,
      width: bigDistance,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            icon,
            size: 65,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 8,
          ),
        )
      ]),
    );
  }
}
