import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/MainLayout.dart';

import 'model/AuthRepository.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    const String fixedUsername = "ooo@ooo.com";
    return MainLayout(
        title: "Home",
        child: Column(
          children: [
            firebaseUser != null ? Text("Logged in") : Text("Not logged in"),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Users');
                },
                child: const Text("Users")),
            TextButton(
                onPressed: () {
                  context.read<AuthRepository>().signIn(
                    email: (fixedUsername),
                    password: "Abcd1234!"
                  );
                },
                child: const Text("Log In $fixedUsername")),
            TextButton(
                onPressed: () {
                  context.read<AuthRepository>().signOut(
                );},
                child: const Text("Log Out")),
          ],
        ));
  }
}
