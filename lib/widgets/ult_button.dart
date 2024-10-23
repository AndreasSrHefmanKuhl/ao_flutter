import 'package:flutter/material.dart';

class UltButton extends StatelessWidget {
  final Color bgColor;
  final double borderWidth;
  final double borderRadius;
  final String text;
  final Color textColor;
  final double btnHeight;
  final double btnWidth;

  const UltButton({
    super.key,
    required this.bgColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.text,
    required this.textColor,
    required this.btnHeight,
    required this.btnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(width: borderWidth),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        height: btnHeight,
        width: btnWidth,
        child: Text(
          text,
          style: TextStyle(color: textColor),
          textAlign: TextAlign.center,
        ));
  }
}
