import 'dart:ui';
import 'package:ao/config/sizes.dart';
import 'package:flutter/material.dart';

class VeriCont extends StatelessWidget {
  const VeriCont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 65,
      decoration: BoxDecoration(
          color: Colors.white38,
          border: Border.all(width: btnBorderRadius),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: const TextField(
        cursorHeight: 60,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: headlineTextSize),
        selectionHeightStyle: BoxHeightStyle.max,
        selectionWidthStyle: BoxWidthStyle.max,
      ),
    );
  }
}
