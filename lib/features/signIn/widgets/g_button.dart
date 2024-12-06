import 'package:ao/config/colors.dart';
import 'package:ao/config/sizes.dart';
import 'package:ao/features/signIn/screens/veri_screen.dart';
import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:flutter/material.dart';

class GButton extends StatelessWidget {
  final GestureTapCallback onTap;
  const GButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return UltButton(
      onTap: onTap,
      btnHeight: btnHeight,
      btnWidth: btnWidth,
      bgColor: bgColor,
      borderRadius: btnBorderRadius,
      borderWidth: btnBorderWidth,
      text: 'Registry',
      textColor: borderWhite,
      borderColor: borderWhite,
    );
  }
}
