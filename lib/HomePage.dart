import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/MainLayout.dart';

import 'model/AuthRepository.dart';
import 'model/Profile.dart';
import 'model/ProfileRepository.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    const String fixedUsername = "xxx@ooo.com";
    return MainLayout(
        title: "Home",
        child: Column(
          children: [
            firebaseUser != null ? Text("Logged in") : Text("Not logged in"),
            firebaseUser != null ? Text("Welcome ${firebaseUser.email}") : Text(
                "Not logged in"),
            // Use the current authorized user in firebase to retrieve the
            //   user's profile from the profile repository
            firebaseUser != null ?
            FutureBuilder<Profile>(
                future: Provider.of<ProfileRepository>(context, listen: false)
                    .getUser(username: firebaseUser.email!),
                builder: (context, AsyncSnapshot<Profile> user) {
                  if (!user.hasData) {
                    return CircularProgressIndicator();
                  } else if (user.data!.isNoUser()) {
                    return Text("User not found");
                  }
                  else {
                    return Text("Welcome ${user.data!.first}");
                  }
                }) : Text(""),
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
                  );
                },
                child: const Text("Log Out")),
          ],
        ));
  }
}
