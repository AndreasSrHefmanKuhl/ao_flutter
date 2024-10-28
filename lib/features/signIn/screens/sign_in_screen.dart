import 'package:ao/config/colors.dart';
import 'package:ao/config/sizes.dart';
import 'package:ao/config/themes.dart';
import 'package:ao/features/signIn/widgets/input_field.dart';
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
    return MaterialApp(
      theme: lightTheme,
      home: const Scaffold(
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
                        fontSize: headlineTextSize,
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
                    InputField(text: "Name"),
                    smallVerticalSpace,
                    InputField(text: "Password"),
                    smallVerticalSpace,
                    InputField(text: "Email Adress"),
                    mediumVerticalSpace,
                    UltButton(
                        bgColor: Color.fromARGB(156, 255, 255, 255),
                        borderWidth: 1,
                        borderRadius: 12,
                        text: 'Create Account',
                        textColor: Colors.black87,
                        btnHeight: btnHeightAlt,
                        btnWidth: btnWidthAlt,
                        borderColor: Colors.black87),
                    mediumVerticalSpace,
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
                    minVerticalSpace,
                    SignInRow(
                        width: btnBorderWidth,
                        radius: btnBorderRadius,
                        color: borderBlack),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
