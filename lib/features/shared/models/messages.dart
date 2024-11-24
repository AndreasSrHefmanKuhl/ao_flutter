import 'package:flutter/material.dart';

abstract class Message extends StatelessWidget {
  String sender;
  String content;
  String receiver;
  String id;

  Message(
      {super.key,
      required this.sender,
      required this.receiver,
      required this.content,
      required this.id});
}
