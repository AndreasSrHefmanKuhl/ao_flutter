import 'package:ao/features/signIn/widgets/sign_in_row.dart';
import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
            bottom: 150,
            right: 90,
            child: Column(children: [
              SignInRow(
                width: 1,
                radius: 12,
                color: Colors.white70,
              ),
              SizedBox(height: 10),
              Row(children: [
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
              SizedBox(height: 10),
              UltButton(
                btnHeight: 35,
                btnWidth: 200,
                bgColor: Colors.transparent,
                borderRadius: 10,
                borderWidth: 1,
                text: 'Registry',
                textColor: Colors.white70,
                borderColor: Colors.white70,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
