import 'dart:convert';

import 'package:ao/config/keys.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatScreen());
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  createState() => _ChatScreenState();
}

Future<String> callGemini(String prompt) async {
  final url = Uri.parse(
      'https://api.openai.com/v1/chat/completions'); // Anpassen an Gemini-API
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
  final body = jsonEncode({
    'model': 'gemini 1.5', // gemini model anpassbar
    'messages': [
      {'role': 'user', 'content': prompt},
    ],
  });

  final response = await http.post(url, headers: headers, body: body);
  final data = jsonDecode(response.body);
  final message = data['choices'][0]['message']['content'];
  return message;
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() async {
    final prompt = _textController.text;
    _textController.clear();

    setState(() {
      _messages.add({'role': 'user', 'content': prompt});
    });

    final response = await callGemini(prompt);

    setState(() {
      _messages.add({'role': 'assistant', 'content': response});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat mit Gemini'),
      ),
      body: Column(
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
                        const InputDecoration(hintText: 'Nachricht senden'),
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
    );
  }
}
