import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final Icon icon;

  const MenuIcon({super.key, required this.icon});

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
      height: 110,
      width: 80,
      child: Expanded(child: icon),
    );
  }
}
