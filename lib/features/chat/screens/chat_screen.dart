import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  late GenerativeModel model;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _input = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> startChat() async {
    try {
      await dotenv.load(fileName: '.env');

      var apiKey = dotenv.env['MEY_ENV'];

      if (apiKey != null) {
        model = GenerativeModel(
          model: 'Gemini 1.5 Flash',
          apiKey: apiKey,
        );
        print('GenerativeModel initialized successfully.');
      } else {
        throw ('No \$MEY_ENV environment variable found.');
      }
    } catch (e) {
      throw ('Error initializing GenerativeModel: $e');
    }
  }

  void sendMessage() async {
    final userInput = _textController.text;
    _textController.clear();

    final chat = model.startChat();

    try {
      // Send message und update UI

      _textController.clear();

      setState(() {
        _messages.add({'role': 'User', 'content': userInput});
      });

      // KI respons
      final response = await chat.sendMessage(Content.text(userInput));
      setState(() {
        _messages.add({'role': 'Gemini', 'content': response.text});
      });
    } catch (e) {
      // error handling
      setState(() {
        _messages.add({'role': 'Error', 'content': 'Error: $e'});
      });
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => Text('onStatus: $val'),
        onError: (val) => Text('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _input = val.recognizedWords;
            _textController.text = _input;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();

      if (_input.isNotEmpty) {
        _textController.text = _input;
        sendMessage();
        _input = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'),
      ),
      body: FutureBuilder(
        future: startChat(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          } else {
            return Stack(
              fit: StackFit.expand,
              children: [
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
                              decoration: const InputDecoration(
                                hintText: 'Send a message',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: sendMessage,
                          ),
                          IconButton(
                            icon: const Icon(Icons.phone_in_talk),
                            onPressed: _listen,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
