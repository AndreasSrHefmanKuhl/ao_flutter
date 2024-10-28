import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final String text;
  final Icon icon;

  const MenuIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(14))),
      height: 50,
      width: 50,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(text), icon]),
    );
  }
}
