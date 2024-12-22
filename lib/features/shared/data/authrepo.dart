import 'package:ao/features/shared/models/user.dart';

abstract class AuthRepository {
  // Alle vorhandenen User zurückgeben.
  Future<List<User>> getAllUsers();

  Future registerUser(User user);

  Future<User> showUser(User user);

  Future<bool> deleteUser(String userId);

  Future<bool> isLoggedIn(String username, String password);
}
