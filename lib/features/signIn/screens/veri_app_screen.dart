import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const VeriScreen());
}

class VeriScreen extends StatelessWidget {
  const VeriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 150,
              left: 22,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome!',
                        style: TextStyle(
                            fontSize: 65, fontWeight: FontWeight.bold)),
                    Text('U have been successfully registered!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
          Positioned(
              bottom: 200,
              left: 120,
              child: UltButton(
                  bgColor: Colors.white54,
                  borderWidth: 1,
                  borderRadius: 12,
                  text: 'Main Menu',
                  textColor: Colors.black54,
                  btnHeight: 50,
                  btnWidth: 150,
                  borderColor: Colors.black54)),
        ]),
      ),
    );
  }
}
