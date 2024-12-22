import 'package:ao/features/shared/data/authrepo.dart';
import 'package:ao/features/shared/models/messages.dart';
import 'package:ao/features/shared/models/user.dart';

class MockAuthRepository implements AuthRepository {
  late final User currentUser;
  late final Message currentMessage;
  final List<User> _users = [];
  final List<Message> _messages = [];

  @override
  Future<List<User>> getAllUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    return _users;
  }

  @override
  Future<void> registerUser(currentUser) async {
    await Future.delayed(const Duration(seconds: 1));
    _users.add(currentUser);
  }

  @override
  Future<bool> deleteUser(String currentUser) async {
    await Future.delayed(const Duration(seconds: 1));
    _users.removeWhere((user) => user.userId == currentUser);
    return true;
  }

  @override
  Future<bool> isLoggedIn(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return _users
        .any((user) => user.name == username && user.password == password);
  }

  @override
  Future<User> showUser(User user) async {
    await Future.delayed(const Duration(seconds: 2));

    final index = _users.indexWhere((u) => u.userId == user.userId);
    if (index != -1) {
      return _users[index];
    } else {
      throw Exception('User not found');
    }
  }
}
