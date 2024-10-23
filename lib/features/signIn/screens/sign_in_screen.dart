import 'package:flutter/material.dart';

void main() {
  runApp(const SignInScreen());
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            top: 100,
            child: SizedBox(
              width: 250,
              height: 100,
              child: (Expanded(
                  child: Text('Create an Account!',
                      style: TextStyle(
                        fontSize: 35,
                      )))),
            ),
          ),
        ]),
      ),
    );
  }
}
