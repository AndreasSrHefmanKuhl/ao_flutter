import 'package:ao/features/chat/models/bot.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final Bot _chatBot = Bot();

  Future<void> sendMessage() async {
    final userInput = _textController.text;
    _textController.clear();

    setState(() {
      _messages.add({'role': 'user', 'content': userInput});
    });

    final botResponse = _chatBot.botAnswer(userInput);

    setState(() {
      _messages.add({'role': 'assistant', 'content': botResponse});
    });
  }

  @override
  void initState() {
    super.initState();
    Bot();
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
                    onPressed: sendMessage,
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
