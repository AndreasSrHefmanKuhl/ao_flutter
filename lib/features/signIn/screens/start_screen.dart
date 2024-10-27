import 'package:ao/config/colors.dart';
import 'package:ao/config/sizes.dart';
import 'package:ao/features/signIn/widgets/sign_in_row.dart';
import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:flutter/material.dart';

import 'package:ao/config/themes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 150,
            right: 90,
            child: Column(children: [
              const SignInRow(
                width: btnBorderWidth,
                radius: btnBorderRadius,
                color: borderWhite,
              ),
              minVerticalSpace,
              const Row(children: [
                Divider(
                  height: 2,
                  thickness: 10,
                ),
                Text('or'),
                Divider(
                  height: 2,
                  thickness: 10,
                ),
              ]),
              minVerticalSpace,
              const UltButton(
                btnHeight: btnHeight,
                btnWidth: btnWidth,
                bgColor: bgColor,
                borderRadius: btnBorderRadius,
                borderWidth: btnBorderWidth,
                text: 'Registry',
                textColor: borderWhite,
                borderColor: borderWhite,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
