import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  //late GenerativeModel model;

  Future<void> startBot() async {
    try {
      await dotenv.load(fileName: '.env');

      var apiKey = dotenv.env['MEY_ENV'];

      if (apiKey != null) {
        final model =
            GenerativeModel(model: 'Gemini 1.5 Flash', apiKey: apiKey);

        print('GenerativeModel initialized successfully.');
      } else {
        print('No \$MEY_NAME environment variable found.');
      }
    } catch (e) {
      print('Error initializing GenerativeModel: $e');

      Future<void> _sendMessage(GenerativeModel model) async {
        final chat = model.startChat();

        final userInput = _textController.text;
        _textController.clear();
        final content =
            chat.sendMessage([Content.text(userInput)] as Content).toString();
        final response =
            await model.generateContent(content as Iterable<Content>);

        setState(() {
          _messages.add({'role': 'User', 'content': userInput});
        });

        try {
          final responses = (() {
            _messages.add({'role': 'Gemini', 'content': response});
          });
        } catch (e) {
          print('Error sending message: $e');
          setState(() {
            _messages.add({
              'role': 'assistant',
              'content': 'An error occurred. Please try again.()',
            });
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    startBot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Chat!'),
      ),
      body: Stack(fit: StackFit.expand, children: [
        const Image(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Text(message['content']),
                    trailing: Text(message['role']),
                  );
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration:
                          const InputDecoration(hintText: 'Send a message'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: sendMessage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
