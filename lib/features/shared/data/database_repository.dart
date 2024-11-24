import 'package:ao/features/shared/models/messages.dart';
import 'package:ao/features/shared/models/user.dart';

abstract class DatabaseRepository {
  // Benutzer

  Future<List<User>> getAllUsers();

  Future registerUser(User user);

  Future<User> showUser(User user);

  Future<bool> deleteUser(String userId);

  Future<bool> isLoggedIn(String username, String password);

  // Nachrichten

  Future<String> sendMessage(Message message);

  Future<void> deleteMessage(String messageId);

  Future<List<Message>> getAllMessages();

  Future<void> botFace();

  Future<void> botChat(String userInput);
}
