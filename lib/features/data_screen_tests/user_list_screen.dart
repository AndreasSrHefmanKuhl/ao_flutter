import 'package:ao/features/shared/data/database_repository.dart';
import 'package:ao/features/shared/models/user.dart';

import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  final DatabaseRepository repository;

  const UserListScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Benutzerliste')),
      body: FutureBuilder<List<User>>(
        future: repository.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Fehler beim Laden der Benutzer: ${snapshot.error}');
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
