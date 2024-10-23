import 'package:ao/widgets/sign_in_row.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 150,
            right: 65,
            child: Column(children: [
              const SignInRow(),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  height: 35,
                  width: 250,
                  child: const Text(
                    ' register urself for membership',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  )),
            ]),
          ),
        ]),
      ),
    );
  }
}
