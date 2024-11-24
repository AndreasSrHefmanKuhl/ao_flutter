import 'package:flutter/material.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  // brauchen wir damit alle textfield in form bleiben
  //final GlobalKey<FormState> _formKey = Global

  final TextEditingController myUserNameController = TextEditingController();
  final TextEditingController myConfirmController = TextEditingController();
  final TextEditingController myEmailController = TextEditingController();
  final TextEditingController myPasswordController = TextEditingController();

  bool showPassword = false;

  String? validEmail(String? value) {
    // E-Mail soll  nicht leer sein.
    if (value == null) return "E-Mail should contain characters";
    // E-Mail soll mindestens 5 Zeichen lang sein (a@b.d)
    if (value.length < 5) return "E-Mail is too short, at least 5 characters";
    // E-Mail soll ein "@" enthalten.
    if (value.contains("@")) return 'theres something left';
    return null;
  }

  String? validPassword(String? value) {
    if (value!.isEmpty || value.length < 4) return ("sieh zu und gib was ein!");

    return null;
  }

  String? confirmPassword(String? value) {
    if (myConfirmController.value != myPasswordController.text) {
      return ('HIER STIMMT WAS NICHT!');
    }

    return null;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "New Account?",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 25),

              //UserName
              TextFormField(
                validator: (String? value) {
                  if (value != null &&
                      (value.length < 3 || value.length > 32)) {
                    return "mach dir nochmal nen Kopf ; ) ";
                  }
                  return null;
                },
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
                validator: validEmail,
                keyboardType: TextInputType.name,
                controller: myEmailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "email",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 25),
              // Password

              TextFormField(
                  validator: validPassword,
                  obscureText: showPassword,
                  controller: myPasswordController,
                  decoration: InputDecoration(
                    hintText: "Passowrd",
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
              TextFormField(
                validator: confirmPassword,
                obscureText: showPassword,
                keyboardType: TextInputType.name,
                controller: myConfirmController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "confirm Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              // Email

              const SizedBox(height: 25),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("eingeloggt");
                  } else {
                    print("doof gelaufen");
                  }

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
      ),
    );
  }
}
