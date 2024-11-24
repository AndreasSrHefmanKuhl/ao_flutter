import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String name;
  final String password;
  final String email;
  final String id;

  const User({
    super.key,
    required this.name,
    required this.password,
    required this.email,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
