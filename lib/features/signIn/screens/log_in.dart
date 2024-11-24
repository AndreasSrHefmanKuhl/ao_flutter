import 'package:ao/features/signIn/screens/hello_screen.dart';
import 'package:flutter/material.dart';

class MyLog extends StatefulWidget {
  const MyLog({super.key});

  @override
  State<MyLog> createState() => _MyLogState();
}

class _MyLogState extends State<MyLog> {
  /*const double smallStdSpace = 25;
 const smallVerticalSpace = SizedBox(height: smallStdSpace);
 const double stndPadding = 32;*/

  final String userInput = "Andi";
  final String userPassword = "666";

  final TextEditingController myUserNameController = TextEditingController();

  final TextEditingController myPasswordController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("UserInput : ${myUserNameController.text}"),
            const SizedBox(height: 25),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: myUserNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
                obscureText: showPassword,
                controller: myPasswordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(showPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                )),
            const SizedBox(height: 25),
            OutlinedButton(
              onPressed: () {
                myPasswordController.text == userPassword &&
                        myUserNameController.text == userInput
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HelloScreen()))
                    : print("netter Versuch");

                /*setState(() {
                    _messages.add(myUserNameController.text);
                    print(_messages.last);
                  })*/
              },
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }
}
