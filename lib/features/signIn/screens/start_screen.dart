import 'package:ao/config/colors.dart';
import 'package:ao/config/sizes.dart';

import 'package:ao/features/signIn/screens/veri_screen.dart';
import 'package:ao/features/signIn/widgets/g_button.dart';
import 'package:ao/features/signIn/widgets/sign_in_row.dart';

import 'package:flutter/material.dart';
import 'package:ao/config/themes.dart';

void main() {
  runApp(const StartScreen());
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: bigDistance,
            right: (3 * smallDistance),
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
              GButton(
                onTap: () => MaterialPageRoute(
                    builder: (BuildContext context) => const VeriScreen()),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
