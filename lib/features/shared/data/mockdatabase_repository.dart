import 'dart:async';
import 'package:ao/features/shared/data/database_repository.dart';
import 'package:ao/features/shared/models/messages.dart';
import 'package:ao/features/shared/models/user.dart';

class MockDatabaseRepository implements DatabaseRepository {
  late final User currentUser;
  late final Message currentMessage;
  final List<User> _users = [];
  final List<Message> _messages = [];

  @override
  Future<List<User>> getAllUsers() async {
    await Future.delayed(Duration(seconds: 1));
    return _users;
  }

  @override
  Future<void> registerUser(currentUser) async {
    await Future.delayed(Duration(seconds: 1));
    _users.add(currentUser);
  }

  @override
  Future<bool> deleteUser(String currentUser) async {
    await Future.delayed(Duration(seconds: 1));
    _users.removeWhere((user) => user.userId == currentUser);
    return true;
  }

  @override
  Future<bool> isLoggedIn(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return _users
        .any((user) => user.name == username && user.password == password);
  }

  @override
  Future<String> sendMessage(Message currentMessage) async {
    await Future.delayed(Duration(seconds: 1));
    _messages.add(currentMessage);
    return ('Nachricht wurder versendet');
  }

  @override
  Future<void> deleteMessage(String messageId) async {
    await Future.delayed(Duration(seconds: 1));
    _messages.removeWhere((message) => message.id == messageId);
  }

  @override
  Future<List<Message>> getAllMessages() async {
    await Future.delayed(Duration(seconds: 1));
    return _messages;
  }

  @override
  Future<void> botFace() async {
    await Future.delayed(Duration(seconds: 1));
    print('Bot-Gesicht wird angezeigt');
  }

  @override
  Future<void> botChat(String userInput) async {
    await Future.delayed(Duration(seconds: 1));
    print('Bot: Hallo! Du hast geschrieben: $userInput');

    _messages.add(Message(
      sender: 'Bot',
      content: 'Deine Nachricht wird verarbeitet...',
      id: '',
    ));
  }

  @override
  Future<User> showUser(User user) async {
    await Future.delayed(Duration(seconds: 2));

    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      return _users[index];
    } else {
      throw Exception('User not found');
    }
  }
}
