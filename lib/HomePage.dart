import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/MainLayout.dart';

import 'DisplayUserGrid.dart';
import 'model/AuthRepository.dart';
import 'model/ProfileRepository.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
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
                    email: ("ooo@ooo.ooo"),
                    password: "Abcd1234!"
                  );
                },
                child: const Text("Log In hi@hi.com")),
            TextButton(
                onPressed: () {
                  context.read<AuthRepository>().signOut(
                );},
                child: const Text("Log Out")),
          ],
        ));
  }
}
