import 'package:ao/config/colors.dart';
import 'package:ao/config/sizes.dart';
//import 'package:ao/config/themes.dart';
import 'package:ao/features/signIn/screens/veri_app_screen.dart';

import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:ao/features/signIn/widgets/veri_code_text.dart';
import 'package:ao/features/signIn/widgets/veri_row.dart';
import 'package:flutter/material.dart';

/*void main() {
  runApp(const VeriAppScreen());
}*/

class VeriScreen extends StatelessWidget {
  const VeriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Image(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const Positioned(
                  top: 140,
                  left: 8,
                  child: Expanded(
                    child: VeriCodeText(),
                  ),
                ),
                const Positioned(
                  left: 60,
                  bottom: 450,
                  child: VeriRow(),
                ),
                mediumVerticalSpace,
                Positioned(
                    left: 125,
                    bottom: 300,
                    child: UltButton(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VeriAppScreen())),
                        bgColor: bgColor,
                        borderWidth: btnBorderWidth,
                        borderRadius: btnBorderRadius,
                        text: 'Submit',
                        textColor: borderBlack,
                        btnHeight: btnHeightAlt,
                        btnWidth: btnWidthAlt,
                        borderColor: borderBlack)),
                const Positioned(
                  bottom: 150,
                  left: 100,
                  child: Column(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
