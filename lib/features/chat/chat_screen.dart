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
  late GenerativeModel model;

  Future startBot() async {
    // API access setupawait
    await dotenv.load(fileName: "mey.env");
    final apiKey = dotenv.env['Mey_Name'];

    // final apiKey = Platform.environment['MEY_NAME'];
    if (apiKey != null) {
      final model = GenerativeModel(model: 'Gemini 1.5 Flash', apiKey: apiKey);
      return model;
    }

    print('No \$MEY_NAME environment variable');
    exit(1);
  }

  //Create a GenerativeModel instance

  //final chat = model.();

  Future<void> _sendMessage() async {
    //  final chat = model.startChat();

    final prompt = _textController.text;
    _textController.clear();

    setState(() {
      _messages.add({'role': 'user', 'content': prompt});
    });

    try {
      final responses = model.generateContentStream([Content.text(prompt)]);

      setState(() {
        _messages.add({'role': 'assistant', 'content': responses});
      });
    } catch (e) {
      print('Error sending message: $e');
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': 'An error occurred. Please try again.'
        });
      });
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
                    onPressed: _sendMessage,
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
