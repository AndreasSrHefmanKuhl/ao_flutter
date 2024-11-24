import 'package:ao/config/colors.dart';
import 'package:ao/config/sizes.dart';
import 'package:ao/features/main_menu/screens/main_screen.dart';
import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const VeriAppScreen());
}

class VeriAppScreen extends StatelessWidget {
  const VeriAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        const Image(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
        const Positioned(
            top: 150,
            left: 22,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome!',
                      style: TextStyle(
                          fontSize: headlineTextSizeAlt,
                          fontWeight: FontWeight.bold)),
                  Text('U have been successfully registered!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ])),
        Positioned(
            bottom: 200,
            left: 120,
            child: GestureDetector(
                onTap: () =>
                    MaterialPageRoute(builder: (context) => const MyMainMenu()),
                child: const UltButton(
                    bgColor: bgColor,
                    borderWidth: btnBorderWidth,
                    borderRadius: btnBorderRadius,
                    text: 'Main Menu',
                    textColor: borderBlack,
                    btnHeight: btnHeightAlt,
                    btnWidth: btnWidthAlt,
                    borderColor: borderBlack))),
      ]),
    );
  }
}
