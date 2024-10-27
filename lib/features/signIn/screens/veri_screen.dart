import 'package:ao/config/colors.dart';
import 'package:ao/config/sizes.dart';
import 'package:ao/config/themes.dart';
import 'package:ao/features/signIn/widgets/sign_in_row.dart';
import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:ao/features/signIn/widgets/veri_code_text.dart';
import 'package:ao/features/signIn/widgets/veri_row.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const VeriScreen());
}

class VeriScreen extends StatelessWidget {
  const VeriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 155,
            left: 8,
            child: Expanded(
              child: VeriCodeText(),
            ),
          ),
          Positioned(
            left: 60,
            bottom: 450,
            child: VeriRow(),
          ),
          mediumVerticalSpace,
          Positioned(
              left: 125,
              bottom: 300,
              child: UltButton(
                  bgColor: bgColor,
                  borderWidth: btnBorderWidth,
                  borderRadius: btnBorderRadius,
                  text: 'Submit',
                  textColor: borderBlack,
                  btnHeight: btnHeightAlt,
                  btnWidth: btnWidthAlt,
                  borderColor: borderBlack)),
          Positioned(
              bottom: 150,
              left: 100,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('or'),
                minVerticalSpace,
                SignInRow(
                  width: btnBorderWidth,
                  radius: btnBorderRadius,
                  color: borderBlack,
                ),
              ])),
        ]),
      ),
    );
  }
}
