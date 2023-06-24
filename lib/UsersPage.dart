import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainLayout.dart';
import 'UserGrid.dart';
import 'model/ProfileRepository.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return MainLayout(
        title: "Users",
        child: Column(children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Register");
              },
              child: const Text("Register User")),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'User');
              },
              child: const Text("Get user")),
          TextButton(
              onPressed: () {
                Provider.of<ProfileRepository>(context, listen: false)
                    .updateFirstNameFixed();
              },
              child: const Text("Update user")),
          TextButton(
              onPressed: () {
                Provider.of<ProfileRepository>(context, listen: false)
                    .deleteFixedUser();
              },
              child: const Text("Delete user")),
          const Text("List of All Users"),
          firebaseUser != null ? UserGrid() : Text("Please log in to see list of users")
        ]));
  }
}
