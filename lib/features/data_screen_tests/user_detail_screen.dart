import 'package:ao/features/shared/data/database_repository.dart';
import 'package:ao/features/shared/models/user.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final String userId;
  final DatabaseRepository repository;

  const UserDetailsScreen(
      {super.key, required this.userId, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Benutzerdetails')),
      body: FutureBuilder<User>(
        future: repository.showUser(User(
            name: 'Andi',
            password: '666',
            email: 'andi@andimail.com',
            userId: userId)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Fehler beim Laden des Benutzers: ${snapshot.error}');
          } else {
            final user = snapshot.data!;
            return Column(
              children: [
                Text('Name: ${user.name}'),
              ],
            );
          }
        },
      ),
    );
  }
}
