import 'package:ao/features/shared/data/authrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ao/features/shared/models/user.dart';
import 'package:ao/features/shared/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<List<User?>> getAllUsers() async {
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(user) async {
    try {
      _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser(String userId) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn(String username, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> showUser(User user) async {
    // Not directly supported by Firebase Auth.
    // Consider using a separate Firestore service
    // to retrieve user data if needed.
    throw UnimplementedError();
  }

  @override
  Stream<User?> get currentUser => _firebaseAuth.authStateChanges().map((user) {
        if (user != null) {
          // You might want to fetch additional user data from Firestore here
          // and create a more complete User object.
          return User(userId: user.uid, email: user.email);
        }
        return null;
      });

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
