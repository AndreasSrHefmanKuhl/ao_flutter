import 'package:ao/features/signIn/widgets/sign_in_row.dart';
import 'package:ao/features/signIn/widgets/ult_button.dart';
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
            top: 130,
            left: 16,
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
          Positioned(
              top: 280,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 350,
                        height: 25,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(helperText: 'Name'),
                        )),
                    SizedBox(height: 30),
                    SizedBox(
                        width: 350,
                        height: 25,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(helperText: 'Password'),
                        )),
                    SizedBox(height: 30),
                    SizedBox(
                        width: 350,
                        height: 25,
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                          decoration:
                              InputDecoration(helperText: 'Email adress'),
                        )),
                    SizedBox(height: 60),
                    UltButton(
                        bgColor: Color.fromARGB(156, 255, 255, 255),
                        borderWidth: 1,
                        borderRadius: 12,
                        text: 'Create Account',
                        textColor: Colors.black87,
                        btnHeight: 40,
                        btnWidth: 150,
                        borderColor: Colors.black87),
                    SizedBox(height: 65),
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
                    SizedBox(height: 15),
                    SignInRow(width: 3, radius: 12, color: Colors.black87),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
