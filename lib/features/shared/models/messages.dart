import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  String sender;
  String content;

  String id;

  Message(
      {super.key,
      required this.sender,
      required this.content,
      required this.id});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
