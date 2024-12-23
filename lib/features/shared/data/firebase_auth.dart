import 'package:ao/features/shared/data/authrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ao/features/shared/models/user.dart';
import 'package:ao/features/shared/repositories/auth_repository.dart';
import 'package:firestore_converter/firestore_converter.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreConverter converter =const FirestoreConverter();

  @override
  Future<List<User?>> getAllUsers() async {
    final List<UserInfo> _users = _firebaseAuth.app.options.
   
  }

  @override
  Future<void> registerUser(String email, String password) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser(String currentUser) async {
    await _firebaseAuth.currentUser.delete();
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
  Future<User> showUser(Nutzer user) async {
    final user = await _firebaseAuth.currentUser;
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
