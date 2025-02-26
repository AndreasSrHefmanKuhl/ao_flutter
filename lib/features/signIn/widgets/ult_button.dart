import 'package:flutter/material.dart';

class UltButton extends StatelessWidget {
  final Color bgColor;
  final double borderWidth;
  final double borderRadius;
  final String text;
  final Color textColor;
  final double btnHeight;
  final double btnWidth;
  final Color borderColor;
  final GestureTapCallback onTap;

  const UltButton(
      {super.key,
      required this.bgColor,
      required this.borderWidth,
      required this.borderRadius,
      required this.text,
      required this.textColor,
      required this.btnHeight,
      required this.btnWidth,
      required this.borderColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(width: borderWidth, color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
            height: btnHeight,
            width: btnWidth,
            child: Text(
              text,
              style: TextStyle(color: textColor),
              textAlign: TextAlign.center,
            )));
  }
}
