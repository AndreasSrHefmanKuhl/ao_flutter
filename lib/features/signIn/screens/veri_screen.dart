import 'package:ao/features/signIn/widgets/sign_in_row.dart';
import 'package:ao/features/signIn/widgets/ult_button.dart';
import 'package:ao/features/signIn/widgets/veri_row.dart';
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
            top: 155,
            left: 8,
            child: Expanded(
              child: SizedBox(
                height: 250,
                width: 380,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Verification Code',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        Text('we have sended the Link to your Email account',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60,
            bottom: 450,
            child: VeriRow(),
          ),
          SizedBox(height: 50),
          Positioned(
              left: 125,
              bottom: 300,
              child: UltButton(
                  bgColor: Color.fromARGB(183, 253, 253, 253),
                  borderWidth: 2,
                  borderRadius: 12,
                  text: 'Submit',
                  textColor: Colors.black54,
                  btnHeight: 50,
                  btnWidth: 150,
                  borderColor: Colors.black54)),
          Positioned(
              bottom: 150,
              left: 100,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('or'),
                SizedBox(height: 10),
                SignInRow(
                  width: 2,
                  radius: 12,
                  color: Colors.black54,
                ),
              ])),
        ]),
      ),
    );
  }
}
