import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final String text;
  final Icon icon;

  const MenuIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(14))),
      height: 200,
      width: 180,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Expanded(flex: 1, child: icon)]),
    );
  }
}
